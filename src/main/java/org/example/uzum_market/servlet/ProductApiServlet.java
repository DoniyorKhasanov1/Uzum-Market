package org.example.uzum_market.servlet;

import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.uzum_market.config.JPAUtil;
import org.example.uzum_market.entity.Product;
import org.example.uzum_market.repository.ProductRepository;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "productApiServlet", value = "/api/product")
public class ProductApiServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EntityManager em = JPAUtil.getEntityManager();
        response.setContentType("application/json; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        try {
            String idParam = request.getParameter("id");
            if (idParam == null) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Product ID is required");
                return;
            }

            Long id = Long.parseLong(idParam);
            ProductRepository productRepository = new ProductRepository(em);
            Product product = productRepository.findById(id);

            if (product == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found");
                return;
            }

            String jsonResponse = String.format(
                    "{\"id\":%d,\"name\":\"%s\",\"imageUrl\":\"%s\",\"price\":%d,\"oldPrice\":%d,\"rating\":%f,\"reviewCount\":%d,\"creditPricePerMonth\":%d,\"hasCredit\":%b,\"isSuperPrice\":%b,\"isRecommended\":%b,\"category\":\"%s\"}",
                    product.getId(), product.getName(), product.getImageUrl(), product.getPrice(),
                    product.getOldPrice() != null ? product.getOldPrice() : 0, product.getRating() != null ? product.getRating() : 0.0,
                    product.getReviewCount() != null ? product.getReviewCount() : 0,
                    product.getCreditPricePerMonth() != null ? product.getCreditPricePerMonth() : 0,
                    product.getHasCredit() != null ? product.getHasCredit() : false,
                    product.getIsSuperPrice() != null ? product.getIsSuperPrice() : false,
                    product.getIsRecommended() != null ? product.getIsRecommended() : false,
                    product.getCategory() != null ? product.getCategory() : "");

            PrintWriter out = response.getWriter();
            out.print(jsonResponse);
            out.flush();
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid product ID format");
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Server error: " + e.getMessage());
        } finally {
            em.close();
        }
    }
}