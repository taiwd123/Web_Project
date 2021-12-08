package converter;


import dto.AccountDTO;
import dto.ExamDTO;
import dto.ScoreDTO;
import entity.Score;
import service.IAccountService;
import service.IExamService;
import service.impl.AccountService;
import service.impl.ExamService;

public class ScoreConveter {
    public ScoreDTO toDto(Score entity){
        if(entity == null){
            return null;
        }
        ScoreDTO result = new ScoreDTO();
        result.setId(entity.getId());
        result.setExamScore(entity.getExamScore());
        result.setExamId(entity.getExam().getId());
        result.setUserId(entity.getUser().getId());
        return result;
    }
    public Score toEntity(ScoreDTO dto){
        if(dto == null){
            return null;
        }
        Score result = new Score();
        result.setId(dto.getId());
        result.setExamScore(dto.getExamScore());

        IAccountService accountService = new AccountService();
        AccountDTO accountDTO = accountService.findById(dto.getUserId());
        AccountConverter accountConverter = new AccountConverter();
        result.setUser(accountConverter.toEntity(accountDTO));

        IExamService iExamService = new ExamService();
        ExamConverter examConverter = new ExamConverter();
        ExamDTO examDTO = iExamService.findById(dto.getExamId());
        result.setExam(examConverter.toEntity(examDTO));
        return result;
    }
}
