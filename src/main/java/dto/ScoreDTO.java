package dto;


import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ScoreDTO extends AbstractDTO<ScoreDTO>{

    private Integer userId;
    private Integer examId;
    private Double examScore;
}
