package com.javierhidalgodev.clinicaodontologica.persistencia;

import com.javierhidalgodev.clinicaodontologica.logica.Usuario;
import com.javierhidalgodev.clinicaodontologica.persistencia.exceptions.NonexistentEntityException;
import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.PersistenceException;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

/**
 *
 * @author Javi
 */
public class UsuarioJpaController implements Serializable {

    public UsuarioJpaController() {
    }

    public void create(Usuario usuario) {
        EntityManager em = PersistenceManager.getInstance().getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(usuario);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Usuario usuario) throws NonexistentEntityException, Exception {
        EntityManager em = PersistenceManager.getInstance().getEntityManager();
        try {
            em.getTransaction().begin();
            usuario = em.merge(usuario);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = usuario.getIdUser();
                if (findUsuario(id) == null) {
                    throw new NonexistentEntityException("The usuario with id " + id + " no longer exists.");
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
            Usuario usuario;
            try {
                usuario = em.getReference(Usuario.class, id);
                usuario.getIdUser();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The usuario with id " + id + " no longer exists.", enfe);
            }
            em.remove(usuario);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Usuario> findUsuarioEntities() {
        return findUsuarioEntities(true, -1, -1);
    }

    public List<Usuario> findUsuarioEntities(int maxResults, int firstResult) {
        return findUsuarioEntities(false, maxResults, firstResult);
    }

    private List<Usuario> findUsuarioEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = PersistenceManager.getInstance().getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Usuario.class));
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

    public Usuario findUsuario(int id) {
        System.out.println("Id del usuario en UsuarioJpaController.java: " + id);
        EntityManager em = PersistenceManager.getInstance().getEntityManager();
        try {
            return em.find(Usuario.class, id);
        } finally {
            em.close();
        }
    }

    public int getUsuarioCount() {
        EntityManager em = PersistenceManager.getInstance().getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Usuario> rt = cq.from(Usuario.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }

    public Usuario getUserByLogin(String username, String password) {
        EntityManager em = PersistenceManager.getInstance().getEntityManager();
        try {
            CriteriaBuilder cb = em.getCriteriaBuilder();
            CriteriaQuery cq = cb.createQuery(Usuario.class);
            Root<Usuario> root = cq.from(Usuario.class);

            cq.select(root).where(cb.equal(root.get("username"), username), cb.equal(root.get("password"), password));

            List<Usuario> users = em.createQuery(cq).getResultList();
            return users.isEmpty() ? null : users.get(0);
        } catch (PersistenceException e) {
            throw new Error("MAL: " + e.getMessage());
        } finally {
            em.close();
        }
    }

    public List<Usuario> findFreeUsuarioEntities() {
        EntityManager em = PersistenceManager.getInstance().getEntityManager();

        try {
            CriteriaBuilder cb = em.getCriteriaBuilder();
            CriteriaQuery cq = cb.createQuery(Usuario.class);
            Root<Usuario> root = cq.from(Usuario.class);

            cq.select(root).where(cb.and(cb.isNull(root.get("odontologist")), cb.isNull(root.get("secretary"))));

            List<Usuario> users = em.createQuery(cq).getResultList();
            return users;
        } catch (Exception e) {
            throw new Error("MAL: " + e.getMessage());
        } finally {
            em.close();
        }
    }

    boolean userExists(String username) {
        EntityManager em = PersistenceManager.getInstance().getEntityManager();
        try {
            CriteriaBuilder cb = em.getCriteriaBuilder();
            CriteriaQuery cq = cb.createQuery(Usuario.class);
            Root<Usuario> root = cq.from(Usuario.class);

            cq.select(root).where(cb.equal(root.get("username"), username));

            List<Usuario> users = em.createQuery(cq).getResultList();
            return !users.isEmpty();
        } finally {
            em.close();
        }
    }
}
