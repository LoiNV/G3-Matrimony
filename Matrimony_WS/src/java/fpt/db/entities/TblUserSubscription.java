/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fpt.db.entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author phamt
 */
@Entity
@Table(name = "tbl_UserSubscription")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TblUserSubscription.findAll", query = "SELECT t FROM TblUserSubscription t"),
    @NamedQuery(name = "TblUserSubscription.findById", query = "SELECT t FROM TblUserSubscription t WHERE t.id = :id"),
    @NamedQuery(name = "TblUserSubscription.findByChargedDate", query = "SELECT t FROM TblUserSubscription t WHERE t.chargedDate = :chargedDate")})
public class TblUserSubscription implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "chargedDate")
    @Temporal(TemporalType.DATE)
    private Date chargedDate;
    @JoinColumn(name = "sub_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private TblSubcription subId;
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private TblUsers userId;

    public TblUserSubscription() {
    }

    public TblUserSubscription(Integer id) {
        this.id = id;
    }

    public TblUserSubscription(Integer id, Date chargedDate) {
        this.id = id;
        this.chargedDate = chargedDate;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getChargedDate() {
        return chargedDate;
    }

    public void setChargedDate(Date chargedDate) {
        this.chargedDate = chargedDate;
    }

    public TblSubcription getSubId() {
        return subId;
    }

    public void setSubId(TblSubcription subId) {
        this.subId = subId;
    }

    public TblUsers getUserId() {
        return userId;
    }

    public void setUserId(TblUsers userId) {
        this.userId = userId;
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
        if (!(object instanceof TblUserSubscription)) {
            return false;
        }
        TblUserSubscription other = (TblUserSubscription) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "fpt.db.entities.TblUserSubscription[ id=" + id + " ]";
    }
    
}
