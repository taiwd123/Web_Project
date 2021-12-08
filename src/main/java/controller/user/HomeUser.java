package controller.user;

import dto.AccountDTO;
import entity.Course;
import service.IManagerCourseService;
import util.SessionUtil;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "HomeUser", value = "/user-home")
public class HomeUser extends HttpServlet {
    @Inject
    private IManagerCourseService managerCourseService;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        AccountDTO accountDTO = (AccountDTO) SessionUtil.getInstance().getValue(request,"USERMODEL");
        if(accountDTO != null){
            request.setAttribute("userid", accountDTO.getId());
            List<Course> listCsUser = managerCourseService.getListCourseUser(accountDTO.getId());
            List<Object[]> countExam = new ArrayList<Object[]>();
            for(Course cs : listCsUser){
                int csID = cs.getId();
                int count = managerCourseService.countExamOfCourse(cs.getId());
                int countExamFinish = managerCourseService.countExamFinishOfCourse(accountDTO.getId(), cs.getId());
                Object[] objects = new Object[]{csID, count, countExamFinish};
                countExam.add(objects);
            }
            request.setAttribute("countExam",countExam);
            request.setAttribute("listCsUser", listCsUser);
        }
        RequestDispatcher rd = request.getRequestDispatcher("/user/MyCourse.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
