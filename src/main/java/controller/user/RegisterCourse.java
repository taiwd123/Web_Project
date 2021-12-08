package controller.user;

import dto.RegisterCourseDTO;
import service.IRegisterCourseService;
import util.FormUtil;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RegisterCourse", value = "/Register-Course")
public class RegisterCourse extends HttpServlet {

    @Inject
    private IRegisterCourseService registerCourseService;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        RegisterCourseDTO registerCourseDTO = FormUtil.toModel(RegisterCourseDTO.class, request);
        Integer id = registerCourseDTO.getUserID();
        if(registerCourseService.insertRegisterCourse(registerCourseDTO)){
            response.sendRedirect(request.getContextPath()+"/user-add-course?message=insert_success");
        }
        else{
            response.sendRedirect(request.getContextPath()+"/user-add-course?&message=error_system");
        }
    }
}
