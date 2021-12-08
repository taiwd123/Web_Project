package converter;

import dto.*;
import entity.Preview;
import service.IAccountService;
import service.IQuestionService;
import service.impl.AccountService;
import service.impl.QuestionService;

public class PreviewConverter {
    public PreviewDTO toDto(Preview entity){
        if(entity == null){
            return null;
        }
        PreviewDTO result = new PreviewDTO();
        result.setId(entity.getId());
        result.setAnswer(entity.getAnswer());
        result.setQuestionId(entity.getQuestion().getId());
        result.setUserId(entity.getUser().getId());
        return  result;
    }

    public Preview toEntity(PreviewDTO dto){
        if(dto == null){
            return null;
        }

        Preview result = new Preview();
        result.setId(dto.getId());
        result.setAnswer(dto.getAnswer());

        IAccountService accountService = new AccountService();
        AccountDTO accountDTO = accountService.findById(dto.getUserId());
        AccountConverter accountConverter = new AccountConverter();
        result.setUser(accountConverter.toEntity(accountDTO));

        IQuestionService iQuestionService = new QuestionService();
        QuestionConverter questionConverter = new QuestionConverter();
        QuestionDTO questionDTO = iQuestionService.findById(dto.getQuestionId());
        result.setQuestion(questionConverter.toEntity(questionDTO));
        return result;
    }
}
