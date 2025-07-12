package com.example.newchat.Utils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;
import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import javax.crypto.SecretKey;

@Component
public class JwtGeneration {
    private final SecretKey secret= Keys.secretKeyFor(SignatureAlgorithm.HS256);
    public String tokengenerator( String email){
    return Jwts.builder().
    setSubject(email).
    setIssuedAt(new Date()).setExpiration(Date.from(Instant.now().plus(7,ChronoUnit.DAYS))).
    signWith(SignatureAlgorithm.HS256,secret).
    compact();
    }

    public String ExtractUsername(String token){
        return Jwts.parser().setSigningKey(secret).parseClaimsJws(token).getBody().getSubject();
    }

    

   public boolean validatetoken(String token, UserDetails userDetails) {
    String username = ExtractUsername(token);
    return username.equals(userDetails.getUsername()); // ✅ Correct comparison
}



    
}
