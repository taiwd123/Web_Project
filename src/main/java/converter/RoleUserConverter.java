package converter;

import dto.AccountDTO;
import dto.RoleUserDTO;
import entity.Account;
import entity.RoleUser;

public class RoleUserConverter {
    public RoleUserDTO toDto(RoleUser entity) {
        RoleUserDTO result = new RoleUserDTO();
        result.setId(entity.getId());
        result.setRolename(entity.getRolename());
        return result;
    }

    public RoleUser toEntity(RoleUserDTO dto) {
        RoleUser result = new RoleUser();
        result.setId(dto.getId());
        result.setRolename(dto.getRolename());
        return result;
    }

}
