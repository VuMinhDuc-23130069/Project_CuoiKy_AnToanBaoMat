package vn.edu.nlu.fit.controller.cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.nlu.fit.Cart.Cart;
import vn.edu.nlu.fit.Cart.CartItem;
import vn.edu.nlu.fit.model.Products;
import vn.edu.nlu.fit.services.ProductService;

import java.io.IOException;

@WebServlet(name = "DelCart", value = "/Del-product")
public class DelProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id=Integer.parseInt(request.getParameter("id"));
        ProductService productService=new ProductService();
        Products product= productService.getDetail(id);
        HttpSession session = request.getSession();
        Cart c = (Cart) session.getAttribute("cart");
        CartItem cartItem = c.deleteItem(id);
        if(cartItem==null){
        //
        }
        response.sendRedirect("ShowCart");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}