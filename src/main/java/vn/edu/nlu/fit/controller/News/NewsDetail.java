package vn.edu.nlu.fit.controller.News;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.nlu.fit.model.News;
import vn.edu.nlu.fit.services.NewsService;

import java.io.IOException;

@WebServlet(name = "NewsDetail", value = "/NewsDetail")
public class NewsDetail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");

        // Kiểm tra nếu id hợp lệ
        if (idStr != null && !idStr.isEmpty()) {
            try {
                int id = Integer.parseInt(idStr);
                NewsService service = new NewsService();
                News news = service.getNewsById(id);

                if (news != null) {
                    request.setAttribute("n", news);
                    request.getRequestDispatcher("BaiViet.jsp").forward(request, response);
                } else {
                    response.sendRedirect("Trangchu");
                }
            } catch (NumberFormatException e) {
                response.sendRedirect("Trangchu");
            }
        } else {
            response.sendRedirect("Trangchu");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}