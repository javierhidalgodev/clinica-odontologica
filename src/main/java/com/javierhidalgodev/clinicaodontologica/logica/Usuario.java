package com.javierhidalgodev.clinicaodontologica.logica;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

/**
 *
 * @author Javi
 */
@Entity
public class Usuario implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idUser;
    private String username;
    private String password;
    private String role;
    @OneToOne
    @JoinColumn(nullable = true)
    private Odontologo odontologist;
    @OneToOne
    @JoinColumn(nullable = true)
    private Secretario secretary;

    public Usuario() {
    }

    public Usuario(String username, String password, String role, Odontologo professional) {
        this.username = username;
        this.password = password;
        this.role = role;
        this.odontologist = professional;
        this.secretary = null;
    }

    public Usuario(String username, String password, String role, Secretario professional) {
        this.username = username;
        this.password = password;
        this.role = role;
        this.odontologist = null;
        this.secretary = professional;
    }

    public Usuario(String username, String password, String role) {
        this.username = username;
        this.password = password;
        this.role = role;
        this.odontologist = null;
        this.secretary = null;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Odontologo getOdontologist() {
        return odontologist;
    }

    public void setOdontologist(Odontologo odontologist) {
        this.odontologist = odontologist;
    }

    public Secretario getSecretary() {
        return secretary;
    }

    public void setSecretary(Secretario secretary) {
        this.secretary = secretary;
    }
}
