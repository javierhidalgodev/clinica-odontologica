package com.javierhidalgodev.clinicaodontologica.logica;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;

/**
 *
 * @author Javi
 */

@Entity
public class Odontologo extends Persona implements Serializable {
//    private int idOdontologist;
    private String specialization;
    @OneToOne
    private Horario workSchedule;
    @OneToMany(mappedBy = "odontologist")
    private List<Turno> workShift;
    @OneToOne
    private Usuario user;

    public Odontologo() {
    }

    public Odontologo(/*int idOdontologist,*/ String specialization, Horario workSchedule, List<Turno> workShift, Usuario user, String name, String surname, String phone, String address, Date birthdate, String dni) {
        super(name, surname, phone, address, birthdate, dni);
//        this.idOdontologist = idOdontologist;
        this.specialization = specialization;
        this.workSchedule = workSchedule;
        this.workShift = workShift;
        this.user = user;
    }

//    public int getIdOdontologist() {
//        return idOdontologist;
//    }
//
//    public void setIdOdontologist(int idOdontologist) {
//        this.idOdontologist = idOdontologist;
//    }

    public String getSpecialization() {
        return specialization;
    }

    public void setSpecialization(String specialization) {
        this.specialization = specialization;
    }

    public Horario getWorkSchedule() {
        return workSchedule;
    }

    public void setWorkSchedule(Horario workSchedule) {
        this.workSchedule = workSchedule;
    }

    public List<Turno> getWorkShift() {
        return workShift;
    }

    public void setWorkShift(List<Turno> workShift) {
        this.workShift = workShift;
    }

    public Usuario getUser() {
        return user;
    }

    public void setUser(Usuario user) {
        this.user = user;
    }
}
