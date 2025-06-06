package com.javierhidalgodev.clinicaodontologica.logica;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.SequenceGenerator;

@Entity
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public abstract class Professional {
    
    
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "professional_seq")
    @SequenceGenerator(name = "professional_seq", sequenceName = "professional_seq", allocationSize = 1)
    private int id;
    
}
