package controller.web;

import service.impl.AccountService;
import util.EmailUtil;
import util.SecurityUtil;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Enumeration;
import java.util.ResourceBundle;

@WebServlet(value = "/recover-password")
public class RecoverPasswordController extends HttpServlet {

    @Inject
    AccountService accountService;
    ResourceBundle resourceBundle = ResourceBundle.getBundle("message");

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String value = req.getParameter("value");
        String message = req.getParameter("message");
        String alert = req.getParameter("alert");
        if (value != null){
            System.out.println(value);
            String textDecoded = SecurityUtil.decoded(value);
            System.out.println(textDecoded);
            String[] confirm = textDecoded.split("\\|");
            String email = confirm[0];
            String newpassword = confirm[1];
            String strDateLink = confirm[2];
            int check = accountService.resetPassword(email, newpassword, strDateLink);
            if (check > 0) {
                resp.sendRedirect(req.getContextPath()+"/recover-password?message=reset_password_successfully&alert=success");
            } else if (check == -1) {
                resp.sendRedirect(req.getContextPath()+"/recover-password?message=reset_password_failed&alert=error");
            } else {
                resp.sendRedirect(req.getContextPath()+"/recover-password?message=expired_link&alert=error");
            }
        } else if (message != null && alert != null){
            System.out.println(resourceBundle.getString(message));
            System.out.println(alert);
            req.setAttribute("message", resourceBundle.getString(message));
            req.setAttribute("alert", alert);
            RequestDispatcher rd = req.getRequestDispatcher("/home/pages_recoverpw.jsp");
            rd.forward(req, resp);
        } else {
            RequestDispatcher rd = req.getRequestDispatcher("/home/pages_recoverpw.jsp");
            rd.forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action != null && action.equals("recover")) {
            String email = req.getParameter("email");
            accountService = new AccountService();
            Enumeration headerNames = req.getHeaderNames();
            String contextfile="";
            while (headerNames.hasMoreElements()){
                String paramName = (String) headerNames.nextElement();
                if(paramName.equals("host")){
                    contextfile = req.getHeader(paramName);
                    break;
                }
            }
            int check = accountService.recoverPassword(email, contextfile);
            if (check == 1) {
                resp.sendRedirect(req.getContextPath()+"/recover-password?message=email_message_sent_successfully&alert=success");
            } else if (check == - 1) {
                resp.sendRedirect(req.getContextPath()+"/recover-password?message=email_message_sent_failed&alert=error");

            } else {
                resp.sendRedirect(req.getContextPath()+"/recover-password?message=email_not_found_in_system&alert=error");
            }
        } else {
            RequestDispatcher rd = req.getRequestDispatcher("/home/pages_recoverpw.jsp");
            rd.forward(req, resp);
        }
    }
}
