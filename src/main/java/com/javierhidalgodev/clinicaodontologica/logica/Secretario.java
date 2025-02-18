package com.javierhidalgodev.clinicaodontologica.logica;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.OneToOne;

/**
 *
 * @author Javi
 */

@Entity
public class Secretario extends Persona {
//    private int idSecretary;
    private String floor;
    @OneToOne
    private Usuario user;

    public Secretario() {
    }

    public Secretario(/*int idSecretary,*/ String floor, Usuario user, String name, String surname, String phone, String address, Date birthdate, String dni) {
        super(name, surname, phone, address, birthdate, dni);
//        this.idSecretary = idSecretary;
        this.floor = floor;
        this.user = user;
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

    public Usuario getUser() {
        return user;
    }

    public void setUser(Usuario user) {
        this.user = user;
    }
}
