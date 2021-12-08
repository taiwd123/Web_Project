package converter;

import dto.AccountDTO;
import dto.ManagerCourseDTO;
import dto.RegisterCourseDTO;
import entity.Account;
import entity.Course;
import entity.RegisterCourse;
import service.IAccountService;
import service.IManagerCourseService;
import service.impl.AccountService;
import service.impl.ManagerCourseService;

public class RegisterCourseConverter {
    public RegisterCourseDTO toDto(RegisterCourse entity){
        if (entity == null){
            return null;
        }
        RegisterCourseDTO result = new RegisterCourseDTO();
        result.setUserID(entity.getUser().getId());
        result.setCourseID(entity.getCourse().getId());

        return result;
    }

    public RegisterCourse toEntity(RegisterCourseDTO dto){
        if(dto == null){
            return null;
        }
        RegisterCourse result = new RegisterCourse();

        IAccountService accountService = new AccountService();
        AccountDTO accountDTO = accountService.findById(dto.getUserID());
        AccountConverter accountConverter = new AccountConverter();
        Account account = accountConverter.toEntity(accountDTO);
        result.setUser(account);

        IManagerCourseService managerCourseService = new ManagerCourseService();
        ManagerCourseDTO managerCourseDTO = managerCourseService.findById(dto.getCourseID());
        ManagerCourseConverter managerCourseConverter = new ManagerCourseConverter();
        Course course = managerCourseConverter.toEntity(managerCourseDTO);
        result.setCourse(course);

        return result;
    }
}
