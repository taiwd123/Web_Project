package dao;

import dto.ExamDTO;
import entity.Exam;

import java.util.List;

public interface IExamDAO extends GenericDAO<Exam>{
    public List<Exam> findAllQuestionsByCourseID(Integer courseId);
}
