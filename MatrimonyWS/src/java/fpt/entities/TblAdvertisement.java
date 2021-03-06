/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fpt.entities;

import java.io.Serializable;
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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author phamt
 */
@Entity
@Table(name = "tbl_Advertisement")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TblAdvertisement.findAll", query = "SELECT t FROM TblAdvertisement t"),
    @NamedQuery(name = "TblAdvertisement.findById", query = "SELECT t FROM TblAdvertisement t WHERE t.id = :id"),
    @NamedQuery(name = "TblAdvertisement.findByImage", query = "SELECT t FROM TblAdvertisement t WHERE t.image = :image"),
    @NamedQuery(name = "TblAdvertisement.findByLink", query = "SELECT t FROM TblAdvertisement t WHERE t.link = :link"),
    @NamedQuery(name = "TblAdvertisement.findByDuration", query = "SELECT t FROM TblAdvertisement t WHERE t.duration = :duration"),
    @NamedQuery(name = "TblAdvertisement.findByMessage", query = "SELECT t FROM TblAdvertisement t WHERE t.message = :message"),
    @NamedQuery(name = "TblAdvertisement.findByAmount", query = "SELECT t FROM TblAdvertisement t WHERE t.amount = :amount"),
    @NamedQuery(name = "TblAdvertisement.findByCreatedDate", query = "SELECT t FROM TblAdvertisement t WHERE t.createdDate = :createdDate"),
    @NamedQuery(name = "TblAdvertisement.findByStatus", query = "SELECT t FROM TblAdvertisement t WHERE t.status = :status")})
public class TblAdvertisement implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 1073741823)
    @Column(name = "image")
    private String image;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 1073741823)
    @Column(name = "link")
    private String link;
    @Basic(optional = false)
    @NotNull
    @Column(name = "duration")
    private int duration;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 1073741823)
    @Column(name = "message")
    private String message;
    @Basic(optional = false)
    @NotNull
    @Column(name = "amount")
    private double amount;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "created_date")
    private String createdDate;
    @Column(name = "status")
    private Integer status;
    @JoinColumn(name = "customer_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private TblCustomers customerId;

    public TblAdvertisement() {
    }

    public TblAdvertisement(Integer id) {
        this.id = id;
    }

    public TblAdvertisement(Integer id, String image, String link, int duration, String message, double amount, String createdDate) {
        this.id = id;
        this.image = image;
        this.link = link;
        this.duration = duration;
        this.message = message;
        this.amount = amount;
        this.createdDate = createdDate;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public TblCustomers getCustomerId() {
        return customerId;
    }

    public void setCustomerId(TblCustomers customerId) {
        this.customerId = customerId;
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
        if (!(object instanceof TblAdvertisement)) {
            return false;
        }
        TblAdvertisement other = (TblAdvertisement) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "fpt.entities.TblAdvertisement[ id=" + id + " ]";
    }
    
}
