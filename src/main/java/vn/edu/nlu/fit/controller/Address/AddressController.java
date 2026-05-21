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
import java.util.List;

@WebServlet(name = "AddressServlet", value = "/DanhSachDiaChi")
public class AddressController extends HttpServlet {

    private AddressDAO addressDAO = new AddressDAO();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Users user = (Users) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect("DangNhap.jsp");
            return;
        }
        List<Address> addresses = addressDAO.findByUserId(user.getId());
        request.setAttribute("addresses", addresses);

        request.getRequestDispatcher("/DanhSachDiaChi.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}