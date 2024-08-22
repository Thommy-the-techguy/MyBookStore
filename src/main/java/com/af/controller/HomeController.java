package com.af.controller;

import com.af.dao.AuthorRepo;
import com.af.dao.BookRepo;
import com.af.dao.CategoryRepo;
import com.af.entity.Book;
import com.af.entity.BookCategory;
import com.af.entity.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.*;

@Controller
public class HomeController {
    private final AuthorRepo authorRepo;
    private final BookRepo bookRepo;
    private final CategoryRepo categoryRepo;

    @Autowired
    public HomeController(AuthorRepo authorRepo, BookRepo bookRepo, CategoryRepo categoryRepo) {
        this.authorRepo = authorRepo;
        this.bookRepo = bookRepo;
        this.categoryRepo = categoryRepo;
    }

    @GetMapping("/")
    public String getHome() {
        return "home";
    }

    @GetMapping("/books")
    public String getCategorizedPage(Model model,
                                     @RequestParam(name = "category") String category,
                                     @RequestParam(name = "author", required = false) List<Long> authorIds,
                                     @RequestParam(name = "year", required = false) List<Integer> yearIds) {
        if (yearIds != null && authorIds != null) {
            model.asMap().put("books", bookRepo.getBooksByCategoryAndAuthorAndBookYear(Integer.parseInt(category), authorIds, yearIds));
        } else if (yearIds != null) {
            model.asMap().put("books", bookRepo.getBooksByCategoryAndYear(Integer.parseInt(category), yearIds));
        } else if (authorIds != null) {
            model.asMap().put("books", bookRepo.getBooksByCategoryAndAuthor(Integer.parseInt(category), authorIds));
        } else {
            model.asMap().put("books", bookRepo.getBooksByCategory(Integer.parseInt(category)));
        }
        model.addAttribute("categoryBookAmountMap", calculateBooksForEachCategory());
        model.addAttribute("authors", authorRepo.getAll());

        return "books";
    }

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
}
