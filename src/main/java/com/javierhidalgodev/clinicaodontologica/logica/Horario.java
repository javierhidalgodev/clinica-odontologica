package com.javierhidalgodev.clinicaodontologica.logica;

public class Horario {
    private String entry;
    private String exit;

    public Horario() {
    }

    public Horario(String entry, String exit) {
        this.entry = entry;
        this.exit = exit;
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
