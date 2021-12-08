package entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Setter
@Getter
@Table(name = "course")
@Entity
public class Course {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;


    @Column(name = "course_name")
    private String courseName;


    @Column(name = "course_image")
    private String courseImage;


    @Column(name = "description")
    private String description;

    @Column(name = "price")
    private Float price;

}