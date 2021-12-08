package dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DocumentDTO extends AbstractDTO<DocumentDTO>{
    private String documentName;
    private String documentLink;
    private Integer courseID;
}