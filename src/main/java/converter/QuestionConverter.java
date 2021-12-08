package converter;

import dto.ExamDTO;
import dto.QuestionDTO;
import entity.Exam;
import entity.Question;
import service.IExamService;
import service.impl.ExamService;

public class QuestionConverter {
    public QuestionDTO toDto(Question entity){
        if(entity == null){
            return null;
        }
        QuestionDTO result = new QuestionDTO();

        result.setId(entity.getId());
        result.setExamID(entity.getExam().getId());
        result.setQuestionNo(entity.getQuestionNo());
        result.setQuestionName(entity.getQuestionName());
        result.setResultA(entity.getResultA());
        result.setResultB(entity.getResultB());
        result.setResultC(entity.getResultC());
        result.setResultD(entity.getResultD());
        result.setAnswer(entity.getAnswer());
        return result;
    }

    public Question toEntity(QuestionDTO dto){
        if (dto == null){
            return null;
        }

        Question result = new Question();

        result.setId(dto.getId());
        result.setQuestionNo(dto.getQuestionNo());
        result.setQuestionName(dto.getQuestionName());
        result.setResultA(dto.getResultA());
        result.setResultB(dto.getResultB());
        result.setResultC(dto.getResultC());
        result.setResultD(dto.getResultD());
        result.setAnswer(dto.getAnswer());

        IExamService examService = new ExamService();
        ExamDTO examDTO = examService.findById(dto.getExamID());
        ExamConverter examConverter = new ExamConverter();
        Exam exam = examConverter.toEntity(examDTO);
        result.setExam(exam);
        return result;

    }
}
