package controller.admin;

import dto.ManagerCourseDTO;
import service.IAccountService;
import service.IExamService;
import service.IManagerCourseService;
import service.IQuestionService;

import javax.inject.Inject;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "HomeAdmin", value = "/admin-home")
public class HomeAdmin extends HttpServlet {
    @Inject
    private IAccountService accountService;

    @Inject
    private IManagerCourseService iManagerCourseService;

    @Inject
    private IQuestionService iQuestionService;

    @Inject
    private IExamService iExamService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        Integer totalStudents = accountService.countTotalStudent();
        request.setAttribute("totalStudents", totalStudents);

        Integer totalCourse = iManagerCourseService.countTotalCourse();
        request.setAttribute("totalCourse", totalCourse);

        Integer totalExam = iExamService.countTotalExam();
        request.setAttribute("totalExam", totalExam);

        Integer totalQuestion = iQuestionService.countTotalQuestion();
        request.setAttribute("totalQuestion", totalQuestion);

        ManagerCourseDTO managerCourseDTO = new ManagerCourseDTO();
        managerCourseDTO.setListResult(iManagerCourseService.findAll());
        iManagerCourseService.setListCountRegister(managerCourseDTO.getListResult());
        request.setAttribute("course", managerCourseDTO);

        RequestDispatcher rd = request.getRequestDispatcher("/admin/stats_admin.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
