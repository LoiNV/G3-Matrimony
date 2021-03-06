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
@Table(name = "tbl_Friends")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TblFriends.findAll", query = "SELECT t FROM TblFriends t"),
    @NamedQuery(name = "TblFriends.findById", query = "SELECT t FROM TblFriends t WHERE t.id = :id"),
    @NamedQuery(name = "TblFriends.findByCreatedDate", query = "SELECT t FROM TblFriends t WHERE t.createdDate = :createdDate"),
    @NamedQuery(name = "TblFriends.findByNamespace", query = "SELECT t FROM TblFriends t WHERE t.namespace = :namespace"),
    @NamedQuery(name = "TblFriends.findByStatus", query = "SELECT t FROM TblFriends t WHERE t.status = :status")})
public class TblFriends implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "created_date")
    private String createdDate;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "namespace")
    private String namespace;
    @Column(name = "status")
    private Integer status;
    @JoinColumn(name = "userId1", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private TblUsers userId1;
    @JoinColumn(name = "userId2", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private TblUsers userId2;

    public TblFriends() {
    }

    public TblFriends(Integer id) {
        this.id = id;
    }

    public TblFriends(Integer id, String createdDate, String namespace) {
        this.id = id;
        this.createdDate = createdDate;
        this.namespace = namespace;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public String getNamespace() {
        return namespace;
    }

    public void setNamespace(String namespace) {
        this.namespace = namespace;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public TblUsers getUserId1() {
        return userId1;
    }

    public void setUserId1(TblUsers userId1) {
        this.userId1 = userId1;
    }

    public TblUsers getUserId2() {
        return userId2;
    }

    public void setUserId2(TblUsers userId2) {
        this.userId2 = userId2;
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
        if (!(object instanceof TblFriends)) {
            return false;
        }
        TblFriends other = (TblFriends) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "fpt.entities.TblFriends[ id=" + id + " ]";
    }
    
}
