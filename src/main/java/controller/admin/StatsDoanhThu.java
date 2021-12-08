package controller.admin;

import service.IRegisterCourseService;

import javax.inject.Inject;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Hashtable;
import java.util.List;

@WebServlet(name = "StatsDoanhThu", value = "/admin/stats-doanh-thu")
public class StatsDoanhThu extends HttpServlet {
    @Inject
    IRegisterCourseService iRegisterCourseService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        List<Hashtable> temp = iRegisterCourseService.StatsDoanhThu();
        request.setAttribute("stats", temp);
        RequestDispatcher rd = request.getRequestDispatcher("/admin/doanhthu.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
