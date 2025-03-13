package com.javierhidalgodev.clinicaodontologica.logica;

import com.javierhidalgodev.clinicaodontologica.dto.user.UserDTO;
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

    // User
    public void createUser(String username, String password, String role) {

        Usuario newUser = new Usuario(username, password, role);

        persistenceController.createUser(newUser);
    }

    public void destroyUser(int idUser) {
        persistenceController.destroyUser(idUser);
    }

    public void editUser(Usuario userToEdit) {
        persistenceController.editUser(userToEdit);
    }

    public List<UserDTO> getAllUsers() {
        List<Usuario> users = persistenceController.getAllUsers();

        List<UserDTO> usersDTO = new ArrayList<>();
        for (Usuario u : users) {
            usersDTO.add(new UserDTO(u.getIdUser(), u.getUsername(), u.getRole()));
        }

        return usersDTO;
    }

    public Usuario getUserById(int userId) {
        return persistenceController.getUserById(userId);
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

    // Odontologist
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

        Odontologo odontologist = new Odontologo(firstName, surname, address, phone, birth, dni, specialization, wS == null ? null : wS, workShiftList);

        persistenceController.createOdontologist(odontologist);
    }

    public void destroyOdontologist(int odontoID) {
        persistenceController.destroyOdontologist(odontoID);
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

    public List<Odontologo> getAllOdontologists() {
        return persistenceController.getAllOdontologists();
    }

    public Odontologo getOdontologistById(int odontologistId) {
        return persistenceController.getOdontologistById(odontologistId);
    }

    // Patient
    public void createPatient(String patientFirstName, String patientSurname, String patientAddress, String patientPhone, LocalDate patientBirthdate, String patientDNI, String prepaidHealth, String bloodType, Responsable guardian) {

        boolean pPH = Boolean.parseBoolean(prepaidHealth);
        List<Turno> appointments = new ArrayList<>();
        Date birth = Date.valueOf(patientBirthdate);

        Paciente patient = new Paciente(pPH, bloodType, guardian, appointments, patientFirstName, patientSurname, patientPhone, patientAddress, birth, patientDNI);

        persistenceController.createPatient(patient);
    }

    public void destroyPatient(int patientID) {
        System.out.println(patientID);
        persistenceController.destroyPatient(patientID);
    }

    public void editPatient(Paciente patientToEdit, String patientFirstName, String patientSurname, String patientAddress, String patientPhone, LocalDate patientBirthdate, String prepaidHealth, String bloodType, Responsable guardian) {
        Date birth = Date.valueOf(patientBirthdate);
        Boolean pPH = Boolean.parseBoolean(prepaidHealth);

        patientToEdit.setName(patientFirstName);
        patientToEdit.setSurname(patientSurname);
        patientToEdit.setAddress(patientAddress);
        patientToEdit.setPhone(patientPhone);
        patientToEdit.setBirthdate(birth);
        patientToEdit.setPrepaidHealth(pPH);
        patientToEdit.setBloodType(bloodType);

        if (guardian != null) {
            patientToEdit.setGuardian(guardian);
        }

        persistenceController.editPatient(patientToEdit);
    }

    public List<Paciente> getAllPatients() {
        return persistenceController.getAllPatients();
    }

    public Paciente getPatientById(int patientID) {
        return persistenceController.getPatientById(patientID);
    }

    // Guardian
    public Responsable createGuardian(String guardianFirstName, String guardianSurname, String guardianAddress, String guardianPhone, String guardianBirthdate, String guardianDNI, String relationship) {

        LocalDate localDate = LocalDate.parse(guardianBirthdate);
        Date birth = Date.valueOf(localDate);

        Responsable guardian = new Responsable(relationship, guardianFirstName, guardianSurname, guardianPhone, guardianAddress, birth, guardianDNI);

        return persistenceController.createGuardian(guardian);

    }

    public void editGuardian(Responsable guardian, String firstName, String surname, String address, String phone, String birthdate, String relationship) {

        LocalDate localDate = LocalDate.parse(birthdate);
        Date birth = Date.valueOf(localDate);

        guardian.setName(firstName);
        guardian.setSurname(surname);
        guardian.setAddress(address);
        guardian.setPhone(phone);
        guardian.setBirthdate(birth);
        guardian.setRelationship(relationship);

        persistenceController.editGuardian(guardian);
    }

    public void destroyGuardian(Paciente patient, int guardianIdToDelete) {        
        persistenceController.destroyGuardian(patient, guardianIdToDelete);
    }

    // Secretary
    public void createSecretary(String firstName, String surname, String address, String phone, String birthday, String dni, String floor) {

        LocalDate localDate = LocalDate.parse(birthday);
        Date birth = Date.valueOf(localDate);

        persistenceController.createSecretary(firstName, surname, address, phone, birth, dni, floor);
    }

    public void destroySecretary(int idSecretary) {
        persistenceController.destroySecretary(idSecretary);
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

        persistenceController.editSecretary(secretaryToEdit);
    }

    public List<Secretario> getAllSecretaries() {
        return persistenceController.getAllSecretaries();
    }

    public Secretario getSecretaryById(int secretaryId) {
        return persistenceController.getSecretaryById(secretaryId);
    }

    // Work Schedule
    public void createWorkSchedule(String wsName, String entryTime, String exitTime) {
        Horario workSchedule = new Horario(wsName, entryTime, exitTime);

        persistenceController.createWorkSchedule(workSchedule);
    }

    public List<Horario> getWorkScheduleList() {
        return persistenceController.getWorkScheduleList();
    }

    public List<UserDTO> getAllFreeUsers() {
        return persistenceController.getAllFreeUsers();
    }
}
