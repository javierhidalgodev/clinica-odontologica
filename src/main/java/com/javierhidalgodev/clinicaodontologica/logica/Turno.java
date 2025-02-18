package com.javierhidalgodev.clinicaodontologica.logica;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Javi
 */

@Entity
public class Turno implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idAppointment;
    @Temporal(TemporalType.DATE)
    private Date appointment;
    private String hour;
    private String treatment;
    @ManyToOne
    @JoinColumn(name = "idAppointmentFK") // Esto esá mal
    private Odontologo odontologist;
    @ManyToOne
    @JoinColumn(name = "idPatientFK")
    private Paciente patient;

    public Turno() {
    }

    public Turno(int idAppointment, Date appointment, String hour, String treatment/*, Odontologo odontologist*/) {
        this.idAppointment = idAppointment;
        this.appointment = appointment;
        this.hour = hour;
        this.treatment = treatment;
//        this.odontologist = odontologist;
    }

    public int getIdAppointment() {
        return idAppointment;
    }

    public void setIdAppointment(int idAppointment) {
        this.idAppointment = idAppointment;
    }

    public Date getAppointment() {
        return appointment;
    }

    public void setAppointment(Date appointment) {
        this.appointment = appointment;
    }

    public String getHour() {
        return hour;
    }

    public void setHour(String hour) {
        this.hour = hour;
    }

    public String getTreatment() {
        return treatment;
    }

    public void setTreatment(String treatment) {
        this.treatment = treatment;
    }

//    public Odontologo getOdontologist() {
//        return odontologist;
//    }
//
//    public void setOdontologist(Odontologo odontologist) {
//        this.odontologist = odontologist;
//    }
}
