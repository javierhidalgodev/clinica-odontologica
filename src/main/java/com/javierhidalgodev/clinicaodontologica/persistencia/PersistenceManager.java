package com.javierhidalgodev.clinicaodontologica.persistencia;

import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityManager;
import javax.persistence.Persistence;

public class PersistenceManager {
    private static final String PERSISTENCE_UNIT_NAME = "clinicaJPU";
    private static PersistenceManager instance;
    private EntityManagerFactory emf;
    
    
    private PersistenceManager() {
        try {
            emf = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
        } catch (Exception e) {
            System.out.println("Error al inicializar la unidad de persistencia: " + e.getMessage());
            throw new RuntimeException("No se pudo conectar a la base de datos");
        }
    }
    
    public static PersistenceManager getInstance() {
        if(instance == null) {
            instance = new PersistenceManager();
        }
        
        return instance;
    }
    
    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
    
    public void close() {
        if(emf != null && emf.isOpen()) {
            emf.close();
        }
    }
}
