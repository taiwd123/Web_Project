package service.impl;


import converter.RoleUserConverter;
import dao.IRoleUserDAO;
import dao.impl.RoleUserDAO;
import dto.RoleUserDTO;
import entity.RoleUser;
import service.IRoleUserService;

import javax.inject.Inject;

public class RoleUserService implements IRoleUserService {

//    @Inject
    private IRoleUserDAO role = new RoleUserDAO();
    private RoleUserConverter roleConvert = new RoleUserConverter();

    @Override
    public RoleUserDTO findById(Integer id) {
        return roleConvert.toDto(role.findById(id));
    }
}
