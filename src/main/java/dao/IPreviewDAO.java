package dao;

import entity.Preview;

import java.util.List;

public interface IPreviewDAO extends GenericDAO<Preview> {
    public List<Preview> findByUserId(Integer userId);
}
