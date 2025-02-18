package com.javierhidalgodev.clinicaodontologica.logica;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Horario implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idWorkSchedule;
    private String entry;
    private String exit;

    public Horario() {
    }

    public Horario(String entry, String exit) {
        this.entry = entry;
        this.exit = exit;
    }

    public int getIdWorkSchedule() {
        return idWorkSchedule;
    }

    public void setIdWorkSchedule(int idWorkSchedule) {
        this.idWorkSchedule = idWorkSchedule;
    }

    public String getEntry() {
        return entry;
    }

    public void setEntry(String entry) {
        this.entry = entry;
    }

    public String getExit() {
        return exit;
    }

    public void setExit(String exit) {
        this.exit = exit;
    }
}
