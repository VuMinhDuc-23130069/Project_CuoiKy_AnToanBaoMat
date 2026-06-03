package vn.edu.nlu.fit.controller.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.nlu.fit.model.UserKey;
import vn.edu.nlu.fit.model.Users;
import vn.edu.nlu.fit.services.ChuKySoService;

import java.io.IOException;

@WebServlet(name = "ChuKySo", value = "/ChuKySo")
public class ChuKySo extends HttpServlet {
    private ChuKySoService service = new ChuKySoService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users currentUser = (Users) session.getAttribute("user");

        UserKey activeKey = service.getActiveKey(currentUser.getId());

        request.setAttribute("activeKey", activeKey);

        request.getRequestDispatcher("/ChuKySo.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users currentUser = (Users) session.getAttribute("user");

        String action = request.getParameter("action");

        if ("revokeKey".equals(action)) {
            boolean isSuccess = service.revokeKey(currentUser.getId());

            if (isSuccess) {
                session.setAttribute("message", "Đã báo mất khoá thành công. Các đơn hàng cũ vẫn hợp lệ, vui lòng tạo khoá mới để tiếp tục mua sắm.");
            } else {
                session.setAttribute("error", "Hệ thống đang bận hoặc bạn không có khoá nào để huỷ.");
            }

            response.sendRedirect("ChuKySo");
        }
    }
}