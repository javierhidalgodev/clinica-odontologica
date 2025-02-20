package com.javierhidalgodev.clinicaodontologica.persistencia;

import com.javierhidalgodev.clinicaodontologica.logica.Usuario;
import com.javierhidalgodev.clinicaodontologica.persistencia.exceptions.NonexistentEntityException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Javi
 */
public class PersistenceController {
 
    PersonaJpaController peopleController = new PersonaJpaController();
    OdontologoJpaController odontologistController = new OdontologoJpaController();
    PacienteJpaController patientController = new PacienteJpaController();
    ResponsableJpaController guardianController = new ResponsableJpaController();
    SecretarioJpaController secretaryController = new SecretarioJpaController();
    HorarioJpaController workScheduleController = new HorarioJpaController();
    TurnoJpaController workShiftController = new TurnoJpaController();
    UsuarioJpaController userController = new UsuarioJpaController();

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
    
}
