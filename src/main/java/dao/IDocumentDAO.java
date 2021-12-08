package dao;

import entity.Document;
import entity.Exam;

import java.util.List;

public interface IDocumentDAO extends GenericDAO<Document> {
    public List<Document> findAllDocumentsByCourseID(Integer courseId);
}