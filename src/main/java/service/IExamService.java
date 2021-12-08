package service;

import dto.ExamDTO;

import entity.Exam;

import java.util.List;

public interface IExamService {
    boolean insertExam(ExamDTO exam);
    Exam updateExam(ExamDTO exam);
    boolean deleteExam(ExamDTO exam);
    ExamDTO findById(Integer id);
    List<Exam> getListExam();
    public List<ExamDTO> findAllQuestionsByCourseID(Integer courseId);
    public void setScoreForListExam(ExamDTO examDTO, Integer userId);
    public Integer getCourseIdByExamId(Integer examId);
    public Integer getTotalQuestion(Integer examId);
    public Integer countTotalExam();
}
