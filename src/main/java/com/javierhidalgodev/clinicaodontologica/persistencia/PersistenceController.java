package com.javierhidalgodev.clinicaodontologica.persistencia;

import com.javierhidalgodev.clinicaodontologica.dto.user.UserDTO;
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
        if (instance == null) {
            instance = new PersistenceController();
        }

        return instance;
    }

    // User
    
    public void createUser(Usuario newUser) {
        userController.create(newUser);
    }

    public void destroyUser(int idUser) {
        try {
            userController.destroy(idUser);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(PersistenceController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editUser(Usuario userToEdit) {
        try {
            userController.edit(userToEdit);
        } catch (Exception ex) {
            Logger.getLogger(PersistenceController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Usuario> getAllUsers() {
        return userController.findUsuarioEntities();
    }

    public Usuario getUserById(int userId) {
        return userController.findUsuario(userId);
    }

    public Usuario getUserByLogin(String username, String password) {
        return userController.getUserByLogin(username, password);
    }

    // Odontologist
    
    public void createOdontologist(Odontologo odontologist) {
        odontologistController.create(odontologist);
    }

    public void destroyOdontologist(int odontoID) {
        try {
            odontologistController.destroy(odontoID);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(PersistenceController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editOdontologist(Odontologo odontologistToEdit) {
        try {
            odontologistController.edit(odontologistToEdit);
        } catch (Exception ex) {
            Logger.getLogger(PersistenceController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Odontologo> getAllOdontologists() {
        return odontologistController.findOdontologoEntities();
    }

    public Odontologo getOdontologistById(int odontologistId) {
        return odontologistController.findOdontologo(odontologistId);
    }

    // Patient
    
    public void createPatient(Paciente patient) {
        patientController.create(patient);
    }

    public void destroyPatient(int patientID) {
        try {
            patientController.destroy(patientID);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(PersistenceController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editPatient(Paciente patientToEdit) {
        try {
            patientController.edit(patientToEdit);
        } catch (Exception ex) {
            Logger.getLogger(PersistenceController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Paciente> getAllPatients() {
        return patientController.findPacienteEntities();
    }

    public Paciente getPatientById(int patientID) {
        return patientController.findPaciente(patientID);
    }

    // Guardian
    
    public Responsable createGuardian(Responsable guardian) {
        return guardianController.create(guardian);
    }

    public void editGuardian(Responsable guardian) {
        try {
            guardianController.edit(guardian);
        } catch (Exception ex) {
            Logger.getLogger(PersistenceController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Secretary
    
    public void createSecretary(String firstName, String surname, String address, String phone, Date birth, String dni, String floor) {
        Secretario secretary = new Secretario(floor, firstName, surname, phone, address, birth, dni);

        secretaryController.create(secretary);
    }

    public void destroySecretary(int idSecretary) {
        try {
            secretaryController.destroy(idSecretary);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(PersistenceController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editSecretary(Secretario secretaryToEdit) {
        try {
            secretaryController.edit(secretaryToEdit);
        } catch (Exception ex) {
            Logger.getLogger(PersistenceController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Secretario> getAllSecretaries() {
        return secretaryController.findSecretarioEntities();
    }

    public Secretario getSecretaryById(int secretaryId) {
        return secretaryController.findSecretario(secretaryId);
    }

    // WorkSchedule
    
    public void createWorkSchedule(Horario workSchedule) {
        workScheduleController.create(workSchedule);
    }

    public List<Horario> getWorkScheduleList() {
        return workScheduleController.findHorarioEntities();
    }

    public Horario getWorkScheduleById(int workScheduleId) {
        return workScheduleController.findHorario(workScheduleId);
    }

    public void destroyGuardian(Paciente patient, int guardianIdToDelete) {
        patient.setGuardian(null);
        
        try {
            patientController.edit(patient);
            
//            try {
//                guardianController.destroy(guardianIdToDelete);
//            } catch (NonexistentEntityException ex) {
//                Logger.getLogger(PersistenceController.class.getName()).log(Level.SEVERE, null, ex);
//            }
        } catch (Exception ex) {
            Logger.getLogger(PersistenceController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<UserDTO> getAllFreeUsers() {
        return userController.findFreeUsuarioEntities();
    }
}
