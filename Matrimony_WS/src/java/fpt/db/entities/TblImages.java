/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fpt.db.entities;

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
@Table(name = "tbl_Images")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TblImages.findAll", query = "SELECT t FROM TblImages t"),
    @NamedQuery(name = "TblImages.findById", query = "SELECT t FROM TblImages t WHERE t.id = :id"),
    @NamedQuery(name = "TblImages.findByImgLink", query = "SELECT t FROM TblImages t WHERE t.imgLink = :imgLink")})
public class TblImages implements Serializable {
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
    @Column(name = "imgLink")
    private String imgLink;
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private TblUsers userId;

    public TblImages() {
    }

    public TblImages(Integer id) {
        this.id = id;
    }

    public TblImages(Integer id, String imgLink) {
        this.id = id;
        this.imgLink = imgLink;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getImgLink() {
        return imgLink;
    }

    public void setImgLink(String imgLink) {
        this.imgLink = imgLink;
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
        if (!(object instanceof TblImages)) {
            return false;
        }
        TblImages other = (TblImages) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "fpt.db.entities.TblImages[ id=" + id + " ]";
    }
    
}
