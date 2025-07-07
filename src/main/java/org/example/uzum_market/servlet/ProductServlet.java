package org.example.uzum_market.servlet;

import org.example.uzum_market.entity.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "productServlet", value = "/products") // Agar bu servletni ishlatmoqchi bo'lsangiz, MainPagServlet bilan yo'lni konfliktga kiritmaslik uchun `/products` ga o'zgartirilgan.
public class ProductServlet extends HttpServlet {

    private static final String JDBC_URL = "jdbc:postgresql://localhost:5432/uzum_db";
    private static final String JDBC_USER = "postgres";
    private static final String JDBC_PASSWORD = "1111";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> recommendedProducts = new ArrayList<>();
        List<Product> discountedProducts = new ArrayList<>();
        String errorMessage = null;

        try {
            Class.forName("org.postgresql.Driver");

            try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
                String recommendedSql = "SELECT * FROM products ORDER BY id DESC LIMIT 8";
                try (PreparedStatement pstmt = conn.prepareStatement(recommendedSql);
                     ResultSet rs = pstmt.executeQuery()) {
                    while (rs.next()) {
                        Product product = mapResultSetToProduct(rs);
                        recommendedProducts.add(product);
                    }
                }

                String discountedSql = "SELECT * FROM products WHERE old_price IS NOT NULL AND price < old_price ORDER BY (old_price - price) DESC LIMIT 8";
                try (PreparedStatement pstmt = conn.prepareStatement(discountedSql);
                     ResultSet rs = pstmt.executeQuery()) {
                    while (rs.next()) {
                        Product product = mapResultSetToProduct(rs);
                        discountedProducts.add(product);
                    }
                }

            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            errorMessage = "PostgreSQL JDBC driver topilmadi. Xato: " + e.getMessage();
        } catch (SQLException e) {
            e.printStackTrace();
            errorMessage = "Ma'lumotlar bazasi ulanishi yoki so'rov xatosi: " + e.getMessage();
        }

        request.setAttribute("recommendedProducts", recommendedProducts);
        request.setAttribute("discountedProducts", discountedProducts);
        if (errorMessage != null) {
            request.setAttribute("errorMessage", errorMessage);
        }

        request.getRequestDispatcher("/main.jsp").forward(request, response);
    }

    private Product mapResultSetToProduct(ResultSet rs) throws SQLException {
        Product product = new Product();
        product.setId(rs.getLong("id"));
        product.setName(rs.getString("name"));
        product.setImageUrl(rs.getString("image_url")); // image_url ustuni nomi
        product.setPrice(rs.getInt("price"));

        // oldPrice int bo'lganligi sababli, getInt ishlatamiz. Agar NULL bo'lsa, 0 qaytadi.
        product.setOldPrice(rs.getInt("old_price"));

        product.setRating(rs.getDouble("rating"));
        product.setReviewCount(rs.getInt("review_count"));

        // creditPricePerMonth int bo'lganligi sababli, getInt ishlatamiz.
        product.setCreditPricePerMonth(rs.getInt("credit_price_per_month"));

        // hasCredit boolean bo'lganligi sababli, getBoolean ishlatamiz.
        product.setHasCredit(rs.getBoolean("has_credit"));

        product.setIsSuperPrice(rs.getBoolean("is_super_price"));
        return product;
    }
}