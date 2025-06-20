package com.javierhidalgodev.clinicaodontologica.persistencia;

import com.javierhidalgodev.clinicaodontologica.logica.Odontologo;
import com.javierhidalgodev.clinicaodontologica.logica.Paciente;
import com.javierhidalgodev.clinicaodontologica.logica.Turno;
import com.javierhidalgodev.clinicaodontologica.persistencia.exceptions.NonexistentEntityException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

/**
 *
 * @author Javi
 */
public class TurnoJpaController implements Serializable {

    public TurnoJpaController() {
    }

    public void create(Turno turno) {
        EntityManager em = PersistenceManager.getInstance().getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(turno);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Turno turno) throws NonexistentEntityException, Exception {
        EntityManager em = PersistenceManager.getInstance().getEntityManager();
        try {
            em.getTransaction().begin();
            turno = em.merge(turno);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = turno.getIdAppointment();
                if (findTurno(id) == null) {
                    throw new NonexistentEntityException("The turno with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(int id) throws NonexistentEntityException {
        EntityManager em = PersistenceManager.getInstance().getEntityManager();
        try {
            em.getTransaction().begin();
            Turno turno;
            try {
                turno = em.getReference(Turno.class, id);
                turno.getIdAppointment();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The turno with id " + id + " no longer exists.", enfe);
            }
            em.remove(turno);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Turno> findTurnoEntities() {
        return findTurnoEntities(true, -1, -1);
    }

    public List<Turno> findTurnoEntities(int maxResults, int firstResult) {
        return findTurnoEntities(false, maxResults, firstResult);
    }

    private List<Turno> findTurnoEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = PersistenceManager.getInstance().getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Turno.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Turno findTurno(int id) {
        EntityManager em = PersistenceManager.getInstance().getEntityManager();
        try {
            return em.find(Turno.class, id);
        } finally {
            em.close();
        }
    }

    public int getTurnoCount() {
        EntityManager em = PersistenceManager.getInstance().getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Turno> rt = cq.from(Turno.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }

    List<Paciente> getPatientsByOdontologist(int id) {
        EntityManager em = PersistenceManager.getInstance().getEntityManager();
        // Evitar duplicados
        Set<Paciente> patients = new HashSet<Paciente>();

        try {
            CriteriaBuilder cb = em.getCriteriaBuilder();
            CriteriaQuery cq = cb.createQuery(Turno.class);
            Root<Turno> root = cq.from(Turno.class);

            cq.select(root).where(cb.equal(root.get("odontologist").get("id"), id));

            List<Turno> appointments = em.createQuery(cq).getResultList();

            for (Turno t : appointments) {
                Paciente p = t.getPatient();

                if (p != null) {
                    patients.add(p);
                }
            }

            List<Paciente> patientList = new ArrayList<>(patients);

            return patientList;
        } finally {
            em.close();
        }
    }

    List<Turno> getAppointmentsByOdontologist(int id) {
        EntityManager em = PersistenceManager.getInstance().getEntityManager();

        try {
            CriteriaBuilder cb = em.getCriteriaBuilder();
            CriteriaQuery cq = cb.createQuery(Turno.class);
            Root<Turno> root = cq.from(Turno.class);

            cq.select(root).where(cb.equal(root.get("odontologist").get("id"), id));

            List<Turno> appointments = em.createQuery(cq).getResultList();
            
            return appointments;
        } finally {
            em.close();
        }
    }

}
