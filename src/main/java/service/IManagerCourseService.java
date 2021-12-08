package service;

import dto.AccountDTO;
import dto.ManagerCourseDTO;
import entity.Course;

import java.util.List;

public interface IManagerCourseService {
    boolean insertCourse(ManagerCourseDTO course);
    Course updateCourse(ManagerCourseDTO course);
    boolean deleteCourse(ManagerCourseDTO course);
    ManagerCourseDTO findById(Integer id);
    List<Course> getListCourse();
    List<Course> getListAddCourse(Integer userid);
    List<Course> getListCourseUser(Integer userid);
    int countExamOfCourse(Integer courseID);
    int countExamFinishOfCourse(Integer userID, Integer courseID);
    Integer countTotalCourse();
    void setListCountRegister(List<ManagerCourseDTO> list);
    List<ManagerCourseDTO> findAll();
}
