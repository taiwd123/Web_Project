package service.impl;

import converter.ManagerCourseConverter;
import dao.IManagerCourseDAO;
import dao.impl.ManagerCourseDAO;
import dto.ManagerCourseDTO;
import entity.Course;
import service.IManagerCourseService;
import service.IRegisterCourseService;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.List;

public class ManagerCourseService implements IManagerCourseService {

    private IManagerCourseDAO managerCourseDAO = new ManagerCourseDAO();
    private ManagerCourseConverter managerCourseConverter = new ManagerCourseConverter();

    @Override
    public boolean insertCourse(ManagerCourseDTO course) {
        Course cs = managerCourseConverter.toEntity(course);
        if(managerCourseDAO.insert(cs)){
            return true;
        }
        return false;
    }

    @Override
    public Course updateCourse(ManagerCourseDTO course) {
        Course cs = managerCourseConverter.toEntity(course);
        return managerCourseDAO.update(cs);
    }

    @Override
    public boolean deleteCourse(ManagerCourseDTO course) {
        Course cs = managerCourseConverter.toEntity(course);
        if(managerCourseDAO.delete(cs)){
            return true;
        }
        return false;
    }

    @Override
    public ManagerCourseDTO findById(Integer id) {
        return managerCourseConverter.toDto(managerCourseDAO.findById(id));
    }

    @Override
    public List<Course> getListCourse(){
        List<Course> list = managerCourseDAO.findAll();
        return list;
    }

    @Override
    public List<Course> getListAddCourse(Integer userid) {
        return managerCourseDAO.getListAddCourse(userid);
    }

    @Override
    public List<Course> getListCourseUser(Integer userid) {
        return managerCourseDAO.getListCourseUser(userid);
    }

    @Override
    public int countExamOfCourse(Integer courseID) {
        return managerCourseDAO.countExamOfCourse(courseID);
    }

    @Override
    public int countExamFinishOfCourse(Integer userID, Integer courseID) {
        return managerCourseDAO.countExamFinishOfCourse(userID, courseID);
    }

    @Override
    public Integer countTotalCourse() {
        return managerCourseDAO.findAll().size();
    }

    @Override
    public void setListCountRegister(List<ManagerCourseDTO> list) {
        IRegisterCourseService iRegisterCourseService = new RegisterCourseService();
        for (ManagerCourseDTO managerCourseDTO: list
             ) {
            Integer courseId = managerCourseDTO.getId();
            Integer countRegister = iRegisterCourseService.countRegisterByCourseId(courseId);
            managerCourseDTO.setCountRegister(countRegister);
        }
    }

    @Override
    public List<ManagerCourseDTO> findAll() {
        List<Course> list = managerCourseDAO.findAll();
        List<ManagerCourseDTO> managerCourseDTOS = new ArrayList<>();
        for (Course course : list
                ) {
            ManagerCourseDTO managerCourseDTO = managerCourseConverter.toDto(course);
            managerCourseDTOS.add(managerCourseDTO);
        }
        return  managerCourseDTOS;
    }
}
