package controller.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import dto.ManagerCourseDTO;
import entity.Course;
import service.IManagerCourseService;
import util.HttpUtil;
import util.SessionUtil;

import javax.inject.Inject;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AddCart", value = "/api/add-item-cart")
public class AddCart extends HttpServlet {
    @Inject
    IManagerCourseService iManagerCourseService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        List<ManagerCourseDTO> cart = (List<ManagerCourseDTO>) SessionUtil.getInstance().getValue(request, "CARTKEY");
        if (cart == null){
            cart = new ArrayList<ManagerCourseDTO>();
        }

        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        ManagerCourseDTO managerCourseDTO  =  HttpUtil.of(request.getReader()).toModel(ManagerCourseDTO.class);

        managerCourseDTO = iManagerCourseService.findById(managerCourseDTO.getId());

        int flag = 0;
        for (ManagerCourseDTO dto: cart) {
            if (dto.getId() == managerCourseDTO.getId()){
                flag = 1;
                break;
            }
        }

        if (flag == 0){
            cart.add(managerCourseDTO);
            SessionUtil.getInstance().putValue(request,"CARTKEY", cart);
            managerCourseDTO.setTotalCart(cart.size());
        }
        else{
            managerCourseDTO.setAlertCart("Đã tồn tại trong giỏ");
        }
        mapper.writeValue(response.getOutputStream(), managerCourseDTO);
    }
}
