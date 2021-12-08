package service.impl;

import converter.RegisterCourseConverter;

import dao.IRegisterCourseDAO;
import dao.impl.RegisterCourseDAO;
import dto.RegisterCourseDTO;
import entity.Course;
import entity.RegisterCourse;
import service.IManagerCourseService;
import service.IRegisterCourseService;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

public class RegisterCourseService implements IRegisterCourseService {

    private IRegisterCourseDAO registerCourseDAO = new RegisterCourseDAO();
    private RegisterCourseConverter registerCourseConverter = new RegisterCourseConverter();

    @Override
    public boolean insertRegisterCourse(RegisterCourseDTO registerCourseDTO) {
        RegisterCourse registerCourse = registerCourseConverter.toEntity(registerCourseDTO);
        if(registerCourseDAO.insert(registerCourse)){
            return true;
        }
        return false;
    }

    @Override
    public RegisterCourse updateRegisterCourse(RegisterCourseDTO registerCourseDTO) {
        return registerCourseDAO.update(registerCourseConverter.toEntity(registerCourseDTO));
    }

    @Override
    public boolean deleteRegisterCourse(RegisterCourseDTO registerCourseDTO) {
        RegisterCourse registerCourse = registerCourseConverter.toEntity(registerCourseDTO);
        if(registerCourseDAO.delete(registerCourse)){
            return true;
        }
        return false;
    }

    @Override
    public Integer countRegisterByCourseId(Integer courseId) {
        if(registerCourseDAO.findByCourseId(courseId)==null){
            return 0;
        }
        return registerCourseDAO.findByCourseId(courseId).size();
    }

    @Override
    public List<Hashtable> StatsDoanhThu() {
        List<Object[]> lists = registerCourseDAO.CountUserIdGroupByCourseId();
        IManagerCourseService iManagerCourseService = new ManagerCourseService();
        List<Course> courses = iManagerCourseService.getListCourse();

        List<Hashtable> result = new ArrayList<Hashtable>();
        if (courses != null){
            for (Course course:courses) {
                Hashtable<String, String> temp = new Hashtable<String, String>();
                temp.put("courseName", course.getCourseName());
                temp.put("coureId", String.valueOf(course.getId()));
                temp.put("price", String.valueOf(0));
                if (lists != null){
                    for (Object[] obj: lists) {
                        Integer courseId =  (Integer) obj[1] ;
                        if (courseId == course.getId()){
                            Float costs =  (((Long) obj[0]) * course.getPrice());
                            temp.replace("price", String.valueOf(costs));
                        }
                    }
                    result.add(temp);
                }

            }
            return result;
        }
        return null;
    }
}
