package converter;

import dto.DocumentDTO;
import dto.ExamDTO;
import dto.ManagerCourseDTO;
import entity.Course;
import entity.Document;
import entity.Exam;
import service.IManagerCourseService;
import service.impl.ManagerCourseService;

public class DocumentConverter {
    public DocumentDTO toDto(Document entity){
        if(entity == null){
            return null;
        }
        DocumentDTO result = new DocumentDTO();
        result.setId(entity.getId());
        result.setDocumentName(entity.getDocumentName());
        result.setCourseID(entity.getCourse().getId());
        result.setDocumentLink(entity.getDocumentLink());

        return result;
    }

    public Document toEntity(DocumentDTO dto){
        if(dto == null){
            return null;
        }
        Document result = new Document();
        result.setId(dto.getId());
        result.setDocumentName(dto.getDocumentName());
        result.setDocumentLink(dto.getDocumentLink());

        IManagerCourseService managerCourseService = new ManagerCourseService();
        ManagerCourseDTO managerCourseDTO = managerCourseService.findById(dto.getCourseID());
        ManagerCourseConverter managerCourseConverter = new ManagerCourseConverter();
        Course course = managerCourseConverter.toEntity(managerCourseDTO);
        result.setCourse(course);
        return result;
    }
}