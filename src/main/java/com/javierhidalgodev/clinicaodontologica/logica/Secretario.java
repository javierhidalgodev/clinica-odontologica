package com.javierhidalgodev.clinicaodontologica.logica;

import com.javierhidalgodev.clinicaodontologica.dto.user.UserDTO;
import java.util.Date;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

/**
 *
 * @author Javi
 */

@Entity
public class Secretario extends Persona {
//    private int idSecretary;
    private String floor;
    @OneToOne(cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(nullable = true)
    private Usuario user;

    public Secretario() {
    }

    public Secretario(/*int idSecretary,*/ String floor /*, Usuario user*/, String name, String surname, String phone, String address, Date birthdate, String dni) {
        super(name, surname, phone, address, birthdate, dni);
//        this.idSecretary = idSecretary;
        this.floor = floor;
//        this.user = user;
    }

//    public int getIdSecretary() {
//        return idSecretary;
//    }
//
//    public void setIdSecretary(int idSecretary) {
//        this.idSecretary = idSecretary;
//    }

    public String getFloor() {
        return floor;
    }

    public void setFloor(String floor) {
        this.floor = floor;
    }

    public UserDTO getUser() {
        if(user != null) {
            return new UserDTO(user.getIdUser(), user.getUsername(), user.getRole(), null);
        }
        
        return null;
    }

    public void setUser(Usuario user) {
        this.user = user;
        
        if(user != null) {
            user.setSecretary(this);
        }
    }
}
