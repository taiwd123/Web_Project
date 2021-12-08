package controller.admin;

import dto.DocumentDTO;
import dto.ExamDTO;
import dto.ManagerCourseDTO;
import entity.Course;
import entity.Document;
import entity.Exam;
import service.IDocumentService;
import service.IExamService;
import service.IManagerCourseService;
import util.FormUtil;
import util.MessageUtil;

import javax.inject.Inject;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ManagerFileAdmin", value = "/admin-manager-file")
public class ManagerFileAdmin extends HttpServlet {
    @Inject
    private IManagerCourseService managerCourseService;
    @Inject
    private IExamService examService;
    @Inject
    private IDocumentService documentService;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        List<Course> listCourse = managerCourseService.getListCourse();
        List<Exam> listExam = examService.getListExam();
        List<Document> listDocument=documentService.getListDocument();
        String message = request.getParameter("message");
        if(message != null){
            MessageUtil.showMessage(request);
        }
        request.setAttribute("list",listCourse);
        request.setAttribute("listExam", listExam);
        request.setAttribute("listDocument",listDocument);
        RequestDispatcher rd = request.getRequestDispatcher("/admin/ManagerFile.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if(action.equals("insertCourse")){
            ManagerCourseDTO courseDTO = FormUtil.toModel(ManagerCourseDTO.class, request);
            if(managerCourseService.insertCourse(courseDTO)){
                response.sendRedirect(request.getContextPath()+"/admin-manager-file?message=insert_success");
            }
            else{
                response.sendRedirect(request.getContextPath()+"/admin-manager-file?message=error_system");
            }
        }
        else {
            if(action.equals("deleteCourse")){
                ManagerCourseDTO courseDTO = FormUtil.toModel(ManagerCourseDTO.class, request);
                if(managerCourseService.deleteCourse(courseDTO)){
                    response.sendRedirect(request.getContextPath()+"/admin-manager-file?message=delete_success");
                }else{
                    response.sendRedirect(request.getContextPath()+"/admin-manager-file?message=error_system");
                }
            }
            else {
                if(action.equals("updateCourse")){
                    ManagerCourseDTO courseDTO = FormUtil.toModel(ManagerCourseDTO.class, request);
                    Course course = managerCourseService.updateCourse(courseDTO);
                    if(course != null){
                        response.sendRedirect(request.getContextPath()+"/admin-manager-file?message=update_succes");
                    }else{
                        response.sendRedirect(request.getContextPath()+"/admin-manager-file?message=error_system");
                    }
                }
            }
        }

        if(action.equals("insertExam")){
            ExamDTO examDTO = FormUtil.toModel(ExamDTO.class, request);
            if(examService.insertExam(examDTO)){
                response.sendRedirect(request.getContextPath()+"/admin-manager-file?message=insert_success");
            }
            else{
                response.sendRedirect(request.getContextPath()+"/admin-manager-file?message=error_system");
            }
        }
        if(action.equals("insertDocument")){
            DocumentDTO documentDTO = FormUtil.toModel(DocumentDTO.class, request);
            if(documentService.insertDocument(documentDTO)){
                response.sendRedirect(request.getContextPath()+"/admin-manager-file?message=insert_success");
            }
            else{
                response.sendRedirect(request.getContextPath()+"/admin-manager-file?message=error_system");
            }
        }
        else {
            if(action.equals("deleteDocument")){
                DocumentDTO documentDTO = FormUtil.toModel(DocumentDTO.class, request);
                if(documentService.deleteDocument(documentDTO)){
                    response.sendRedirect(request.getContextPath()+"/admin-manager-file?message=delete_success");
                }else{
                    response.sendRedirect(request.getContextPath()+"/admin-manager-file?message=error_system");
                }
            }
            else {
                if(action.equals("updateDocument")){
                    DocumentDTO documentDTO = FormUtil.toModel(DocumentDTO.class, request);
                    Document document = documentService.updateDocument(documentDTO);
                    if(document != null){
                        response.sendRedirect(request.getContextPath()+"/admin-manager-file?message=update_succes");
                    }else{
                        response.sendRedirect(request.getContextPath()+"/admin-manager-file?message=error_system");
                    }
                }
            }
        }
    }
}