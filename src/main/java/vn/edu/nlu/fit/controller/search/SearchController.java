package vn.edu.nlu.fit.controller.search;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.nlu.fit.dao.ProductDAO;
import vn.edu.nlu.fit.model.Products;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchController", value = "/TimKiem")
public class SearchController extends HttpServlet {
    private ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        request.setCharacterEncoding("UTF-8");

        String keyword = request.getParameter("q");

        List<Products> products = null;
        if (keyword != null && !keyword.trim().isEmpty()) {
            products = productDAO.searchByName(keyword);
        }

        request.setAttribute("keyword", keyword);
        request.setAttribute("products", products);

        request.getRequestDispatcher("/TimKiem-KetQua.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}