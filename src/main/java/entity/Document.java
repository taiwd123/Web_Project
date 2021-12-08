package entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Table(name = "document")
@Entity
public class Document {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "documentname", nullable = false)
    private String documentName;

    @Column(name = "documentlink",nullable = false)
    private String documentLink;

    @ManyToOne
    @JoinColumn(name = "documentcourseid")
    private Course course;

}