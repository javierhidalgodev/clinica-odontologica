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
    private String name;
    private String entryTime;
    private String exitTime;

    public Horario() {
    }

    public Horario(String name, String entry, String exit) {
        this.name = name;
        this.entryTime = entry;
        this.exitTime = exit;
    }

    public int getIdWorkSchedule() {
        return idWorkSchedule;
    }

    public void setIdWorkSchedule(int idWorkSchedule) {
        this.idWorkSchedule = idWorkSchedule;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    public String getEntryTime() {
        return entryTime;
    }

    public void setEntryTime(String entry) {
        this.entryTime = entry;
    }

    public String getExitTime() {
        return exitTime;
    }

    public void setExitTime(String exit) {
        this.exitTime = exit;
    }
}
