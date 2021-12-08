package controller.user;

import dto.AccountDTO;
import entity.Course;
import entity.Document;
import service.IDocumentService;
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
@WebServlet(name = "Document", value = "/document")
public class DocumentController extends HttpServlet {
    @Inject
    private IDocumentService documentService;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        Integer courseID=Integer.parseInt(req.getParameter("courseID"));
        AccountDTO accountDTO = (AccountDTO) SessionUtil.getInstance().getValue(req,"USERMODEL");
        req.setAttribute("account", accountDTO);
        List<Document> listDocument = documentService.getAllDocumentsByCourseID(courseID);
        req.setAttribute("listDocument", listDocument);
        RequestDispatcher rd = req.getRequestDispatcher("/user/Documents.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}