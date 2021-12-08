package controller.user;

import dto.AccountDTO;
import dto.ExamDTO;
import entity.Account;
import entity.Exam;
import service.IExamService;
import service.IScoreService;
import util.SessionUtil;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ExamUser", value = "/user-exam")
public class ExamUser extends HttpServlet {

    @Inject
    private IExamService iExamService;

    @Inject
    private IScoreService iScoreService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        Integer courseId = Integer.parseInt(request.getParameter("courseId"));
        List<ExamDTO> examDTOS = iExamService.findAllQuestionsByCourseID(courseId);
        if(examDTOS == null){
            response.sendRedirect(request.getContextPath() + "/user-home");
        }
        else {
            ExamDTO examDTO = new ExamDTO();
            examDTO.setListResult(examDTOS);
            Integer userId = ((AccountDTO) SessionUtil.getInstance().getValue(request,"USERMODEL")).getId();
            iExamService.setScoreForListExam(examDTO,userId);
            request.setAttribute("courseId",courseId);
            request.setAttribute("exam", examDTO);
            RequestDispatcher rd = request.getRequestDispatcher("/user/Exam.jsp");
            rd.forward(request,response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
