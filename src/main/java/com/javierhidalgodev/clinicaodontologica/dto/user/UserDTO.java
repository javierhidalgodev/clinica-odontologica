package com.javierhidalgodev.clinicaodontologica.dto.user;

/**
 *
 * @author Javi
 */
public class UserDTO {
    private int id;
    private String username;
    private String role;
    private String professional;
    
    public UserDTO(int id, String username, String role, String professional){
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

    public String getProfessional() {
        return professional;
    }

    public void setProfessional(String professional) {
        this.professional = professional;
    }
}
