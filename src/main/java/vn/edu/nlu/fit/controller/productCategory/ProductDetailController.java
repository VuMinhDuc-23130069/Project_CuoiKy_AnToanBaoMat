package vn.edu.nlu.fit.controller.productCategory;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.nlu.fit.model.Products;
import vn.edu.nlu.fit.services.ProductService;

import java.io.IOException;

@WebServlet(name = "ListProductDetailController", value = "/Chi-tiet-san-pham")
public class ProductDetailController extends HttpServlet {
    private final ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        Products product = productService.getDetail(id);
        request.setAttribute("product", product);
        request.getRequestDispatcher("ChiTietSanPham.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
