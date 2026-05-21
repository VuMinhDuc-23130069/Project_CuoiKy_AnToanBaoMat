package vn.edu.nlu.fit.controller.productCategory;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.nlu.fit.model.Products;
import vn.edu.nlu.fit.services.ProductService;

import java.io.IOException;
import java.util.List;

@WebServlet("/filter")
public class FilterProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String categoryID = request.getParameter("categoryID");
        String sortType = request.getParameter("sort");
        String price = request.getParameter("price");

        ProductService proS = new ProductService();
        List<Products> list = proS.getProductsByFilter(categoryID, sortType, price);

        request.setAttribute("list", list);
        request.setAttribute("selectedSort", sortType); //  Giữ nguyên sự lựa chọn trên menu
        request.setAttribute("tag", categoryID); // Để tô đậm danh mục đang chọn
        request.getRequestDispatcher("SanPham-TatCa.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}