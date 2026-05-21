package vn.edu.nlu.fit.controller.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.nlu.fit.dao.NewsDAO;
import vn.edu.nlu.fit.dao.ProductDAO;
import vn.edu.nlu.fit.model.News;
import vn.edu.nlu.fit.model.Products;

import java.io.IOException;
import java.util.List;

@WebServlet("/TrangChu")
public class TrangChu extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //SP MỚI NHẤT
        ProductDAO productDAO = new ProductDAO();
        List<Products> newestProducts = productDAO.getTopNewestProducts(18);
        request.setAttribute("newestProducts", newestProducts);
        //SP YÊU THÍCH
        List<Products> favouriteProducts = productDAO.getTopFvouriteProduct(9);
        request.setAttribute("favouriteProducts", favouriteProducts);
        //TIN TỨC MỚI NHẤT
        NewsDAO newsDao = new NewsDAO();
        List<News> recentNews = newsDao.getRecentNews(3);
        request.setAttribute("recentNews", recentNews);

        request.getRequestDispatcher("/TrangChu.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
