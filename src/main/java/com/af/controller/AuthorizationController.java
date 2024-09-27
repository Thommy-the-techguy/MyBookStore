package com.af.controller;

import com.af.dao.UserRepo;
import com.af.dto.AuthorizationForm;
import com.af.entity.User;
import com.af.enums.Role;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


@Controller
public class AuthorizationController {
    private final UserRepo userRepo;
    private final PasswordEncoder passwordEncoder;
    private final AuthenticationManager authenticationManager;

    @Autowired
    public AuthorizationController(UserRepo userRepo,
                                   PasswordEncoder passwordEncoder,
                                   AuthenticationConfiguration authenticationConfiguration) throws Exception {
        this.userRepo = userRepo;
        this.passwordEncoder = passwordEncoder;
        this.authenticationManager = authenticationConfiguration.getAuthenticationManager();
    }

    @GetMapping("/login")
    public String getLoginPage() {
        return "login";
    }

    @ModelAttribute(name = "authForm")
    public AuthorizationForm authorizationForm() {
        return new AuthorizationForm();
    }

    @GetMapping("/register")
    public String getRegisterPage() {
        return "register";
    }

    @PostMapping(value = "/register")
    public String registerUser(@ModelAttribute AuthorizationForm loginForm,
                               @Autowired HttpServletRequest request) {
        String username = loginForm.getUsername();
        String password = loginForm.getPassword();

        User newUser = new User(username, passwordEncoder.encode(password), Role.USER);
        userRepo.save(newUser);

        try {
            Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(
                    username,
                    password,
                    newUser.getAuthorities())
            );

            SecurityContext securityContext = SecurityContextHolder.createEmptyContext();
            securityContext.setAuthentication(authentication);
            SecurityContextHolder.setContext(securityContext);

            HttpSession session = request.getSession();
            session.setAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY, securityContext);
        } catch (AuthenticationException e) {
            return "redirect:/login?error";
        }


        return "redirect:/";
    }
}
