/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fpt.entities;

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
@Table(name = "tbl_Customers")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TblCustomers.findAll", query = "SELECT t FROM TblCustomers t"),
    @NamedQuery(name = "TblCustomers.findById", query = "SELECT t FROM TblCustomers t WHERE t.id = :id"),
    @NamedQuery(name = "TblCustomers.findByName", query = "SELECT t FROM TblCustomers t WHERE t.name = :name"),
    @NamedQuery(name = "TblCustomers.findByEmail", query = "SELECT t FROM TblCustomers t WHERE t.email = :email"),
    @NamedQuery(name = "TblCustomers.findByPhone", query = "SELECT t FROM TblCustomers t WHERE t.phone = :phone"),
    @NamedQuery(name = "TblCustomers.findByPosition", query = "SELECT t FROM TblCustomers t WHERE t.position = :position"),
    @NamedQuery(name = "TblCustomers.findByStatus", query = "SELECT t FROM TblCustomers t WHERE t.status = :status")})
public class TblCustomers implements Serializable {
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
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "email")
    private String email;
    // @Pattern(regexp="^\\(?(\\d{3})\\)?[- ]?(\\d{3})[- ]?(\\d{4})$", message="Invalid phone/fax format, should be as xxx-xxx-xxxx")//if the field contains phone or fax number consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "phone")
    private String phone;
    @Basic(optional = false)
    @NotNull
    @Column(name = "position")
    private int position;
    @Column(name = "status")
    private Integer status;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "customerId")
    private Collection<TblAdvertisement> tblAdvertisementCollection;

    public TblCustomers() {
    }

    public TblCustomers(Integer id) {
        this.id = id;
    }

    public TblCustomers(Integer id, String name, String email, String phone, int position) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.position = position;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getPosition() {
        return position;
    }

    public void setPosition(int position) {
        this.position = position;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @XmlTransient
    public Collection<TblAdvertisement> getTblAdvertisementCollection() {
        return tblAdvertisementCollection;
    }

    public void setTblAdvertisementCollection(Collection<TblAdvertisement> tblAdvertisementCollection) {
        this.tblAdvertisementCollection = tblAdvertisementCollection;
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
        if (!(object instanceof TblCustomers)) {
            return false;
        }
        TblCustomers other = (TblCustomers) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "fpt.entities.TblCustomers[ id=" + id + " ]";
    }
    
}
