package vn.edu.nlu.fit.controller.admin.product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.nlu.fit.model.Categories;
import vn.edu.nlu.fit.model.Products;
import vn.edu.nlu.fit.services.AdminProductService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminProductCreate", value = "/AdminProductCreate")
public class AdminProductCreate extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AdminProductService service = new AdminProductService();

        List<Categories> list = service.getCategoryIsActived();
        request.setAttribute("listCate", list);
        request.getRequestDispatcher("Admin-QuanLySanPham-TaoMoi.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        int categoryId = Integer.parseInt(request.getParameter("categoryId"));

        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String expiry = request.getParameter("expiry");
        String desc = request.getParameter("description");
        String ingredient = request.getParameter("ingredient");
        String instruction = request.getParameter("instruction");
        String attention = request.getParameter("attention");
        String uses = request.getParameter("uses");
        String image = request.getParameter("image");

        Products p = new Products();
        p.setProductName(name);
        p.setPrice(price);
        p.setQuantity(quantity);
        p.setProductExpiryDate(expiry);
        p.setProductDescription(desc);
        p.setIngredient(ingredient);
        p.setInstruction(instruction);
        p.setAttention(attention);
        p.setUses(uses);
        p.setImageURL(image);

        AdminProductService service = new AdminProductService();
        service.insert(p, categoryId);

        response.sendRedirect(request.getContextPath() + "/AdminProduct");
    }
}