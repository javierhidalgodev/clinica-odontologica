package com.javierhidalgodev.clinicaodontologica.logica;

/**
 *
 * @author Javi
 */
public enum BloodType {

    APOSITIVE("A+"),
    ANEGATIVE("A-"),
    BPOSITIVE("B+"),
    BNEGATIVE("B-"),
    ABPOSITIVE("AB+"),
    ABNEGATIVE("AB-"),
    OPOSITIVE("O+"),
    ONEGATIVE("O-");
    
    private String bloodType;
    
    private BloodType(String bloodType) {
        this.bloodType = bloodType;
    }

    public String getBloodType() {
        return bloodType;
    }
}
