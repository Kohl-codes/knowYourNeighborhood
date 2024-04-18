package com.springboot.kynspringboot.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class SecurityConfig{
	
	@Bean
	PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
    SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http	
        	.csrf(
        			csrf -> csrf.disable()
        	)
        	.authorizeRequests( auth -> {
                auth.requestMatchers("/").permitAll();
                auth.requestMatchers("/login").permitAll();
                auth.requestMatchers("/ViewStore").hasRole("VIEW_CONTACT");
                auth.requestMatchers("/StoreInfo").hasRole("ADD_CONTACT");
        	})
            .formLogin(
                        form -> form
                                .loginPage("/login")
                                .loginProcessingUrl("/login")
                                .failureUrl("/login_error")
                                .defaultSuccessUrl("/ViewStore")
                                .permitAll()
             )
             .logout(
                        logout -> logout
                                .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
                                .permitAll()

              );
        return http.build();
    }

}

