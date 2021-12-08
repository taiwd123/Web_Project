package dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ExamDTO extends AbstractDTO<ExamDTO> {
    private String examName;
    private Integer courseID;
    private String fileCheck;
    private Double score;
    private Integer countCorrectQuestion;
    private Integer totalQuestion;
}
