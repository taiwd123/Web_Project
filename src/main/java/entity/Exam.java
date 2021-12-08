package entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Table(name = "exam")
@Entity
public class Exam {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;


    @Column(name = "exam_name")
    private String examName;

    @ManyToOne
    @JoinColumn(name = "course_id")
    private Course course;

    @Column(name = "file_check")
    private String fileCheck;

}