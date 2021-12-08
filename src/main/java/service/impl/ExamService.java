package service.impl;

import converter.ExamConverter;
import dao.IExamDAO;
import dao.IQuestionDAO;
import dao.impl.ExamDAO;
import dao.impl.QuestionDAO;
import dto.AccountDTO;
import dto.ExamDTO;
import dto.QuestionDTO;
import dto.ScoreDTO;
import entity.Course;
import entity.Exam;
import entity.Question;
import service.IExamService;
import service.IScoreService;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.List;

public class ExamService implements IExamService {

    private IExamDAO examDAO = new ExamDAO();
    private ExamConverter examConverter = new ExamConverter();
    private IQuestionDAO iQuestionDAO = new QuestionDAO();


    @Override
    public boolean insertExam(ExamDTO exam) {
        Exam exm = examConverter.toEntity(exam);
        if(examDAO.insert(exm)){
            return true;
        }
        return false;
    }

    @Override
    public Exam updateExam(ExamDTO exam) {
        Exam exm = examConverter.toEntity(exam);
        return examDAO.update(exm);
    }

    @Override
    public boolean deleteExam(ExamDTO exam) {
        Exam exm = examConverter.toEntity(exam);
        if(examDAO.delete(exm)){
            return true;
        }
        return false;
    }

    @Override
    public ExamDTO findById(Integer id) {
        return examConverter.toDto(examDAO.findById(id));
    }

    @Override
    public List<Exam> getListExam() {
        List<Exam> list = examDAO.findAll();
        return list;
    }

    @Override
    public List<ExamDTO> findAllQuestionsByCourseID(Integer courseId) {
        List<Exam> examDTOS = examDAO.findAllQuestionsByCourseID(courseId);
        List<ExamDTO> list = new ArrayList<>();
        if(examDTOS != null){
            for (Exam exam: examDTOS) {
                ExamDTO examDTO = examConverter.toDto(exam);
                list.add(examDTO);
            }
            return list;
        }
        return null;

    }

    @Override
    public void setScoreForListExam(ExamDTO examDTO, Integer userId) {
        IScoreService iScoreService = new ScoreService();
        for (ExamDTO exam: examDTO.getListResult()) {
            ScoreDTO score = iScoreService.findByExamIdAndUserId(exam.getId(),userId);

            Integer totalQuestion = this.getTotalQuestion(exam.getId());
            exam.setTotalQuestion(totalQuestion);

            if (score != null){
                exam.setScore(score.getExamScore());
                double tySo = 10 /  (double)totalQuestion ;
                double correctQuestion = score.getExamScore()  / tySo;
                exam.setCountCorrectQuestion((int)correctQuestion);
            }
            else {
                exam.setCountCorrectQuestion(0);
            }
        }
    }

    @Override
    public Integer getCourseIdByExamId(Integer examId) {
        Exam exam  = examDAO.findById(examId);
        if (exam != null){
            return exam.getCourse().getId();
        }
        return null;
    }

    @Override
    public Integer getTotalQuestion(Integer examId) {
        List<Question> list = iQuestionDAO.findAllQuestionsByExamID(examId);
        if(list == null){
            return 0;
        }
        return list.size();
    }

    @Override
    public Integer countTotalExam() {
        return examDAO.findAll().size();
    }
}
