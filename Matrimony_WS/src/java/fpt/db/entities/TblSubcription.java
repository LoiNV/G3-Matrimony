/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fpt.db.entities;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author phamt
 */
@Entity
@Table(name = "tbl_Subcription")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TblSubcription.findAll", query = "SELECT t FROM TblSubcription t"),
    @NamedQuery(name = "TblSubcription.findById", query = "SELECT t FROM TblSubcription t WHERE t.id = :id"),
    @NamedQuery(name = "TblSubcription.findByName", query = "SELECT t FROM TblSubcription t WHERE t.name = :name"),
    @NamedQuery(name = "TblSubcription.findByPrice", query = "SELECT t FROM TblSubcription t WHERE t.price = :price"),
    @NamedQuery(name = "TblSubcription.findByDuration", query = "SELECT t FROM TblSubcription t WHERE t.duration = :duration")})
public class TblSubcription implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "name")
    private String name;
    @Basic(optional = false)
    @NotNull
    @Column(name = "price")
    private double price;
    @Basic(optional = false)
    @NotNull
    @Column(name = "duration")
    private int duration;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "subId")
    private Collection<TblUserSubscription> tblUserSubscriptionCollection;

    public TblSubcription() {
    }

    public TblSubcription(Integer id) {
        this.id = id;
    }

    public TblSubcription(Integer id, String name, double price, int duration) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.duration = duration;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    @XmlTransient
    public Collection<TblUserSubscription> getTblUserSubscriptionCollection() {
        return tblUserSubscriptionCollection;
    }

    public void setTblUserSubscriptionCollection(Collection<TblUserSubscription> tblUserSubscriptionCollection) {
        this.tblUserSubscriptionCollection = tblUserSubscriptionCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TblSubcription)) {
            return false;
        }
        TblSubcription other = (TblSubcription) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "fpt.db.entities.TblSubcription[ id=" + id + " ]";
    }
    
}
