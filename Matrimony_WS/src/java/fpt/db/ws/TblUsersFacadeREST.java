/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fpt.db.ws;

import fpt.db.entities.TblUsers;
import java.util.LinkedList;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

/**
 *
 * @author phamt
 */
@Stateless
@Path("fpt.db.entities.tblusers")
public class TblUsersFacadeREST extends AbstractFacade<TblUsers> {
    @PersistenceContext(unitName = "Matrimony_WSPU")
    private EntityManager em;

    public TblUsersFacadeREST() {
        super(TblUsers.class);
    }

    @POST
    @Override
    @Consumes({"application/xml", "application/json"})
    public void create(TblUsers entity) {
        super.create(entity);
    }

    @PUT
    @Path("{id}")
    @Consumes({"application/xml", "application/json"})
    public void edit(@PathParam("id") Integer id, TblUsers entity) {
        super.edit(entity);
    }

    @DELETE
    @Path("{id}")
    public void remove(@PathParam("id") Integer id) {
        super.remove(super.find(id));
    }

    @GET
    @Path("{id}")
    @Produces({"application/xml", "application/json"})
    public TblUsers find(@PathParam("id") Integer id) {
        return super.find(id);
    }

    @GET
    @Override
    @Produces({"application/xml", "application/json"})
    public List<TblUsers> findAll() {
        return super.findAll();
    }

    @GET
    @Path("{from}/{to}")
    @Produces({"application/xml", "application/json"})
    public List<TblUsers> findRange(@PathParam("from") Integer from, @PathParam("to") Integer to) {
        return super.findRange(new int[]{from, to});
    }

    @GET
    @Path("count")
    @Produces("text/plain")
    public String countREST() {
        return String.valueOf(super.count());
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }
    
    @GET
    @Path("findName/{name}")
    @Produces({"application/xml", "application/json"})
    public List<TblUsers> findByNameUsers(@PathParam("name") String name) {
        List<TblUsers> ls = new LinkedList<>();
        Query query = em.createNamedQuery("TblUsers.findByName");
        query.setParameter("name", name);
        ls = (List<TblUsers>) query.getResultList();
        return ls;
    }
    
    @GET
    @Path("findAge/{age}")
    @Produces({"application/xml", "application/json"})
    public List<TblUsers> findByAgeUsers(@PathParam("age") Integer age) {
        List<TblUsers> ls = new LinkedList<>();
        Query query = em.createNamedQuery("TblUsers.findByAge");
        query.setParameter("age", age);
        ls = (List<TblUsers>) query.getResultList();
        return ls;
    }
    
    @GET
    @Path("findGender/{gender}")
    @Produces({"application/xml", "application/json"})
    public List<TblUsers> findByGenderUsers(@PathParam("gender") Boolean gender) {
        List<TblUsers> ls = new LinkedList<>();
        Query query = em.createNamedQuery("TblUsers.findByGender");
        query.setParameter("gender", gender);
        ls = (List<TblUsers>) query.getResultList();
        return ls;
    }
}
