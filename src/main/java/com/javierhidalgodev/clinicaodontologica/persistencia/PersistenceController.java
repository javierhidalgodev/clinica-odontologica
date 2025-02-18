package com.javierhidalgodev.clinicaodontologica.persistencia;

import com.javierhidalgodev.clinicaodontologica.logica.Usuario;

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
    
}
