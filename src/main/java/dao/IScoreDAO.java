package dao;


import entity.Score;

public interface IScoreDAO extends GenericDAO<Score> {
    public Score findByExamIdAndUserId(Integer examId, Integer userId);
}
