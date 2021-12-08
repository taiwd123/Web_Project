package dao;

import entity.Course;

import java.util.List;

public interface IManagerCourseDAO extends GenericDAO<Course> {
    public List<Course> getListAddCourse(Integer userID);
    public List<Course> getListCourseUser(Integer userID);
    public int countExamOfCourse(Integer courseID);
    public int countExamFinishOfCourse(Integer userID, Integer courseID);
}
