package com.af.controller;

import com.af.dao.AuthorDao;
import com.af.dao.BookDao;
import com.af.dao.CategoryDao;
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
    private final AuthorDao authorDao;
    private final BookDao bookDao;
    private final CategoryDao categoryDao;

    @Autowired
    public HomeController(AuthorDao authorDao, BookDao bookDao, CategoryDao categoryDao) {
        this.authorDao = authorDao;
        this.bookDao = bookDao;
        this.categoryDao = categoryDao;
    }

    @GetMapping("/")
    public String getHome() {
        return "home";
    }

    @GetMapping("/books")
    public String getCategorizedPage(Model model,
                                     @RequestParam(name = "category") String category,
                                     @RequestParam(name = "author", required = false) List<Integer> authorIds,
                                     @RequestParam(name = "year", required = false) List<Integer> yearIds) {
        if (yearIds != null && authorIds != null) {
            model.asMap().put("books", bookDao.getBooksByCategoryAndAuthorAndBookYear(Integer.parseInt(category), authorIds, yearIds));
        } else if (yearIds != null) {
            model.asMap().put("books", bookDao.getBooksByCategoryAndYear(Integer.parseInt(category), yearIds));
        } else if (authorIds != null) {
            model.asMap().put("books", bookDao.getBooksByCategoryAndAuthor(Integer.parseInt(category), authorIds));
        } else {
            model.asMap().put("books", bookDao.getBooksByCategory(Integer.parseInt(category)));
        }
        model.addAttribute("categoryBookAmountMap", calculateBooksForEachCategory());
        model.addAttribute("authors", authorDao.getAuthors());

        return "books";
    }

    private Map<Category, Integer> calculateBooksForEachCategory() {
        Map<Category, Integer> categoryAmountMap = new HashMap<>();
        List<Category> categories = categoryDao.getAllCategories();
        List<Book> books = bookDao.getBooks();

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
