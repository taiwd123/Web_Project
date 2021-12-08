package service.impl;

import converter.QuestionConverter;
import dao.IQuestionDAO;
import dao.impl.QuestionDAO;
import dto.ExamDTO;
import dto.PreviewDTO;
import dto.QuestionDTO;
import entity.Question;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.hibernate.Session;
import org.hibernate.query.Query;
import paging.Pageble;
import service.IQuestionService;
import util.HibernateUtil;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;

public class QuestionService implements IQuestionService {

    private IQuestionDAO questionDAO = new QuestionDAO();
    private QuestionConverter questionConverter = new QuestionConverter();
    @Override
    public boolean insertQuestion(QuestionDTO question) {
        Question ques = questionConverter.toEntity(question);
        if(questionDAO.insert(ques)){
            return true;
        }
        return false;
    }

    @Override
    public Question updateQuestion(QuestionDTO question) {
        Question ques = questionConverter.toEntity(question);
        return questionDAO.update(ques);
    }

    @Override
    public boolean deleteQuestion(QuestionDTO question) {
        Question ques = questionConverter.toEntity(question);
        if(questionDAO.delete(ques)){
            return true;
        }
        return false;
    }

    @Override
    public QuestionDTO findById(Integer id) {
        return questionConverter.toDto(questionDAO.findById(id));
    }

    @Override
    public List<Question> getListQuestion() {
        List<Question> list = questionDAO.findAll();
        return list;
    }



    @Override
    public String importExcelXLSX(String addressFile, ExamDTO examDTO){
        FileInputStream inp;
        String msg = null;
        try {
            /*inp = new FileInputStream("D:\\test1.xls");
            POIFSFileSystem myFile = new POIFSFileSystem(inp);*/
            /*File myFile = new File(addressFile);
            inp = new FileInputStream(myFile);
            XSSFWorkbook myWorkBook = new XSSFWorkbook (inp);*/

            //=======================Excel .XLS==============================//
            /*inp = new FileInputStream(addressFile);
            HSSFWorkbook myWorkBook = new HSSFWorkbook(inp);
            Sheet sheets = myWorkBook.getSheetAt(0);*/

            //======================Excel .XLSX=================================//
            inp = new FileInputStream(addressFile);
            XSSFWorkbook myWorkBook = new XSSFWorkbook (inp);
            XSSFSheet sheets = myWorkBook.getSheetAt(0);

            for(int i = 1; i <= sheets.getLastRowNum(); i++){
                Row row = sheets.getRow(i);
                int question_no = (int) row.getCell(0).getNumericCellValue();
                String question_name = row.getCell(1).getStringCellValue();
                String result_a = row.getCell(2).getStringCellValue();
                String result_b = row.getCell(3).getStringCellValue();
                String result_c = row.getCell(4).getStringCellValue();
                String result_d = row.getCell(5).getStringCellValue();
                String answer = row.getCell(6).getStringCellValue();

                QuestionDTO questionDTO = new QuestionDTO();
                questionDTO.setExamID(examDTO.getId());
                questionDTO.setQuestionNo(question_no);
                questionDTO.setQuestionName(question_name);
                questionDTO.setResultA(result_a);
                questionDTO.setResultB(result_b);
                questionDTO.setResultC(result_c);
                questionDTO.setResultD(result_d);
                questionDTO.setAnswer(answer);

                insertQuestion(questionDTO);
            }
            myWorkBook.close();
            msg = "Success";
        } catch (Exception e) {
            msg = e.getMessage();
        }
        return msg;
    }

    @Override
    public List<Question> getListQuestionByExamId(int examId) {
        List<Question> list = questionDAO.findAllQuestionsByExamID(examId);
        return list;
    }

    @Override
    public List<QuestionDTO> getListQuestionDTOByExamId(Integer examId) {
        List<Question> list = questionDAO.findAllQuestionsByExamID(examId);
        List<QuestionDTO> questionDTOList = new ArrayList<>();
        for (Question question: list) {
            QuestionDTO questionDTO = questionConverter.toDto(question);
            questionDTOList.add(questionDTO);
        }
        return  questionDTOList;
    }

    @Override
    public List<QuestionDTO> findAll(Pageble pageble, Integer examID) {

        List<Question> list = questionDAO.findAll(pageble, examID);
        List<QuestionDTO> questionDTOList = new ArrayList<>();
        if(list !=null){
            for (Question question: list) {
                QuestionDTO questionDTO = questionConverter.toDto(question);
                questionDTOList.add(questionDTO);
            }
            return  questionDTOList;
        }
       return null;
    }

    @Override
    public int getTotalItem(Integer examID) {
        List<Question> lists =  questionDAO.findAllQuestionsByExamID(examID);
        return  lists.size();
    }

    @Override
    public List<QuestionDTO> setListAnswer(List<QuestionDTO> list, List<QuestionDTO> oldList, HttpServletRequest request) {
        for (QuestionDTO question: list) {
            for (QuestionDTO oldQuestion: oldList) {
                if (question.getId().toString().equals(oldQuestion.getId().toString()) ) {
                    String name = oldQuestion.getId().toString();
                    String value = request.getParameter(name);
                    question.setUserAnswer(value);
                }
            }
        }
        return  list;
    }

    @Override
    public QuestionDTO setListPreview(QuestionDTO questionDTO, List<PreviewDTO> listPreview) {
        for (QuestionDTO questionDTOPreview: questionDTO.getListResult()) {
            for (PreviewDTO previewDTO: listPreview) {
                if (questionDTOPreview.getId().toString().equals(previewDTO.getQuestionId().toString()) ){
                    questionDTOPreview.setUserAnswer(previewDTO.getAnswer());
                }
            }
        }
        return  questionDTO;
    }

    @Override
    public Integer countTotalQuestion() {
        return questionDAO.findAll().size();
    }
}
