package com.javierhidalgodev.clinicaodontologica.logica;

import com.javierhidalgodev.clinicaodontologica.persistencia.PersistenceController;
import java.text.DateFormat;
import java.time.LocalDate;
import java.sql.Date;
import java.util.ArrayList;
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

    public void createOdontologist(String firstName, String surname, String address, String phone, String birthday, String dni, String specialization, String workSchedule) {
        
        LocalDate localDate = LocalDate.parse(birthday);
        Date birth = Date.valueOf(localDate);
        List<Turno> workShiftList = new ArrayList<>();
        Horario wS = null;
        
        List<Horario> workScheduleList = persistenceController.getWorkScheduleList();
        for(Horario h : workScheduleList) {
            System.out.println(h.getName());
            if(h.getName().equals(workSchedule)) {
                wS = h;
            }
        }
        
        Odontologo odontologist = new Odontologo(firstName, surname, address, phone, birth, dni, specialization, wS == null ? null : wS, workShiftList, null);
        
        persistenceController.createOdontologist(odontologist);
    }

    public List<Horario> getWorkScheduleList() {
        return persistenceController.getWorkScheduleList();
    }

    public List<Odontologo> getAllOdontologists() {
        return persistenceController.getAllOdontologists();
    }
}
