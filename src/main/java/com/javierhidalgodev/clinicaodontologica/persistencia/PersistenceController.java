package com.javierhidalgodev.clinicaodontologica.persistencia;

import com.javierhidalgodev.clinicaodontologica.logica.Horario;
import com.javierhidalgodev.clinicaodontologica.logica.Odontologo;
import com.javierhidalgodev.clinicaodontologica.logica.Paciente;
import com.javierhidalgodev.clinicaodontologica.logica.Responsable;
import com.javierhidalgodev.clinicaodontologica.logica.Secretario;
import com.javierhidalgodev.clinicaodontologica.logica.Usuario;
import com.javierhidalgodev.clinicaodontologica.persistencia.exceptions.NonexistentEntityException;
import java.sql.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Javi
 */
public class PersistenceController {
    private static PersistenceController instance;
    
//    private final PersonaJpaController peopleController;
    private final OdontologoJpaController odontologistController;
    private final PacienteJpaController patientController;
    private final ResponsableJpaController guardianController;
    private final SecretarioJpaController secretaryController;
    private final HorarioJpaController workScheduleController;
//    TurnoJpaController workShiftController;
    private final UsuarioJpaController userController;

    private PersistenceController() {
        this.odontologistController = new OdontologoJpaController();
        this.secretaryController = new SecretarioJpaController();
        this.patientController = new PacienteJpaController();
        this.guardianController = new ResponsableJpaController();
        this.workScheduleController = new HorarioJpaController();
        this.userController = new UsuarioJpaController();
    }
    
    public static PersistenceController getInstance() {
        if(instance == null) {
            instance = new PersistenceController();
        }
        
        return instance;
    }
    
    public void createUser(Usuario newUser) {
        userController.create(newUser);
    }

    public List<Usuario> getAllUsers() {
        return userController.findUsuarioEntities();
    }

    public void destroyUser(int idUser) {
        try {
            userController.destroy(idUser);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(PersistenceController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Usuario getUserById(int userId) {
        return userController.findUsuario(userId);
    }

    public void editUser(Usuario userToEdit) {
        try {
            userController.edit(userToEdit);
        } catch (Exception ex) {
            Logger.getLogger(PersistenceController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Usuario getUserByLogin(String username, String password) {
        return userController.getUserByLogin(username, password);
    }

    public void createOdontologist(Odontologo odontologist) {
        odontologistController.create(odontologist);
    }

    public List<Horario> getWorkScheduleList() {
        return workScheduleController.findHorarioEntities();
    }

    public List<Odontologo> getAllOdontologists() {
        return odontologistController.findOdontologoEntities();
    }

    public Responsable createGuardian(Responsable guardian) {
        return guardianController.create(guardian);
    }

    public void createPatient(Paciente patient) {
        patientController.create(patient);
    }

    public List<Paciente> getAllPatients() {
        return patientController.findPacienteEntities();
    }

    public void createWorkSchedule(Horario workSchedule) {
        workScheduleController.create(workSchedule);
    }

    public Paciente getPatientById(int patientID) {
        return patientController.findPaciente(patientID);
    }

    public void createSecretary(String firstName, String surname, String address, String phone, Date birth, String dni, String floor, Usuario user) {
        Secretario secretary = new Secretario(floor, user, firstName, surname, phone, address, birth, dni);
        
        secretaryController.create(secretary);
    }

    public Odontologo getOdontologistById(int odontologistId) {
        return odontologistController.findOdontologo(odontologistId);
    }

    public Horario getWorkScheduleById(int workScheduleId) {
        return workScheduleController.findHorario(workScheduleId);
    }

    public void editOdontologist(Odontologo odontologistToEdit) {
        try {
            odontologistController.edit(odontologistToEdit);
        } catch (Exception ex) {
            Logger.getLogger(PersistenceController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
