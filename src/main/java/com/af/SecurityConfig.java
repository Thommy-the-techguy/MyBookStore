package com.af;

import com.af.dao.UserRepo;
import com.af.entity.User;
import com.af.enums.Role;
import jakarta.servlet.DispatcherType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
    private final UserRepo userRepo;

    public SecurityConfig(@Autowired UserRepo userRepo) {
        this.userRepo = userRepo;
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        return http.authorizeHttpRequests(httpRequestCustomizer -> {
            httpRequestCustomizer
                    .requestMatchers("/", "/register", "/static/**")
                    .permitAll()
                    .requestMatchers("/books**")
                    .hasRole("USER")
                    .dispatcherTypeMatchers(DispatcherType.FORWARD)
                    .permitAll();
        }).formLogin(loginCustomizer -> {
            loginCustomizer
                    .loginPage("/login")
                    .loginProcessingUrl("/login")
                    .usernameParameter("username")
                    .passwordParameter("password")
//                    .successForwardUrl("/")
                    .permitAll();
        }).logout(logoutCustomizer -> {
            logoutCustomizer
                    .logoutUrl("/logout")
                    .logoutSuccessUrl("/")
                    .permitAll();
        }).build();
    }

    @Bean
    public UserDetailsService userDetailsService() {
        InMemoryUserDetailsManager userDetailsService = new InMemoryUserDetailsManager();
        userDetailsService.createUser(new User("user", "password", Role.USER));
        return userDetailsService;
    }
}
