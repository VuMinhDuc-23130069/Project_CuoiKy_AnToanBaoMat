package vn.edu.nlu.fit.controller.admin.dashboard;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.nlu.fit.services.AdminDashboardService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminDashboard", value = "/AdminDashboard")
public class AdminDashboard extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AdminDashboardService service = new AdminDashboardService();

        request.setAttribute("soLuongDanhMuc", service.getCount("categories"));
        request.setAttribute("soLuongSanPham", service.getCount("products"));
        request.setAttribute("soLuongThanhVien", service.getCount("users"));
        request.setAttribute("soLuongBaiViet", service.getCount("news"));

        List<ChartData> chartDataList = service.getRevenueList();

        String chartLabels = service.getLabels(chartDataList);
        String chartData = service.getData(chartDataList);
        request.setAttribute("chartLabels", chartLabels);
        request.setAttribute("chartData", chartData);

        request.getRequestDispatcher("Admin-HomePage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}