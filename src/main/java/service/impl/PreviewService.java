package service.impl;

import converter.PreviewConverter;
import dao.IPreviewDAO;
import dao.impl.PreviewDAO;
import dto.PreviewDTO;
import dto.QuestionDTO;
import entity.Preview;
import service.IPreviewService;
import service.IQuestionService;

import java.util.ArrayList;
import java.util.List;

public class PreviewService implements IPreviewService {
    private IPreviewDAO iPreviewDAO = new PreviewDAO();
    private PreviewConverter previewConverter = new PreviewConverter();


    @Override
    public boolean insertPreview(PreviewDTO previewDTO) {
        Preview preview = previewConverter.toEntity(previewDTO);
        if (iPreviewDAO.insert(preview)){
            return true;
        }
        return false;
    }

    @Override
    public boolean insertListPreviewWithQuestion(List<QuestionDTO> questionDTOList, Integer userId) {
        for (QuestionDTO questionDTO: questionDTOList) {
            String userAnswer = questionDTO.getUserAnswer();
            if (userAnswer != null){
                Integer questionId = questionDTO.getId();
                PreviewDTO previewDTO = new PreviewDTO();
                previewDTO.setQuestionId(questionId);
                previewDTO.setUserId(userId);
                previewDTO.setAnswer(userAnswer);
                if (!this.insertPreview(previewDTO)){
                    return false;
                }
            }
        }
        return true;
    }

    @Override
    public List<PreviewDTO> findByUserId(Integer userid) {
        List<Preview> list = iPreviewDAO.findByUserId(userid);
        List<PreviewDTO> previewDTOS = new ArrayList<>();
        if(list != null){
            for (Preview preview: list
            ) {
                PreviewDTO previewDTO = previewConverter.toDto(preview);
                previewDTOS.add(previewDTO);
            }
            return previewDTOS;
        }
        return null;
    }

    @Override
    public boolean deleteListPreviewByExamIdAndUserId(Integer examId, Integer userId) {
        List<PreviewDTO> previewDTOS = this.findByUserId(userId);
        IQuestionService questionService = new QuestionService();
        List<QuestionDTO> questionDTOList = questionService.getListQuestionDTOByExamId(examId);
        for (PreviewDTO previewDTO : previewDTOS){
            for (QuestionDTO questionDTO: questionDTOList) {
                if (previewDTO.getQuestionId() == questionDTO.getId()){
                    Preview preview = previewConverter.toEntity(previewDTO);
                    if(!iPreviewDAO.delete(preview)){
                        return false;
                    };
                }
            }
        }

        return true;
    }
}
