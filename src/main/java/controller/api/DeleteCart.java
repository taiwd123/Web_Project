package controller.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import dto.ManagerCourseDTO;
import util.HttpUtil;
import util.SessionUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

@WebServlet(name = "DeleteCart", value = "/api/delete-cart-item")
public class DeleteCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        Integer courseId = Integer.valueOf(request.getParameter("itemDelete"));

        List<ManagerCourseDTO> cart = (List<ManagerCourseDTO>) SessionUtil.getInstance().getValue(request, "CARTKEY");

        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        for (ManagerCourseDTO dto: cart) {
            if (dto.getId() == courseId){
                cart.remove(dto);
                break;
            }
        }
        float totalPrice = 0;
        for (ManagerCourseDTO managerCourseDTO: cart) {
            totalPrice += managerCourseDTO.getPrice();
        }

        Hashtable<String, String> my_dict = new Hashtable<String, String>();
        my_dict.put("totalPrice", String.valueOf(totalPrice));
        my_dict.put("quantityCart", String.valueOf(cart.size()));

        SessionUtil.getInstance().putValue(request,"CARTKEY", cart);
        mapper.writeValue(response.getOutputStream(), my_dict);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
