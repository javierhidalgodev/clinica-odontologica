package com.javierhidalgodev.clinicaodontologica.dto.user;

import com.javierhidalgodev.clinicaodontologica.logica.Persona;

/**
 *
 * @author Javi
 */
public class UserDTO {
    private int id;
    private String username;
    private String role;
    private Persona professional;
    
    public UserDTO(int id, String username, String role, Persona professional){
        this.id = id;
        this.username = username;
        this.role = role;
        this.professional = professional;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Persona getProfessional() {
        return professional;
    }

    public void setProfessional(Persona professional) {
        this.professional = professional;
    }
}
