package vn.edu.nlu.fit.controller.Address;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.nlu.fit.dao.AddressDAO;
import vn.edu.nlu.fit.model.Users;

import java.io.IOException;

@WebServlet(name = "DeleteAddressController", value = "/XoaDiaChi")
public class DeleteAddressController extends HttpServlet {
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

        String idRaw = request.getParameter("id");
        if (idRaw == null || idRaw.isBlank()) {
            response.sendRedirect("DanhSachDiaChi");
            return;
        }

        int id = Integer.parseInt(idRaw);

        addressDAO.deleteByIdAndUser(id, user.getId());

        response.sendRedirect("DanhSachDiaChi");
    }

}