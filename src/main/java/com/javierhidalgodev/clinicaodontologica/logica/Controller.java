package com.javierhidalgodev.clinicaodontologica.logica;

import com.javierhidalgodev.clinicaodontologica.persistencia.PersistenceController;

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
    
}
