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

@WebServlet(name = "AdminNewsEdit", value = "/AdminNewsEdit")
public class AdminNewsEdit extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        AdminNewsService service = new AdminNewsService();
        News n = service.getById(id);

        request.setAttribute("news", n);
        request.getRequestDispatcher("Admin-BaiViet-ChinhSua.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String shortDesc = request.getParameter("shortDescription");
        String image = request.getParameter("image");
        int status = Integer.parseInt(request.getParameter("status"));

        String dateStr = request.getParameter("datePost");
        Timestamp datePost = Timestamp.valueOf(dateStr.replace("T", " ") + ":00");

        News n = new News();
        n.setId(id);
        n.setTitle(title);
        n.setContent(content);
        n.setShortDescription(shortDesc);
        n.setImageURL(image);
        n.setDatePost(datePost);
        n.setIsPublished(status);

        AdminNewsService service = new AdminNewsService();
        service.update(n);

        response.sendRedirect("AdminNews");
    }
}