package dto;

import lombok.Getter;
import lombok.Setter;


import java.util.ArrayList;
import java.util.List;


@Getter
@Setter
public class AbstractDTO<T> {
    private Integer id;
    private long[] ids;
    private List<T> listResult = new ArrayList<>();
    private Integer page;
    private Integer maxPageItem;
    private Integer totalPage;
    private Integer totalItem;
    private String sortName;
    private String sortBy;
    private String alert;
    private String message;
    private String type;
}



