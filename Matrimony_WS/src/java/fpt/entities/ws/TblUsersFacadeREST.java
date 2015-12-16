/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fpt.entities.ws;

import fpt.entities.TblUsers;
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
@Path("fpt.entities.tblusers")
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
    @Path("searchForAll/{name}/{gender}/{age1}/{age2}/{city}/{country}")
    @Produces({"application/xml", "application/json"})
    public List<TblUsers> searchForAll(@PathParam("name") String name, @PathParam("gender") Boolean gender,
            @PathParam("age1") Integer age1, @PathParam("age2") Integer age2, @PathParam("city") String city, @PathParam("country") String country) {
        List<TblUsers> ls = new LinkedList<>();
        Query query = em.createNamedQuery("TblUsers.searchForAll");
        query.setParameter("name", name);
        query.setParameter("gender", gender);
        query.setParameter("age1", age1);
        query.setParameter("age2", age2);
        query.setParameter("city", city);
        query.setParameter("country", country);
        ls = (List<TblUsers>) query.getResultList();
        return ls;
    }

    @GET
    @Path("findEmailAndPass/{email}/{password}")
    @Produces({"application/xml", "application/json"})
    public List<TblUsers> findByEmailAndPassUsers(@PathParam("email") String email, @PathParam("password") String password) {
        List<TblUsers> ls = new LinkedList<>();
        Query query = em.createNamedQuery("TblUsers.findByEmailAndPass");
        query.setParameter("email", email);
        query.setParameter("password", password);
        ls = (List<TblUsers>) query.getResultList();
        return ls;
    }

}
