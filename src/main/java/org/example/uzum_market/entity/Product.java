package org.example.uzum_market.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Table(name = "products")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;

    @Column(name = "image_url", nullable = false)
    private String imageUrl;

    @Column(nullable = false)
    private Integer price;

    @Column(name = "old_price")
    private Integer oldPrice;

    private Double rating;

    @Column(name = "review_count")
    private Integer reviewCount;

    @Column(name = "credit_price_per_month")
    private Integer creditPricePerMonth;

    @Column(name = "has_credit")
    private Boolean hasCredit;

    @Column(name = "is_super_price")
    private Boolean isSuperPrice;

    @Column(name = "is_recommended")
    private Boolean isRecommended;

    @Column(name = "category")
    private String category;
}