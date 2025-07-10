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
        List<Product> allProducts = new ArrayList<>();
        String category = request.getParameter("category");
        String errorMessage = null;

        try {
            Class.forName("org.postgresql.Driver");
            try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {

                String sql;
                if (category != null && !category.isEmpty()) {
                    sql = "SELECT * FROM products WHERE LOWER(category) = LOWER(?) ORDER BY id DESC";
                } else {
                    sql = "SELECT * FROM products ORDER BY id DESC";
                }

                try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                    if (category != null && !category.isEmpty()) {
                        pstmt.setString(1, category);
                    }

                    try (ResultSet rs = pstmt.executeQuery()) {
                        while (rs.next()) {
                            Product product = mapResultSetToProduct(rs);
                            allProducts.add(product);
                        }
                    }
                }

            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            errorMessage = "PostgreSQL driver topilmadi: " + e.getMessage();
        } catch (SQLException e) {
            e.printStackTrace();
            errorMessage = "Bazaga ulanishda xatolik: " + e.getMessage();
        }

        request.setAttribute("allProducts", allProducts);
        if (errorMessage != null) {
            request.setAttribute("errorMessage", errorMessage);
        }

        request.getRequestDispatcher("/main.jsp").forward(request, response);
    }

    private Product mapResultSetToProduct(ResultSet rs) throws SQLException {
        Product product = new Product();
        product.setId(rs.getLong("id"));
        product.setName(rs.getString("name"));
        product.setImageUrl(rs.getString("image_url"));
        product.setPrice(rs.getInt("price"));
        product.setOldPrice(rs.getInt("old_price"));
        product.setRating(rs.getDouble("rating"));
        product.setReviewCount(rs.getInt("review_count"));
        product.setCreditPricePerMonth(rs.getInt("credit_price_per_month"));
        product.setHasCredit(rs.getBoolean("has_credit"));
        product.setIsSuperPrice(rs.getBoolean("is_super_price"));
        return product;
    }
}
