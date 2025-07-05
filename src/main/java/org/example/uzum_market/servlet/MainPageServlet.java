package org.example.uzum_market.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.example.uzum_market.entity.Product;
import org.example.uzum_market.repository.ProductRepository;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "MainPageServlet", value = "/")
public class MainPageServlet extends HttpServlet {

    private final ProductRepository productRepository = new ProductRepository();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Product> products = productRepository.findAll();
        request.setAttribute("products", products);
        request.getRequestDispatcher("/main.jsp").forward(request, response);
    }
}
