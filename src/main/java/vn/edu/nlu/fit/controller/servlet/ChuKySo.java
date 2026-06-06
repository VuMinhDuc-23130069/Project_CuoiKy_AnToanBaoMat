package vn.edu.nlu.fit.controller.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.nlu.fit.dao.OrderDAO;
import vn.edu.nlu.fit.model.Orders;
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
            return ;
        }
        // Lưu chữ ký
        if ("signOrder".equals(action)) {
            String orderIdStr = request.getParameter("order_id");
            String uploadedSignature = request.getParameter("signature");

            response.setContentType("text/plain; charset=UTF-8");

            try {
                int orderId = Integer.parseInt(orderIdStr);
                OrderDAO orderDAO = new OrderDAO();
                Orders order = orderDAO.getOrderById(orderId);

                if (!service.isKeyValid(orderId)) {
                    response.getWriter().write("error: Khoá bảo mật của bạn đã bị vô hiệu hoá. Vui lòng tạo khoá mới!");
                    return;
                }

                if (uploadedSignature == null || uploadedSignature.trim().isEmpty()) {
                    response.getWriter().write("error: Vui lòng nhập chữ ký!");
                    return;
                }

                orderDAO.updateSignature(orderId, uploadedSignature.trim());
                response.getWriter().write("success");

            } catch (NumberFormatException e) {
                response.getWriter().write("error: Mã đơn hàng không hợp lệ!");
            } catch (Exception e) {
                e.printStackTrace();
                response.getWriter().write("error: Lỗi Server: " + e.getMessage());
            }
        }
    }
    
}