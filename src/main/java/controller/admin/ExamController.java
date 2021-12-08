package controller.admin;

import dto.ExamDTO;
import service.IExamService;
import service.impl.ExamService;
import util.FormUtil;

import javax.inject.Inject;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ExamController", value = "/ExamController")
public class ExamController extends HttpServlet {

    @Inject
    private IExamService examService;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ExamDTO examDTO = FormUtil.toModel(ExamDTO.class, request);
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        if(examService.insertExam(examDTO)){
            response.sendRedirect(request.getContextPath()+"/ExamController?message=insert_success");
        }
        else{
            response.sendRedirect(request.getContextPath()+"/ExamController?message=error_system");
        }
    }
}
