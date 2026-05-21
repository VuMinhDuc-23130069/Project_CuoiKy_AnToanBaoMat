package vn.edu.nlu.fit.controller.admin.news;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.nlu.fit.model.News;
import vn.edu.nlu.fit.services.AdminNewsService;

import java.io.IOException;
import java.sql.Timestamp;

@WebServlet(name = "AdminNewsCreate", value = "/AdminNewsCreate")
public class AdminNewsCreate extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("Admin-BaiViet-TaoMoi.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String shortDesc = request.getParameter("shortDescription");
        String image = request.getParameter("image");
        int status = Integer.parseInt(request.getParameter("status"));

        String dateStr = request.getParameter("datePost");
        Timestamp datePost = null;
        try {
            datePost = Timestamp.valueOf(dateStr.replace("T", " ") + ":00");
        } catch (Exception e) {
            datePost = new Timestamp(System.currentTimeMillis());
        }

        News n = new News();
        n.setTitle(title);
        n.setContent(content);
        n.setShortDescription(shortDesc);
        n.setImageURL(image);
        n.setDatePost(datePost);
        n.setIsPublished(status);

        AdminNewsService service = new AdminNewsService();
        service.insert(n);

        response.sendRedirect("AdminNews");
    }
}