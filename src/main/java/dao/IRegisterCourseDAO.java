package dao;

import entity.RegisterCourse;

import java.util.List;

public interface IRegisterCourseDAO extends GenericDAO<RegisterCourse> {
    List<RegisterCourse> findRegisterByCourseId(Integer courseId);
    List<RegisterCourse> findByCourseId(Integer courseId);
    List<Object[]> CountUserIdGroupByCourseId();
}
