package vn.edu.nlu.fit.controller.Checkout;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.nlu.fit.dao.DeliveryMethodDao;
import vn.edu.nlu.fit.dao.PaymentMethodDao;
import vn.edu.nlu.fit.model.DeliveryMethods;
import vn.edu.nlu.fit.model.PaymentMethods;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "PaymentMethodController", value = "/PaymentMethod")
public class PaymentMethodController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Lấy ds pttt lên
        PaymentMethodDao paymentDAO = new PaymentMethodDao();
        List<PaymentMethods> listPaymentMethods = paymentDAO.getAllPaymentMethods();
        request.setAttribute("listPaymentMethods", listPaymentMethods);

        //lấy ds ptvc
        DeliveryMethodDao deliveryDAO = new DeliveryMethodDao();
        List<DeliveryMethods> listDeliveryMethods = deliveryDAO.getAllDeliveryMethods();
        request.setAttribute("listDeliveryMethods", listDeliveryMethods);


        request.getRequestDispatcher("PhuongThucThanhToan.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}