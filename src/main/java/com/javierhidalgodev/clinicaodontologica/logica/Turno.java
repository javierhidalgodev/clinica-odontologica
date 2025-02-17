package com.javierhidalgodev.clinicaodontologica.logica;

import java.util.Date;

/**
 *
 * @author Javi
 */
public class Turno {
    private int idAppointment;
    private Date appointment;
    private String hour;
    private String treatment;
//    private Odontologo odontologist;

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
