package vn.edu.nlu.fit.controller.admin.product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.nlu.fit.model.Products;
import vn.edu.nlu.fit.services.AdminProductService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminProduct", value = "/AdminProduct")
public class AdminProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AdminProductService service = new AdminProductService();

        List<Products> list = service.getAll();
        request.setAttribute("listProduct", list);
        request.getRequestDispatcher("Admin-QuanLySanPham.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}