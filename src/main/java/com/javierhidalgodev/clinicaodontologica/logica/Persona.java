package com.javierhidalgodev.clinicaodontologica.logica;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.MappedSuperclass;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Javi
 * La estrategia de herencia TABLE_PER_CLASS indica a la base de datos que debe haber una clase tabla por cada una de las clases que heredan de esta clase.
 * Además se añade el ID en la clase madre, para que todas las hijas tengan la misma estrategia de generación y no tenga que duplicarse código.
 */

@MappedSuperclass
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public class Persona implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;
    private String surname;
    private String phone;
    private String address;
    @Temporal(TemporalType.DATE)
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

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
