package vn.edu.nlu.fit.controller.admin.discount;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.nlu.fit.model.Discounts;
import vn.edu.nlu.fit.services.AdminDiscountService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminDiscount", value = "/AdminDiscount")
public class AdminDiscount extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AdminDiscountService service = new AdminDiscountService();
        List<Discounts> list = service.getAll();

        request.setAttribute("listDiscount", list);
        request.getRequestDispatcher("Admin-QuanLyMaGiamGia.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}