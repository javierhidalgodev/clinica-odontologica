package com.javierhidalgodev.clinicaodontologica.logica;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

/**
 *
 * @author Javi
 */

@Entity
public class Paciente extends Persona implements Serializable {

//    private int idPatient;
    private boolean prepaidHealth;
    private String bloodType;
    @OneToOne(cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(nullable = true)
    private Responsable guardian;
    @OneToMany(mappedBy = "patient", cascade = CascadeType.ALL)
    private List<Turno> appointments;

    public Paciente() {
        
    }

    public Paciente(/*int idPatient,*/ boolean prepaidHealth, String bloodType, Responsable guardian, List<Turno> appointments, String name, String surname, String phone, String address, Date birthdate, String dni) {
        super(name, surname, phone, address, birthdate, dni);
//        this.idPatient = idPatient;
        this.prepaidHealth = prepaidHealth;
        this.bloodType = bloodType;
        this.guardian = guardian;
        this.appointments = appointments;
    }
    
//    public int getIdPatient() {
//        return idPatient;
//    }
//
//    public void setIdPatient(int idPatient) {
//        this.idPatient = idPatient;
//    }

    public boolean getPrepaidHealth() {
        return prepaidHealth;
    }

    public void setPrepaidHealth(boolean prepaidHealth) {
        this.prepaidHealth = prepaidHealth;
    }

    public String getBloodType() {
        return bloodType;
    }

    public void setBloodType(String bloodType) {
        this.bloodType = bloodType;
    }

    public Responsable getGuardian() {
        return guardian;
    }

    public void setGuardian(Responsable guardian) {
        this.guardian = guardian;
    }

    public List<Turno> getAppointments() {
        return appointments;
    }

    public void setAppointments(List<Turno> appointments) {
        this.appointments = appointments;
    }
}
