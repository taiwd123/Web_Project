package service;

import dto.ExamDTO;
import dto.PreviewDTO;
import dto.QuestionDTO;
import entity.Exam;
import entity.Question;
import paging.Pageble;


import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface IQuestionService {
    boolean insertQuestion(QuestionDTO question);
    Question updateQuestion(QuestionDTO question);
    boolean deleteQuestion(QuestionDTO question);
    QuestionDTO findById(Integer id);
    List<Question> getListQuestion();
    List<QuestionDTO> getListQuestionDTOByExamId(Integer examId);
    public String importExcelXLSX(String addressFile, ExamDTO examDTO);
    List<Question> getListQuestionByExamId(int examId);
    List<QuestionDTO> findAll(Pageble pageble, Integer examID);
    int getTotalItem(Integer examid);
    List<QuestionDTO>setListAnswer(List<QuestionDTO> list, List<QuestionDTO> oldList, HttpServletRequest request);
    QuestionDTO setListPreview(QuestionDTO questionDTO, List<PreviewDTO> listPreview);
    Integer countTotalQuestion();
}
