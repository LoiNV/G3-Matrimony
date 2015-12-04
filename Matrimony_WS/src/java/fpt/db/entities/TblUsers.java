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
@Table(name = "tbl_Users")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TblUsers.findAll", query = "SELECT t FROM TblUsers t"),
    @NamedQuery(name = "TblUsers.findById", query = "SELECT t FROM TblUsers t WHERE t.id = :id"),
    @NamedQuery(name = "TblUsers.findByName", query = "SELECT t FROM TblUsers t WHERE t.name = :name"),
    @NamedQuery(name = "TblUsers.findByPassword", query = "SELECT t FROM TblUsers t WHERE t.password = :password"),
    @NamedQuery(name = "TblUsers.findByEmail", query = "SELECT t FROM TblUsers t WHERE t.email = :email"),
    @NamedQuery(name = "TblUsers.findByGender", query = "SELECT t FROM TblUsers t WHERE t.gender = :gender"),
    @NamedQuery(name = "TblUsers.findByBirthday", query = "SELECT t FROM TblUsers t WHERE t.birthday = :birthday"),
    @NamedQuery(name = "TblUsers.findByFirstName", query = "SELECT t FROM TblUsers t WHERE t.firstName = :firstName"),
    @NamedQuery(name = "TblUsers.findByLastName", query = "SELECT t FROM TblUsers t WHERE t.lastName = :lastName"),
    @NamedQuery(name = "TblUsers.findByMaritalStatus", query = "SELECT t FROM TblUsers t WHERE t.maritalStatus = :maritalStatus"),
    @NamedQuery(name = "TblUsers.findByHeight", query = "SELECT t FROM TblUsers t WHERE t.height = :height"),
    @NamedQuery(name = "TblUsers.findByAge", query = "SELECT t FROM TblUsers t WHERE t.age = :age"),
    @NamedQuery(name = "TblUsers.findByAgeToAge", query = "SELECT t FROM TblUsers t WHERE t.age >= :age1 AND t.age <= :age2"),
    @NamedQuery(name = "TblUsers.findByGenderAndAgeToAge", query = "SELECT t FROM TblUsers t WHERE t.gender = :gender AND t.age >= :age1 AND t.age <= :age2"),
    @NamedQuery(name = "TblUsers.findByCountry", query = "SELECT t FROM TblUsers t WHERE t.country = :country"),
    @NamedQuery(name = "TblUsers.findByCity", query = "SELECT t FROM TblUsers t WHERE t.city = :city"),
    @NamedQuery(name = "TblUsers.findByPhone", query = "SELECT t FROM TblUsers t WHERE t.phone = :phone"),
    @NamedQuery(name = "TblUsers.findByReligion", query = "SELECT t FROM TblUsers t WHERE t.religion = :religion"),
    @NamedQuery(name = "TblUsers.findByCaste", query = "SELECT t FROM TblUsers t WHERE t.caste = :caste"),
    @NamedQuery(name = "TblUsers.findByStatus", query = "SELECT t FROM TblUsers t WHERE t.status = :status")})
public class TblUsers implements Serializable {
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
    @Size(min = 1, max = 50)
    @Column(name = "password")
    private String password;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "email")
    private String email;
    @Basic(optional = false)
    @NotNull
    @Column(name = "gender")
    private boolean gender;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "birthday")
    private String birthday;
    @Size(max = 20)
    @Column(name = "first_name")
    private String firstName;
    @Size(max = 20)
    @Column(name = "last_name")
    private String lastName;
    @Size(max = 20)
    @Column(name = "marital_status")
    private String maritalStatus;
    @Column(name = "height")
    private Integer height;
    @Column(name = "age")
    private Integer age;
    @Size(max = 30)
    @Column(name = "country")
    private String country;
    @Size(max = 30)
    @Column(name = "city")
    private String city;
    // @Pattern(regexp="^\\(?(\\d{3})\\)?[- ]?(\\d{3})[- ]?(\\d{4})$", message="Invalid phone/fax format, should be as xxx-xxx-xxxx")//if the field contains phone or fax number consider using this annotation to enforce field validation
    @Size(max = 15)
    @Column(name = "phone")
    private String phone;
    @Size(max = 50)
    @Column(name = "religion")
    private String religion;
    @Size(max = 100)
    @Column(name = "caste")
    private String caste;
    @Column(name = "status")
    private Integer status;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "userId")
    private Collection<TblImages> tblImagesCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "userId")
    private Collection<TblUserSubscription> tblUserSubscriptionCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "userId1")
    private Collection<TblCandidates> tblCandidatesCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "userId2")
    private Collection<TblCandidates> tblCandidatesCollection1;

    public TblUsers() {
    }

    public TblUsers(Integer id) {
        this.id = id;
    }

    public TblUsers(Integer id, String name, String password, String email, boolean gender, String birthday) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.email = email;
        this.gender = gender;
        this.birthday = birthday;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean getGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getMaritalStatus() {
        return maritalStatus;
    }

    public void setMaritalStatus(String maritalStatus) {
        this.maritalStatus = maritalStatus;
    }

    public Integer getHeight() {
        return height;
    }

    public void setHeight(Integer height) {
        this.height = height;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getReligion() {
        return religion;
    }

    public void setReligion(String religion) {
        this.religion = religion;
    }

    public String getCaste() {
        return caste;
    }

    public void setCaste(String caste) {
        this.caste = caste;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @XmlTransient
    public Collection<TblImages> getTblImagesCollection() {
        return tblImagesCollection;
    }

    public void setTblImagesCollection(Collection<TblImages> tblImagesCollection) {
        this.tblImagesCollection = tblImagesCollection;
    }

    @XmlTransient
    public Collection<TblUserSubscription> getTblUserSubscriptionCollection() {
        return tblUserSubscriptionCollection;
    }

    public void setTblUserSubscriptionCollection(Collection<TblUserSubscription> tblUserSubscriptionCollection) {
        this.tblUserSubscriptionCollection = tblUserSubscriptionCollection;
    }

    @XmlTransient
    public Collection<TblCandidates> getTblCandidatesCollection() {
        return tblCandidatesCollection;
    }

    public void setTblCandidatesCollection(Collection<TblCandidates> tblCandidatesCollection) {
        this.tblCandidatesCollection = tblCandidatesCollection;
    }

    @XmlTransient
    public Collection<TblCandidates> getTblCandidatesCollection1() {
        return tblCandidatesCollection1;
    }

    public void setTblCandidatesCollection1(Collection<TblCandidates> tblCandidatesCollection1) {
        this.tblCandidatesCollection1 = tblCandidatesCollection1;
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
        if (!(object instanceof TblUsers)) {
            return false;
        }
        TblUsers other = (TblUsers) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "fpt.db.entities.TblUsers[ id=" + id + " ]";
    }
    
}
