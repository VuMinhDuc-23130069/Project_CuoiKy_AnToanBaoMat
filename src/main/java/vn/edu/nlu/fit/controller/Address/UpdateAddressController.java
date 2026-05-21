package vn.edu.nlu.fit.controller.Address;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.nlu.fit.dao.AddressDAO;
import vn.edu.nlu.fit.model.Address;
import vn.edu.nlu.fit.model.Users;

import java.io.IOException;

@WebServlet(name = "UpdateAddressController", value = "/CapNhatDiaChi")
public class UpdateAddressController extends HttpServlet {
    private AddressDAO addressDAO = new AddressDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        Users user = (Users) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect("DangNhap.jsp");
            return;
        }

        int id = Integer.parseInt(request.getParameter("id"));

        Address a = new Address();
        a.setId(id);
        a.setUserId(user.getId());
        a.setRecipientName(request.getParameter("recipientName"));
        a.setPhoneNumber(request.getParameter("phoneNumber"));
        a.setStreet(request.getParameter("street"));
        a.setProvince(request.getParameter("province"));
        a.setDistrict(request.getParameter("district"));
        a.setWard(request.getParameter("ward"));
        a.setIsDefault(request.getParameter("is_default") != null ? 1 : 0);

        // Nếu chọn làm mặc định → bỏ mặc định cũ
        if (a.getIsDefault() == 1) {
            addressDAO.unsetDefault(user.getId());
        }

        addressDAO.update(a);

        response.sendRedirect("DanhSachDiaChi");
    }
}