package com.javierhidalgodev.clinicaodontologica.logica;

import java.util.Date;

/**
 *
 * @author Javi
 */
public class Responsable extends Persona {
    private int idGuardian;
    private String relationship;
//    private Paciente patient; // No la necesita, es unidireccional

    public Responsable() {
    }

    public Responsable(int idGuardian, String relationship, /*Paciente patient,*/ String name, String surname, String phone, String address, Date birthdate, String dni) {
        super(name, surname, phone, address, birthdate, dni);
        this.idGuardian = idGuardian;
        this.relationship = relationship;
//        this.patient = patient;
    }

    public int getIdGuardian() {
        return idGuardian;
    }

    public void setIdGuardian(int idGuardian) {
        this.idGuardian = idGuardian;
    }

    public String getRelationship() {
        return relationship;
    }

    public void setRelationship(String relationship) {
        this.relationship = relationship;
    }

//    public Paciente getPatient() {
//        return patient;
//    }
//
//    public void setPatient(Paciente patient) {
//        this.patient = patient;
//    }
}
