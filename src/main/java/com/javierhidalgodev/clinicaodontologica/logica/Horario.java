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
    private String entryTime;
    private String exitTime;

    public Horario() {
    }

    public Horario(String entry, String exit) {
        this.entryTime = entry;
        this.exitTime = exit;
    }

    public int getIdWorkSchedule() {
        return idWorkSchedule;
    }

    public void setIdWorkSchedule(int idWorkSchedule) {
        this.idWorkSchedule = idWorkSchedule;
    }

    public String getEntry() {
        return entryTime;
    }

    public void setEntry(String entry) {
        this.entryTime = entry;
    }

    public String getExit() {
        return exitTime;
    }

    public void setExit(String exit) {
        this.exitTime = exit;
    }
}
