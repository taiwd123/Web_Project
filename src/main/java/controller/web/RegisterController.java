package controller.web;

import dto.AccountDTO;
import entity.Account;
import org.apache.commons.lang.RandomStringUtils;
import service.IAccountService;
import util.FormUtil;
import util.MessageUtil;
import util.SecurityUtil;
import util.SessionUtil;

import javax.inject.Inject;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "RegisterController", value = "/view-register")
public class RegisterController extends HttpServlet {
    @Inject
    private IAccountService accountService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
//        String value = request.getParameter("value");
        if (action != null && action.equals("home")) {
            RequestDispatcher rd = request.getRequestDispatcher("/home/home.jsp");
            rd.forward(request, response);
        } else if (action != null && action.equals("verify")) {
            MessageUtil.showMessage(request);
            RequestDispatcher rd = request.getRequestDispatcher("/home/user-verify.jsp");
            rd.forward(request, response);
        }
//        else if (value != null && !value.equals("")) {
//            System.out.println(value);
//            String textDecoded = SecurityUtil.decoded(value);
//            System.out.println(textDecoded);
//            String[] confirm = textDecoded.split("\\|");
//            AccountDTO accountDTO = new AccountDTO();
//            accountDTO.setFullname(confirm[0]);
//            accountDTO.setUsername(confirm[1]);
//            accountDTO.setEmail(confirm[2]);
//            accountDTO.setPass(confirm[3]);
//            String strDateLink = confirm[4];
//            if (accountService.registerAccount(accountDTO, strDateLink)) {
//                response.sendRedirect(request.getContextPath()+"/view-register?message=insert_success");
//            } else {
//                response.sendRedirect(request.getContextPath()+"/view-register?message=error_system");
//            }
//        }
        else {
            MessageUtil.showMessage(request);
            RequestDispatcher rd = request.getRequestDispatcher("/home/pages-register.jsp");
            rd.forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String code = request.getParameter("code");
        if (code != null) {
            HttpSession session = request.getSession();
            AccountDTO accountDTO = (AccountDTO) session.getAttribute("authcode");
            if (code.equals(accountDTO.getCode())) {
                if (accountService.registerAccount(accountDTO)) {
                    SessionUtil.getInstance().removeValue(request, "authcode");
                    response.sendRedirect(request.getContextPath() + "/view-register?message=insert_success");
                } else {
                    response.sendRedirect(request.getContextPath()+"/view-register?action=verify&message=error_system");
                }
            } else {
                response.sendRedirect(request.getContextPath()+"/view-register?action=verify&message=error_system");
            }
        } else {
            AccountDTO accountDTO = FormUtil.toModel(AccountDTO.class, request);
            code = RandomStringUtils.random(6, false, true);
            accountDTO.setCode(code);
            if (accountService.sendMailRegister(accountDTO, request.getContextPath())) {
                HttpSession session = request.getSession();
                session.setAttribute("authcode", accountDTO);
                response.sendRedirect(request.getContextPath() + "/view-register?action=verify");
            } else {
                response.sendRedirect(request.getContextPath() + "/view-register?message=error_system");
            }
//        if (accountService.registerAccount(accountDTO)){
//            response.sendRedirect(request.getContextPath()+"/view-register?message=insert_success");
//        }
//        else{
//            response.sendRedirect(request.getContextPath()+"/view-register?message=error_system");
//        }
        }
    }
}
