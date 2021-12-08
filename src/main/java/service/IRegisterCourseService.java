package service;



import dto.RegisterCourseDTO;
import entity.RegisterCourse;

import java.util.Hashtable;
import java.util.List;

public interface IRegisterCourseService {
    boolean insertRegisterCourse(RegisterCourseDTO registerCourseDTO);
    RegisterCourse updateRegisterCourse(RegisterCourseDTO registerCourseDTO);
    boolean deleteRegisterCourse(RegisterCourseDTO registerCourseDTO);
    Integer countRegisterByCourseId(Integer courseId);
    List<Hashtable> StatsDoanhThu();
}
