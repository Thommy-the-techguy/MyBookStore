package com.af.controller;

import com.af.dao.AuthorRepo;
import com.af.dao.BookRepo;
import com.af.dao.CategoryRepo;
import com.af.entity.*;
import jakarta.servlet.ServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
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
    private final ServletRequest httpServletRequest;

    @Autowired
    public HomeController(AuthorRepo authorRepo, BookRepo bookRepo, CategoryRepo categoryRepo, @Qualifier("httpServletRequest") ServletRequest httpServletRequest) {
        this.authorRepo = authorRepo;
        this.bookRepo = bookRepo;
        this.categoryRepo = categoryRepo;
        this.httpServletRequest = httpServletRequest;
    }

    @GetMapping("/")
    public String getHome() {
        return "home";
    }

    @GetMapping("/cart")
    public String getShoppingCartPage(Model model) {
        model.addAttribute("currentUser", getCurrentUser());

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
    public void addToCart(Model model,
                          @RequestParam(name = "category") String category,
                          @RequestParam(name = "author", required = false) List<Long> authorIds,
                          @RequestParam(name = "year", required = false) List<Integer> yearIds) {

        model.asMap().put("books", getBooksWithParams(category, authorIds, yearIds));
        System.out.println("added to cart"); //TODO: add to cart functionality, connect to user
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
    private List<Author> getAllAuthors() {
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
