package dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class QuestionDTO extends AbstractDTO<QuestionDTO> {
    private Integer examID;
    private Integer questionNo;
    private String questionName;
    private String resultA;
    private String resultB;
    private String resultC;
    private String resultD;
    private String answer;
    private String userAnswer;
}
