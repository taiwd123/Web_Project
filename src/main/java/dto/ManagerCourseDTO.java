package dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ManagerCourseDTO extends AbstractDTO<ManagerCourseDTO>{
    private String courseName;
    private String courseImage;
    private String description;
    private Float price;
    private Integer countRegister;
    private Integer totalCart;
    private String alertCart;
}
