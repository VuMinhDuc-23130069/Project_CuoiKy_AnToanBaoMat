package vn.edu.nlu.fit.controller.admin.product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.nlu.fit.model.Products;
import vn.edu.nlu.fit.services.AdminProductService;

import java.io.IOException;

@WebServlet(name = "AdminProductEdit", value = "/AdminProductEdit")
public class AdminProductEdit extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        AdminProductService service = new AdminProductService();
        Products p = service.getById(id);

        request.setAttribute("listCate", service.getCategoryIsActived());
        request.setAttribute("p", p);
        request.getRequestDispatcher("Admin-QuanLySanPham-ChinhSua.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        int id = Integer.parseInt(request.getParameter("id"));

        String name = request.getParameter("name");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
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
        p.setId(id);
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
        service.update(p, categoryId);

        response.sendRedirect(request.getContextPath() + "/AdminProduct");
    }
}