package dao;

import entity.Question;
import paging.Pageble;

import java.util.List;

public interface GenericDAO<T> {
    boolean insert (T obj);
    T  update (T obj);
    boolean delete (T obj);
    List<T> findAll();
    T findById(Integer Id);
    List<T> findAll(Pageble pageble, Integer examID);
}
