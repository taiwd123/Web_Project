package controller.web;

import dto.AccountDTO;
import util.SessionUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
@WebServlet(name = "Support",value = "/support")
public class Support extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        AccountDTO accountDTO = (AccountDTO) SessionUtil.getInstance().getValue(req, "USERMODEL");
        req.setAttribute("account", accountDTO);
        RequestDispatcher rd = req.getRequestDispatcher("/user/support.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
