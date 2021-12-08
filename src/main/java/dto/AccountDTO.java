package dto;

import lombok.Getter;
import lombok.Setter;
import java.time.LocalDate;

@Getter
@Setter
public class AccountDTO extends AbstractDTO<AccountDTO> {
    private String username;
    private String pass;
    private String fullname;
    private String email;
    private LocalDate birthday;
    private String gender;
    private String phone;
    private Integer roleid;
    private Boolean active;
    private String comfirmPass;
    private String rolename;
    private String urlAvatar;
    private String oldPass;
    private String newPass;
    private String passreset;
    private String code;
}
