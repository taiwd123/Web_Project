package converter;

import dto.AccountDTO;
import dto.ExamDTO;
import dto.ManagerCourseDTO;
import entity.Course;
import entity.Exam;
import service.IExamService;
import service.IManagerCourseService;
import service.impl.ExamService;
import service.impl.ManagerCourseService;

public class ExamConverter {
    public ExamDTO toDto(Exam entity){
        if(entity == null){
            return null;
        }
        ExamDTO result = new ExamDTO();
        result.setId(entity.getId());
        result.setExamName(entity.getExamName());
        result.setCourseID(entity.getCourse().getId());
        result.setFileCheck(entity.getFileCheck());

        return result;
    }

    public Exam toEntity(ExamDTO dto){
        if(dto == null){
            return null;
        }
        Exam result = new Exam();
        result.setId(dto.getId());
        result.setExamName(dto.getExamName());
        result.setFileCheck(dto.getFileCheck());

        IManagerCourseService managerCourseService = new ManagerCourseService();
        ManagerCourseDTO managerCourseDTO = managerCourseService.findById(dto.getCourseID());
        ManagerCourseConverter managerCourseConverter = new ManagerCourseConverter();
        Course course = managerCourseConverter.toEntity(managerCourseDTO);
        result.setCourse(course);
        return result;
    }
}
