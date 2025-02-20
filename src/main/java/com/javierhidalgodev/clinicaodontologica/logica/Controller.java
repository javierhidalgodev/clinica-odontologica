package com.javierhidalgodev.clinicaodontologica.logica;

import com.javierhidalgodev.clinicaodontologica.persistencia.PersistenceController;
import java.util.List;

/**
 *
 * @author Javi
 */
public class Controller {
    
    PersistenceController persistenceController = new PersistenceController();
    
    public void createUser(String username, String password, String role) {
        
        Usuario newUser = new Usuario(username, password, role);

        persistenceController.createUser(newUser);
    }

    public List<Usuario> getAllUsers() {
        return persistenceController.getAllUsers();
    }

    public void destroyUser(int idUser) {
        persistenceController.destroyUser(idUser);
    }

    public Usuario getUserById(int userId) {
        return persistenceController.getUserById(userId);
    }

    public void editUser(Usuario userToEdit) {
        persistenceController.editUser(userToEdit);
    }

    public boolean verifyUser(String username, String password) {
        
        Usuario user = persistenceController.getUserByLogin(username, password);
        
        return user != null;
        
    }
    
}
