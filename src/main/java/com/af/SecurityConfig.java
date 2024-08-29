package com.af;

import com.af.dao.UserRepo;
import com.af.entity.User;
import jakarta.servlet.DispatcherType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import java.util.Optional;

@Configuration
//@EnableWebSecurity
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
                    .requestMatchers("/", "/login**", "/register**", "/static/**")
                    .permitAll()
                    .requestMatchers("/books**", "/cart**")
                    .hasRole("USER")
                    .dispatcherTypeMatchers(DispatcherType.FORWARD)
                    .permitAll()
                    .dispatcherTypeMatchers(DispatcherType.REQUEST)
                    .permitAll();

        }).formLogin(loginCustomizer -> {
            loginCustomizer
                    .loginPage("/login")
                    .loginProcessingUrl("/login")
                    .usernameParameter("username")
                    .passwordParameter("password")
                    .defaultSuccessUrl("/", true)
                    .permitAll();
        }).logout(logoutCustomizer -> {
            logoutCustomizer
                    .logoutUrl("/logout")
                    .logoutSuccessUrl("/")
                    .permitAll();
        }).httpBasic(Customizer.withDefaults())
                .csrf(AbstractHttpConfigurer::disable)
                .build();
    }

    @Bean
    public UserDetailsService userDetailsService() {
        return username -> {
            Optional<User> maybeUser = userRepo.findUserByUsername(username);

            return maybeUser.orElseThrow(() -> new UsernameNotFoundException(username));
        };
    }
}
