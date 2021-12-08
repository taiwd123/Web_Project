package converter;

import dto.AccountDTO;
import dto.RoleUserDTO;
import entity.Account;
import entity.RoleUser;
import service.IAccountService;
import service.IRoleUserService;
import service.impl.AccountService;
import service.impl.RoleUserService;

public class AccountConverter {
    public AccountDTO toDto(Account entity) {
        if (entity == null){
            return null;
        }
        AccountDTO result = new AccountDTO();
        result.setId(entity.getId());
        result.setActive(entity.getActive());
        result.setBirthday(entity.getBirthday());
        result.setEmail(entity.getEmail());
        result.setGender(entity.getGender());
        result.setFullname(entity.getFullname());
        result.setPass(entity.getPass());
        result.setRoleid(entity.getRoleid().getId());
        result.setUsername(entity.getUsername());
        result.setPhone(entity.getPhone());
        result.setRolename(entity.getRoleid().getRolename());
        result.setUrlAvatar(entity.getAvatar());
        result.setPassreset(entity.getPassreset());
        return result;
    }

    public Account toEntity(AccountDTO dto) {
        if (dto == null){
            return null;
        }
        Account result = new Account();
        result.setId(dto.getId());
        result.setActive(dto.getActive());
        result.setBirthday(dto.getBirthday());
        result.setEmail(dto.getEmail());
        result.setGender(dto.getGender());
        result.setFullname(dto.getFullname());
        result.setPass(dto.getPass());
        result.setUsername(dto.getUsername());
        result.setPhone(dto.getPhone());
        result.setAvatar(dto.getUrlAvatar());
        result.setPassreset(dto.getPassreset());

        IRoleUserService roleUserService = new RoleUserService();
        RoleUserDTO roleUserDTO = roleUserService.findById(dto.getRoleid());
        RoleUserConverter roleUserConverter = new RoleUserConverter();
        RoleUser roleUser = roleUserConverter.toEntity(roleUserDTO);
        result.setRoleid(roleUser);
        return result;
    }
}
