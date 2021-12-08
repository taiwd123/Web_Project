package entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDate;

@Getter
@Setter
@Table(name = "account", indexes = {
        @Index(name = "account_username_key", columnList = "username", unique = true)
})
@Entity
public class Account {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;


    @Column(name = "username", nullable = false)
    private String username;


    @Column(name = "pass", nullable = false)
    private String pass;


    @Column(name = "fullname")
    private String fullname;


    @Column(name = "email")
    private String email;

    @Column(name = "birthday")
    private LocalDate birthday;


    @Column(name = "gender")
    private String gender;


    @Column(name = "phone")
    private String phone;

    @ManyToOne
    @JoinColumn(name = "roleid")
    private RoleUser roleid;

    @Column(name = "active")
    private Boolean active;

    @Column(name = "avatar")
    private String avatar;

    @Column(name = "passreset")
    private String passreset;
}