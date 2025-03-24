package com.javierhidalgodev.clinicaodontologica.logica;

import com.javierhidalgodev.clinicaodontologica.dto.user.UserDTO;
import java.io.Serializable;
import java.sql.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

/**
 *
 * @author Javi
 */

@Entity
public class Odontologo extends Persona implements Serializable {
    private String specialization;
    @OneToOne
    @JoinColumn(name = "id_work_schedule")
    private Horario workSchedule;
    @OneToMany(mappedBy = "odontologist")
    private List<Turno> workShift;
    @OneToOne(cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(nullable = true)
    private Usuario user;

    public Odontologo() {
    }

    public Odontologo(String name, String surname, String address, String phone, Date birthdate, String dni, String specialization, Horario workSchedule, List<Turno> workShift, Usuario user) {
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

    public UserDTO getUser() {
        if(user != null) {
            return new UserDTO(user.getIdUser(), user.getUsername(), user.getRole(), null);            
        }
        
        return null;
    }

    public void setUser(Usuario user) {
        this.user = user;
        
        if(user != null) {
            user.setOdontologist(this);
        }
    }
}
