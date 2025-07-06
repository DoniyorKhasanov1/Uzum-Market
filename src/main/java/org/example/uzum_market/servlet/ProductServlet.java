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

@WebServlet(name = "productServlet", value = "/products")
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
                String recommendedSql = "SELECT * FROM products ORDER BY id DESC LIMIT 8"; // Yangiladim: DESC, eng yangi mahsulotlarni ko'rsatish uchun
                try (PreparedStatement pstmt = conn.prepareStatement(recommendedSql);
                     ResultSet rs = pstmt.executeQuery()) {
                    while (rs.next()) {
                        Product product = mapResultSetToProduct(rs);
                        recommendedProducts.add(product);
                    }
                }


                String discountedSql = "SELECT * FROM products WHERE oldPrice IS NOT NULL AND price < oldPrice ORDER BY id DESC LIMIT 8";
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
        product.setImageUrl(rs.getString("imageUrl"));
        product.setPrice(rs.getInt("price"));

        Object oldPriceObj = rs.getObject("oldPrice");
        product.setOldPrice(oldPriceObj != null ? (int) oldPriceObj : 0);

        product.setRating(rs.getDouble("rating"));
        product.setReviewCount(rs.getInt("reviewCount"));

        Object creditPriceObj = rs.getObject("creditPricePerMonth");
        product.setCreditPricePerMonth(creditPriceObj != null ? rs.getInt("creditPricePerMonth") : 0);

        Object hasCreditObj = rs.getObject("hasCredit");
        product.setHasCredit(hasCreditObj != null ? rs.getBoolean("hasCredit") : false);


        product.setSuperPrice(rs.getBoolean("isSuperPrice"));
        return product;
    }
}