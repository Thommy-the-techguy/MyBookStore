package com.af.controller;

import com.af.dao.AuthorDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    private final AuthorDao authorDao;

    @Autowired
    public HomeController(AuthorDao authorDao) {
        this.authorDao = authorDao;
    }

    @GetMapping("/")
    public String getHome() {
        return "home";
    }

    @GetMapping("/author")
    public String getAuthors(Model model) {
        model.addAttribute("authors", authorDao.getAuthors());

        return "home";
    }
}
