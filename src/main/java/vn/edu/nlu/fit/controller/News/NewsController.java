package vn.edu.nlu.fit.controller.News;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.nlu.fit.dao.NewsDAO;
import vn.edu.nlu.fit.model.News;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "NewsController", value = "/News")
public class NewsController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        NewsDAO newsDAO = new NewsDAO();
        int pageSize = 4;
        int page = 1;     //trang mặc định

        String pageParam = request.getParameter("page");
        if (pageParam != null && !pageParam.isEmpty()) {
            try {
                page = Integer.parseInt(pageParam);
            } catch (NumberFormatException e) {
                page = 1;
            }
        }
        //tính toán vị trí lấy trong db
        int offset = (page - 1) * pageSize;
        List<News> listNews = newsDAO.getNewsByPage(offset, pageSize);
        // trả ra số lượng trang
        int totalNews = newsDAO.getTotalNews();
        int totalPages = (int) Math.ceil((double) totalNews / pageSize);
        //BV mới nhất
        List<News> recentNewsList = newsDAO.getRecentNews(6);
        request.setAttribute("newsList", listNews);           // Danh sách chính
        request.setAttribute("recentNewsList", recentNewsList); // Danh sách sidebar
        request.setAttribute("currentPage", page);            // Trang hiện tại
        request.setAttribute("totalPages", totalPages);       // Tổng số trang
        request.getRequestDispatcher("/TinTuc.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}