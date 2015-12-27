/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fpt.entities.ws;

import com.google.gson.Gson;
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
    @PersistenceContext(unitName = "MatrimonyWSPU")
    private EntityManager em;

    public TblUsersFacadeREST() {
        super(TblUsers.class);
    }

    @POST    
    @Override
    @Consumes({"application/json"})
    public void create(TblUsers entity) {
        super.create(entity);
    }

    @PUT
    @Path("{id}")
    @Consumes({"application/json"})
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
    @Produces({"application/json"})
    public TblUsers find(@PathParam("id") Integer id) {
        return super.find(id);
    }

    @GET
    @Override
    @Produces({"application/json"})
    public List<TblUsers> findAll() {
        return super.findAll();
    }

    @GET
    @Path("{from}/{to}")
    @Produces({"application/json"})
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
    @Path("findByEmail/{email}")
    @Produces({"application/json"})
    public TblUsers findByEmailUsers(@PathParam("email") String email) {        
        Query query = em.createNamedQuery("TblUsers.findByEmail");
        query.setParameter("email", email);
        List<TblUsers> ls = (List<TblUsers>) query.getResultList();
        return ls.get(0);
    }

    @GET
    @Path("searchForAll/{name}/{gender}/{age1}/{age2}/{city}/{country}")
    @Produces({"application/json"})
    public List<TblUsers> searchForAll(@PathParam("name") String name, @PathParam("gender") Boolean gender,
            @PathParam("age1") Integer age1, @PathParam("age2") Integer age2, @PathParam("city") String city, @PathParam("country") String country) {
        
        Query query = em.createNamedQuery("TblUsers.searchForAll");
        query.setParameter("name", name);
        query.setParameter("gender", gender);
        query.setParameter("age1", age1);
        query.setParameter("age2", age2);
        query.setParameter("city", city);
        query.setParameter("country", country);
        
        return (List<TblUsers>) query.getResultList();
    }

    @POST
    @Path("findEmailAndPass/{email}/{password}")
    @Produces({"application/json"})
    public TblUsers findByEmailAndPassUsers(@PathParam("email") String email, @PathParam("password") String password) {
         
        Query query = em.createNamedQuery("TblUsers.findByEmailAndPass");
        query.setParameter("email", email);
        query.setParameter("password", password);
        List<TblUsers> ls = (List<TblUsers>) query.getResultList();
        return ls.get(0);
    }
   
    @POST
    @Path("createUser")
    @Produces({"application/json"})
    public void createUser(String json){
        Gson g = new Gson();
        TblUsers user = g.fromJson(json, TblUsers.class);
        super.create(user);
    }
}
