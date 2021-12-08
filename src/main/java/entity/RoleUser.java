package entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;


@Getter
@Setter
@Table(name = "role_user")
@Entity
public class RoleUser {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "roleid", nullable = false)
    private Integer id;

    @Column(name = "rolename", nullable = false)
    private String rolename;
}