package com.example.newchat.Utils;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import com.example.newchat.repository.Userrepositroy;
import com.example.newchat.services.CustomuserDetail;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@Component
public class AuthencationFilter extends OncePerRequestFilter {

    @Autowired
    Userrepositroy userrepositroy;
    @Autowired
    CustomuserDetail customuserDetail;
    @Autowired 
    JwtGeneration jwtGeneration;
    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
            throws ServletException, IOException {
                String header=request.getHeader("Authorization");

            if(header!=null&&header.startsWith("Bearer ")){
                String jwt=header.substring(7);
                String email=jwtGeneration.ExtractUsername(jwt);
                if(email!=null&&SecurityContextHolder.getContext().getAuthentication()==null){
        UserDetails userDetails=customuserDetail.loadUserByUsername(email);
                if(jwtGeneration.validatetoken(jwt, userDetails)){
                    UsernamePasswordAuthenticationToken authenticationToken=(new UsernamePasswordAuthenticationToken(userDetails,null,userDetails.getAuthorities()));
                
                authenticationToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
            SecurityContextHolder.getContext().setAuthentication(authenticationToken);    
            
            }
    

    }
                        }

        filterChain.doFilter(request, response);
    }

}
