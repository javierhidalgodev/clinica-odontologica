package com.javierhidalgodev.clinicaodontologica.logica;

import java.util.Date;

/**
 *
 * @author Javi
 */
public class Persona {
    
    private String name;
    private String surname;
    private String phone;
    private String address;
    private Date birthdate;
    private String dni;
    
    public Persona() {
    
    };

    public Persona(String name, String surname, String phone, String address, Date birthdate, String dni) {
        this.name = name;
        this.surname = surname;
        this.phone = phone;
        this.address = address;
        this.birthdate = birthdate;
        this.dni = dni;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(Date birthdate) {
        this.birthdate = birthdate;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }
}
