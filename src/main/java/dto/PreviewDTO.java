package dto;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PreviewDTO extends AbstractDTO<PreviewDTO>{
    private Integer userId;
    private Integer questionId;
    private  String answer;
}
