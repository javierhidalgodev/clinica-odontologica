package com.javierhidalgodev.clinicaodontologica.logica;

import com.javierhidalgodev.clinicaodontologica.persistencia.PersistenceController;
import java.time.LocalDate;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Javi
 */
public class Controller {
    
    public static Controller instance;
    PersistenceController persistenceController = PersistenceController.getInstance();
    
    public static Controller getInstance() {
        if (instance == null) {
            instance = new Controller();
        }

        return instance;
    }

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

    public boolean verifyUser(String username, String password) throws Exception {

        try {
            Usuario user = persistenceController.getUserByLogin(username, password);
            return user != null;

        } catch (RuntimeException e) {
            System.out.println("Error de conexión: " + e.getMessage());
            throw new Exception("SIN CONEXIÓN");
        }
    }

    public void createOdontologist(String firstName, String surname, String address, String phone, String birthday, String dni, String specialization, String workSchedule) {

        LocalDate localDate = LocalDate.parse(birthday);
        Date birth = Date.valueOf(localDate);
        List<Turno> workShiftList = new ArrayList<>();
        Horario wS = null;

        List<Horario> workScheduleList = persistenceController.getWorkScheduleList();
        for (Horario h : workScheduleList) {
            System.out.println(h.getName());
            if (h.getName().equals(workSchedule)) {
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

    public Responsable createGuardian(String guardianFirstName, String guardianSurname, String guardianAddress, String guardianPhone, String guardianBirthdate, String guardianDNI, String relationship) {

        LocalDate localDate = LocalDate.parse(guardianBirthdate);
        Date birth = Date.valueOf(localDate);

        Responsable guardian = new Responsable(relationship, guardianFirstName, guardianSurname, guardianPhone, guardianAddress, birth, guardianDNI);

        return persistenceController.createGuardian(guardian);

    }

    public void createPatient(String patientFirstName, String patientSurname, String patientAddress, String patientPhone, LocalDate patientBirthdate, String patientDNI, String prepaidHealth, String bloodType, Responsable guardian) {

        boolean pPH = Boolean.parseBoolean(prepaidHealth);
        List<Turno> appointments = new ArrayList<>();
        Date birth = Date.valueOf(patientBirthdate);

        Paciente patient = new Paciente(pPH, bloodType, guardian, appointments, patientFirstName, patientSurname, patientPhone, patientAddress, birth, patientDNI);

        persistenceController.createPatient(patient);
    }

    public List<Paciente> getAllPatients() {
        return persistenceController.getAllPatients();
    }

    public void createWorkSchedule(String wsName, String entryTime, String exitTime) {
        Horario workSchedule = new Horario(wsName, entryTime, exitTime);

        persistenceController.createWorkSchedule(workSchedule);
    }

    public Paciente getPatientById(int patientID) {
        return persistenceController.getPatientById(patientID);
    }

    public void createSecretary(String firstName, String surname, String address, String phone, String birthday, String dni, String floor) {
        
        LocalDate localDate = LocalDate.parse(birthday);
        Date birth = Date.valueOf(localDate);
        
        persistenceController.createSecretary(firstName, surname, address, phone, birth, dni, floor, null);
    }
}
