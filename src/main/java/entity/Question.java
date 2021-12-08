package entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Table(name = "question")
@Entity
public class Question {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "exam_id")
    private Exam exam;

    @Column(name = "question_no")
    private int questionNo;

    @Column(name = "question_name")
    private String questionName;

    @Column(name = "result_a")
    private String resultA;

    @Column(name = "result_b")
    private String resultB;

    @Column(name = "result_c")
    private String resultC;

    @Column(name = "result_d")
    private String resultD;

    @Column(name = "answer")
    private String answer;

}