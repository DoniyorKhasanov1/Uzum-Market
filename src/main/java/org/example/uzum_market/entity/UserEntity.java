package org.example.uzum_market.entity;

import jakarta.persistence.*;
import lombok.*;
import org.example.uzum_market.annotations.EmailValidation;

/**
 * Definition: {@link UserEntity} is a JPA entity class that represents a user.
 * It contains fields for user's full name and email.
 * {@link UserEntity} is used to store user data in database.
 * @since : 2025-07-09
 * @version 1.0*/

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Builder
@Entity
@Table(name = "users")
public class UserEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "full_name", nullable = false)
    private String fullName;
    @EmailValidation
    @Column(name = "user_email", unique = true, nullable = false)
    private String email;

}
