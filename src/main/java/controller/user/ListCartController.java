package controller.user;

import dto.ManagerCourseDTO;
import util.SessionUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ListCartController", value = "/ListCartController")
public class ListCartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        List<ManagerCourseDTO> cart = (List<ManagerCourseDTO>) SessionUtil.getInstance().getValue(request, "CARTKEY");
        float totalPrice = 0;
        if (cart != null){
            for (ManagerCourseDTO item: cart) {
                totalPrice += item.getPrice();
            }
        }
        request.setAttribute("totalPrice", totalPrice);
        RequestDispatcher rd = request.getRequestDispatcher("/user/cart.jsp");
        rd.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
