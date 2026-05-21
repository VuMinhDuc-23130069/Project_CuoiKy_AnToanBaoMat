package vn.edu.nlu.fit.controller.admin.discount;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.nlu.fit.model.Discounts;
import vn.edu.nlu.fit.services.AdminDiscountService;

import java.io.IOException;

@WebServlet(name = "AdminDiscountCreate", value = "/AdminDiscountCreate")
public class AdminDiscountCreate extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("Admin-QuanLyMaGiamGia-TaoMoi.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        double percent = Double.parseDouble(request.getParameter("percent"));
        int qty = Integer.parseInt(request.getParameter("quantity"));
        int status = Integer.parseInt(request.getParameter("status"));

        Discounts d = new Discounts();
        d.setDiscountName(name);
        d.setPercentDiscount(percent);
        d.setQuantity(qty);
        d.setDiscountStatus(status);

        AdminDiscountService service = new AdminDiscountService();
        service.insert(d);

        response.sendRedirect(request.getContextPath() + "/AdminDiscount");
    }
}