package service;

import dto.RoleUserDTO;


public interface IRoleUserService {
    RoleUserDTO findById(Integer id);
}
