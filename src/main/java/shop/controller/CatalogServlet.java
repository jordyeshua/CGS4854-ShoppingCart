/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package shop.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import shop.dao.ProductDAO;

/** Controller: loads all products and forwards to the catalog page. */
@WebServlet("/catalog")
public class CatalogServlet extends HttpServlet {

    private final ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.setAttribute("products", productDAO.getAllProducts());
            request.getRequestDispatcher("/catalog.jsp").forward(request, response);
        } catch (SQLException e) {
            getServletContext().log("Could not load products", e);
            request.setAttribute("errorMessage",
                    "We could not load the products right now. Please try again later.");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }
}