package service.impl;

import converter.ScoreConveter;
import dao.impl.ScoreDAO;
import dto.QuestionDTO;
import dto.ScoreDTO;
import entity.Score;
import service.IScoreService;

import java.util.List;

public class ScoreService implements IScoreService {

    private ScoreConveter scoreConveter = new ScoreConveter();
    private ScoreDAO scoreDAO = new ScoreDAO();

    @Override
    public Double calculateScore(List<QuestionDTO> questionDTOList) {
        Integer count = 0;
        Double sum = questionDTOList.size() * 1.0;
        for (QuestionDTO questionDTO: questionDTOList
             ) {
            String answer = questionDTO.getAnswer();
            String userAnswer = questionDTO.getUserAnswer();
            if (userAnswer != null && userAnswer.equals(answer)){
                count++;
            }
        }
        double score = (10/sum)*count;
        return (double)Math.round(score*100)/100;
    }

    @Override
    public boolean insertScore(ScoreDTO scoreDTO) {
        Score score = scoreConveter.toEntity(scoreDTO);
        if (scoreDAO.insert(score)){
            return true;
        }
        return false;
    }

    @Override
    public ScoreDTO findByExamIdAndUserId(Integer examId, Integer userId) {
        return scoreConveter.toDto(scoreDAO.findByExamIdAndUserId(examId,userId));
    }

    @Override
    public boolean deleteScore(ScoreDTO scoreDTO) {
        Score score = scoreConveter.toEntity(scoreDTO);
        if (scoreDAO.delete(score)){
            return true;
        }
        return false;
    }
}
