package service;

import dto.DocumentDTO;
import entity.Document;
import entity.Exam;

import java.util.List;


public interface IDocumentService {
    boolean insertDocument(DocumentDTO documentDTO);
    Document updateDocument(DocumentDTO documentDTO);
    boolean deleteDocument(DocumentDTO documentDTO);
    List<Document> getListDocument();
    List<Document> getAllDocumentsByCourseID(Integer courseId);
    public List<DocumentDTO> findAllDocumentsByCourseID(Integer courseId);
}
