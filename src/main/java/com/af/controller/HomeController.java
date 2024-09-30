package com.af.controller;

import com.af.dao.*;
import com.af.entity.*;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.*;

@Controller
public class HomeController {
    private final AuthorRepo authorRepo;
    private final BookRepo bookRepo;
    private final CategoryRepo categoryRepo;
    private final CartRepo cartRepo;
    @PersistenceContext
    private EntityManager entityManager;

    @Autowired
    public HomeController(AuthorRepo authorRepo, BookRepo bookRepo, CategoryRepo categoryRepo, CartRepo cartRepo) {
        this.authorRepo = authorRepo;
        this.bookRepo = bookRepo;
        this.cartRepo = cartRepo;
        this.categoryRepo = categoryRepo;
    }

    @GetMapping("/")
    public String getHome() {
        return "home";
    }

    @GetMapping("/cart")
    public String getShoppingCartPage(Model model,
                                      @RequestParam(name = "paymentComplete", required = false) boolean paymentComplete) {
        model.addAttribute("currentUser", getCurrentUser());

        if (paymentComplete) {
            return "shopping-cart2";
        }

        return "shopping-cart";
    }

    @PostMapping("/cart/pay")
    public String performPayment() {
        getCurrentUser().getCartList().clear();
        cartRepo.deleteAllByUserId(getCurrentUser().getUserId());

        return "redirect:/cart?paymentComplete=true";
    }
    
    @PostMapping("/cart")
    public String removeBookFromCart(Model model, @RequestParam(name = "bookId") long bookId) {
        User currentUser = getCurrentUser();
    	Optional<Cart> maybeCart = cartRepo.getCartByUserIdAndBookId(currentUser.getUserId(), bookId);

    	if (maybeCart.isPresent()) {
    	    currentUser.getCartList().remove(maybeCart.get());
    	    maybeCart.get().getBook().getCartList().remove(maybeCart.get());
    	    cartRepo.delete(maybeCart.get());

    	    model.asMap().put("currentUser", currentUser);
        }

    	return "shopping-cart";
    }

    @GetMapping("/books")
    public String getCategorizedPage(Model model,
                                     @RequestParam(name = "category") String category,
                                     @RequestParam(name = "author", required = false) List<Long> authorIds,
                                     @RequestParam(name = "year", required = false) List<Integer> yearIds) {

        model.asMap().put("books", getBooksWithParams(category, authorIds, yearIds));

        return "books";
    }

    @PostMapping("/books")
    public String addToCart(Model model,
                          @RequestParam(name = "category") String category,
                          @RequestParam(name = "author", required = false) List<Long> authorIds,
                          @RequestParam(name = "year", required = false) List<Integer> yearIds,
                          @RequestParam(name = "bookId") long bookId) {

        model.asMap().put("books", getBooksWithParams(category, authorIds, yearIds));

        Optional<Book> maybeBook = bookRepo.findById(bookId);

        if (maybeBook.isPresent()) {
            Book book = maybeBook.get();
            Cart cart = new Cart(getCurrentUser(), book);

            cartRepo.save(cart);
            getCurrentUser().getCartList().add(cart);
        }

        return returnRedirectURL(category, authorIds, yearIds);
    }

    @PostMapping("/books/search")
    public String searchItem(Model model, @RequestParam(name = "itemName") String itemName) {
        List<Book> searchResult = bookRepo.getBookByBookNameLike("%" + itemName + "%");
        model.asMap().put("searchResult", searchResult);

        return "books-search";
    }

    private String returnRedirectURL(String category, List<Long> authorIds, List<Integer> yearIds) {
        StringBuilder sb = new StringBuilder(String.format("redirect:/books?category=%s", category));

        if (authorIds != null) {
            for (long authorId : authorIds) {
                sb.append("&authorId=").append(authorId);
            }
        }

        if (yearIds != null) {
            for (int yearId : yearIds) {
                sb.append("&yearId=").append(yearId);
            }
        }

        return sb.toString();
    }

    private List<Book> getBooksWithParams(String category, List<Long> authorIds, List<Integer> yearIds) {
        if (yearIds != null && authorIds != null) {
            return bookRepo.getBooksByCategoryAndAuthorAndBookYear(Integer.parseInt(category), authorIds, yearIds);
        } else if (yearIds != null) {
            return bookRepo.getBooksByCategoryAndYear(Integer.parseInt(category), yearIds);
        } else if (authorIds != null) {
            return bookRepo.getBooksByCategoryAndAuthor(Integer.parseInt(category), authorIds);
        } else {
            return bookRepo.getBooksByCategory(Integer.parseInt(category));
        }
    }

    @ModelAttribute("authors")
    public List<Author> getAllAuthors() {
        return authorRepo.getAll();
    }

    @ModelAttribute("categoryBookAmountMap")
    private Map<Category, Integer> calculateBooksForEachCategory() {
        Map<Category, Integer> categoryAmountMap = new HashMap<>();
        List<Category> categories = categoryRepo.getAll();
        List<Book> books = bookRepo.getAll();

        for (Category category : categories) {
            int booksAmount = 0;

            for (Book book : books) {
                if (book.getBookCategories().contains(new BookCategory(book, category))) {
                    booksAmount++;
                }
            }

            categoryAmountMap.put(category, booksAmount);
        }

        return categoryAmountMap;
    }

    private User getCurrentUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User currentUser = (User) authentication.getPrincipal();

        return currentUser;
    }
}
