/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fpt.entities.ws;

import fpt.entities.TblSubcription;
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
@Path("fpt.entities.tblsubcription")
public class TblSubcriptionFacadeREST extends AbstractFacade<TblSubcription> {
    @PersistenceContext(unitName = "MatrimonyWSPU")
    private EntityManager em;

    public TblSubcriptionFacadeREST() {
        super(TblSubcription.class);
    }

    @POST
    @Override
    @Consumes({"application/json"})
    public void create(TblSubcription entity) {
        super.create(entity);
    }

    @PUT
    @Path("{id}")
    @Consumes({"application/json"})
    public void edit(@PathParam("id") Integer id, TblSubcription entity) {
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
    public TblSubcription find(@PathParam("id") Integer id) {
        return super.find(id);
    }

    @GET
    @Override
    @Produces({"application/json"})
    public List<TblSubcription> findAll() {
        return super.findAll();
    }

    @GET
    @Path("{from}/{to}")
    @Produces({"application/json"})
    public List<TblSubcription> findRange(@PathParam("from") Integer from, @PathParam("to") Integer to) {
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
    @Path("findByName/{name}")
    @Produces({"application/json"})
    public TblSubcription findByName(@PathParam("name") String name){
        Query q = em.createNamedQuery("TblSubcription.findByName");
        q.setParameter("name", name);
        
        return (TblSubcription) q.getResultList().get(0);
    }
 
}
