package vn.edu.nlu.fit.controller.Checkout;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.nlu.fit.Cart.Cart;

import java.io.IOException;

@WebServlet(name = "CheckoutController", value = "/Checkout-infor")
public class CheckoutCartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String note = request.getParameter("note");

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        if(cart==null || cart.getTotalQuantity() ==0){ // giỏ hàng trống thì quay lại mua hàng
            response.sendRedirect("SanPham-TatCa.jsp");
            return;
        }
        if (note != null && !note.isEmpty()) {
            session.setAttribute("ORDER_NOTE", note);
        } else {
            // Nếu không có ghi chú mới thì giữ nguyên hoặc xóa cũ tùy logic
            // Thường là xóa cũ để tránh lưu nhầm của đơn trước
            session.removeAttribute("ORDER_NOTE");
        }

        request.getRequestDispatcher("ThongTinGiaoHang.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");// chống lỗi font khi xài tv

        //đọc từ form
        String name = request.getParameter("fullname");
        String email = request.getParameter("Email");
        String phone = request.getParameter("sdt");
        String street = request.getParameter("dc");
        String district = request.getParameter("district_name");
        String province = request.getParameter("province_name");

        //gộp địa chỉ thành 1
        String fullAddress = street;
        if(district != null && !district.isEmpty()) fullAddress += ", " + district;
        if(province != null && !province.isEmpty()) fullAddress += ", " + province;

        //lưu session
        HttpSession session = request.getSession();
        session.setAttribute("order_name", name);
        session.setAttribute("order_email", email);
        session.setAttribute("order_phone", phone);
        session.setAttribute("order_address", fullAddress);

        //chuyển trang
        response.sendRedirect("PaymentMethod");
    }
}