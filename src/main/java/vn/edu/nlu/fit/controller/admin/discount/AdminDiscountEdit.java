package vn.edu.nlu.fit.controller.admin.discount;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.nlu.fit.model.Discounts;
import vn.edu.nlu.fit.services.AdminDiscountService;

import java.io.IOException;

@WebServlet(name = "AdminDiscountEdit", value = "/AdminDiscountEdit")
public class AdminDiscountEdit extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        AdminDiscountService service = new AdminDiscountService();
        Discounts d = service.getById(id);

        request.setAttribute("d", d);
        request.getRequestDispatcher("Admin-QuanLyMaGiamGia-ChinhSua.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double percent = Double.parseDouble(request.getParameter("percent"));
        int qty = Integer.parseInt(request.getParameter("quantity"));
        int status = Integer.parseInt(request.getParameter("status"));

        Discounts d = new Discounts();
        d.setId(id);
        d.setDiscountName(name);
        d.setPercentDiscount(percent);
        d.setQuantity(qty);
        d.setDiscountStatus(status);

        AdminDiscountService service = new AdminDiscountService();
        service.update(d);

        response.sendRedirect(request.getContextPath() + "/AdminDiscount");
    }
}