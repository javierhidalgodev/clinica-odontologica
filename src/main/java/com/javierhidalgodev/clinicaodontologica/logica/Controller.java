package com.javierhidalgodev.clinicaodontologica.logica;

import com.javierhidalgodev.clinicaodontologica.dto.user.UserDTO;
import com.javierhidalgodev.clinicaodontologica.persistencia.PersistenceController;
import java.sql.Array;
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

    public List<UserDTO> getAllUsers() {
        List<Usuario> users = persistenceController.getAllUsers();
        
        List<UserDTO> usersDTO = new ArrayList<>();
        for(Usuario u : users) {
            usersDTO.add(new UserDTO(u.getIdUser(), u.getUsername(), u.getRole()));
        }
        
        return usersDTO;
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

    public Odontologo getOdontologistById(int odontologistId) {
        return persistenceController.getOdontologistById(odontologistId);
    }

    public void editOdontologist(Odontologo odontologistToEdit, String firstName, String surname, String address, String phone, String birthdate, String specialization, String workSchedule) {
        
        int workScheduleId = Integer.parseInt(workSchedule);
        
        Horario wS = persistenceController.getWorkScheduleById(workScheduleId);
        
        odontologistToEdit.setName(firstName);
        odontologistToEdit.setSurname(surname);
        odontologistToEdit.setAddress(address);
        odontologistToEdit.setPhone(phone);
        odontologistToEdit.setBirthdate(Date.valueOf(birthdate));
        odontologistToEdit.setSpecialization(specialization);
        odontologistToEdit.setWorkSchedule(wS);
                
        persistenceController.editOdontologist(odontologistToEdit);
    }
    
    public List<Secretario> getAllSecretaries() {
        return persistenceController.getAllSecretaries();
    }

    public void destroyOdontologist(int odontoID) {
        persistenceController.destroyOdontologist(odontoID);
    }

    public Secretario getSecretaryById(int secretaryId) {
        return persistenceController.getSecretaryById(secretaryId);
    }

    public void editSecretary(Secretario secretaryToEdit, String firstName, String surname, String address, String phone, String birthday, String floor) {
        LocalDate localDate = LocalDate.parse(birthday);
        Date birth = Date.valueOf(localDate);
        
        secretaryToEdit.setName(firstName);
        secretaryToEdit.setSurname(surname);
        secretaryToEdit.setAddress(address);
        secretaryToEdit.setPhone(phone);
        secretaryToEdit.setBirthdate(birth);
        secretaryToEdit.setFloor(floor);
        secretaryToEdit.setUser(null);
        
        persistenceController.editSecretary(secretaryToEdit);
    }

    public void destroySecretary(int idSecretary) {
        persistenceController.destroySecretary(idSecretary);
    }

    public void editPatient(Paciente patientToEdit, String patientFirstName, String patientSurname, String patientAddress, String patientPhone, String patientBirthdate, String prepaidHealth, String bloodType) {
        LocalDate localDate = LocalDate.parse(patientBirthdate);
        Date birth = Date.valueOf(localDate);
        Boolean pPH = Boolean.parseBoolean(prepaidHealth);
        
        patientToEdit.setName(patientFirstName);
        patientToEdit.setSurname(patientSurname);
        patientToEdit.setAddress(patientAddress);
        patientToEdit.setPhone(patientPhone);
        patientToEdit.setBirthdate(birth);
        patientToEdit.setPrepaidHealth(pPH);
        patientToEdit.setBloodType(bloodType);
        
        persistenceController.editPatient(patientToEdit);
    }
}
