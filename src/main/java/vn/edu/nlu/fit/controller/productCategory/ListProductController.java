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

@WebServlet(name = "ListProductController", value = "/SanPham-TatCa")
public class ListProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductService proS= new ProductService();
        List<Products> list= proS.getListProduct();
        request.setAttribute("list", list);
        request.getRequestDispatcher("SanPham-TatCa.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}