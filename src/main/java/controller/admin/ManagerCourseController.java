package controller.admin;

import dto.ManagerCourseDTO;
import lombok.ToString;
import service.IManagerCourseService;
import util.FormUtil;

import javax.inject.Inject;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ManagerCourseController", value = "/CourseController")
public class ManagerCourseController extends HttpServlet {
    @Inject
    private IManagerCourseService managerCourseService;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        ManagerCourseDTO courseDTO = FormUtil.toModel(ManagerCourseDTO.class, request);
        if(managerCourseService.insertCourse(courseDTO)){
            response.sendRedirect(request.getContextPath()+"/CourseController?message=insert_success&alert=success");
        }
        else{
            response.sendRedirect(request.getContextPath()+"/CourseController?message=error_system&alert=error");
        }
    }
}
