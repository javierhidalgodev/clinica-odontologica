package com.javierhidalgodev.clinicaodontologica.persistencia;

import com.javierhidalgodev.clinicaodontologica.logica.Odontologo;
import com.javierhidalgodev.clinicaodontologica.persistencia.exceptions.NonexistentEntityException;
import java.io.Serializable;
import java.util.List;
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
public class OdontologoJpaController implements Serializable {

    public OdontologoJpaController() {
    }

    public void create(Odontologo odontologo) {
        EntityManager em = PersistenceManager.getInstance().getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(odontologo);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Odontologo odontologo) throws NonexistentEntityException, Exception {
        EntityManager em = PersistenceManager.getInstance().getEntityManager();
        try {
            em.getTransaction().begin();
            odontologo = em.merge(odontologo);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = odontologo.getId();
                if (findOdontologo(id) == null) {
                    throw new NonexistentEntityException("The odontologo with id " + id + " no longer exists.");
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
            Odontologo odontologo;
            try {
                odontologo = em.getReference(Odontologo.class, id);
                odontologo.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The odontologo with id " + id + " no longer exists.", enfe);
            }
            em.remove(odontologo);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Odontologo> findOdontologoEntities() {
        return findOdontologoEntities(true, -1, -1);
    }

    public List<Odontologo> findOdontologoEntities(int maxResults, int firstResult) {
        return findOdontologoEntities(false, maxResults, firstResult);
    }

    private List<Odontologo> findOdontologoEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = PersistenceManager.getInstance().getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Odontologo.class));
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

    public Odontologo findOdontologo(int id) {
        EntityManager em = PersistenceManager.getInstance().getEntityManager();
        try {
            return em.find(Odontologo.class, id);
        } finally {
            em.close();
        }
    }

    public int getOdontologoCount() {
        EntityManager em = PersistenceManager.getInstance().getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Odontologo> rt = cq.from(Odontologo.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }

    List<Odontologo> getOdontologistsByWS(int ws) {
        EntityManager em = PersistenceManager.getInstance().getEntityManager();
        try {
            CriteriaBuilder cb = em.getCriteriaBuilder();
            CriteriaQuery cq = cb.createQuery(Odontologo.class);
            Root<Odontologo> root = cq.from(Odontologo.class);
            
            cq.select(root).where(cb.equal(root.get("workSchedule").get("idWorkSchedule"), ws));
            
            List<Odontologo> odontos = em.createQuery(cq).getResultList();
            return odontos;
        } finally {
            em.close();
        }
    }
}
