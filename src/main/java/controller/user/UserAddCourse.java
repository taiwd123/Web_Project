package controller.user;

import dto.AccountDTO;
import entity.Course;
import service.IAccountService;
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
import java.util.List;

@WebServlet(name = "UserAddCourse", value = "/user-add-course")
public class UserAddCourse extends HttpServlet {
    @Inject
    private IManagerCourseService managerCourseService;
    @Inject
    private IAccountService accountService;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        Integer userid = ((AccountDTO)SessionUtil.getInstance().getValue(request,"USERMODEL")).getId();
        if (userid != null){
            List<Course> listCS  = managerCourseService.getListAddCourse(userid);
            request.setAttribute("listCS",listCS);
            AccountDTO accountDTO = accountService.findById(userid);
            request.setAttribute("account", accountDTO);
        }

            RequestDispatcher rd = request.getRequestDispatcher("/user/AddCourse.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
