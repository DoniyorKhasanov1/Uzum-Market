package org.example.uzum_market.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Table(name = "products") // Jadval nomini aniq ko'rsatish tavsiya etiladi.
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    @Column(name = "image_url")
    private String imageUrl;

    private int price;

    @Column(name = "old_price")
    private int oldPrice;

    private double rating;

    @Column(name = "review_count")
    private int reviewCount;

    @Column(name = "credit_price_per_month")
    private int creditPricePerMonth;

    @Column(name = "has_credit")
    private boolean hasCredit;

    @Column(name = "is_super_price")
    private boolean isSuperPrice;

}