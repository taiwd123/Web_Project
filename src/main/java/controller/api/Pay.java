package controller.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import dto.AccountDTO;
import dto.ManagerCourseDTO;
import dto.RegisterCourseDTO;
import service.IRegisterCourseService;
import util.FormUtil;
import util.SessionUtil;

import javax.inject.Inject;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Pay", value = "/api/pay")
public class Pay extends HttpServlet {
    @Inject
    private IRegisterCourseService registerCourseService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        ObjectMapper mapper = new ObjectMapper();
        response.setContentType("application/json");

        List<ManagerCourseDTO> cart = (List<ManagerCourseDTO>) SessionUtil.getInstance().getValue(request, "CARTKEY");
        AccountDTO user = (AccountDTO)  SessionUtil.getInstance().getValue(request, "USERMODEL");

        Integer flag = 0;

        try {
            for (ManagerCourseDTO item: cart) {
                RegisterCourseDTO registerCourseDTO = new RegisterCourseDTO();
                registerCourseDTO.setCourseID(item.getId());
                registerCourseDTO.setUserID(user.getId());
                registerCourseService.insertRegisterCourse(registerCourseDTO);
            }
            SessionUtil.getInstance().removeValue(request, "CARTKEY");
            flag = 1;

        } catch(Exception ex) {
            flag = 0;
        }finally {
            mapper.writeValue(response.getOutputStream(), flag);
        }
    }
}
