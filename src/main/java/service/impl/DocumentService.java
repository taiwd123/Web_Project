package service.impl;

import converter.DocumentConverter;
import dao.IDocumentDAO;
import dao.impl.DocumentDAO;
import dto.DocumentDTO;
import entity.Document;
import service.IDocumentService;

import java.util.ArrayList;
import java.util.List;

public class DocumentService implements IDocumentService {
    private IDocumentDAO documentDAO=new DocumentDAO();
    private DocumentConverter documentConverter=new DocumentConverter();
    @Override
    public boolean insertDocument(DocumentDTO documentDTO) {
        Document doc=documentConverter.toEntity(documentDTO);
        if(documentDAO.insert(doc)){
            return true;
        }
        return false;
    }

    @Override
    public Document updateDocument(DocumentDTO documentDTO) {
        Document document=documentConverter.toEntity(documentDTO);
        return documentDAO.update(document);
    }

    @Override
    public boolean deleteDocument(DocumentDTO documentDTO) {
        Document document=documentConverter.toEntity(documentDTO);
        if(documentDAO.delete(document)){
            return true;
        }
        return false;
    }

    @Override
    public List<Document> getListDocument() {
        List<Document> list = documentDAO.findAll();
        return list;
    }

    @Override
    public List<Document> getAllDocumentsByCourseID(Integer courseId) {
        List<Document> documentList=documentDAO.findAllDocumentsByCourseID(courseId);
        return documentList;
    }

    @Override
    public List<DocumentDTO> findAllDocumentsByCourseID(Integer courseId) {
        List<Document> documentDTOS=documentDAO.findAllDocumentsByCourseID(courseId);
        List<DocumentDTO>list=new ArrayList<>();
        if(documentDTOS != null){
            for (Document doc: documentDTOS) {
                DocumentDTO documentDTO = documentConverter.toDto(doc);
                list.add(documentDTO);
            }
            return list;
        }
        return null;
    }
}