/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fpt.entities;

import java.io.Serializable;
import java.math.BigInteger;
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
 * @author Admin
 */
@Entity
@Table(name = "tbl_Users")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TblUsers.searchForAll", query = "SELECT t FROM TblUsers t WHERE (:name = '' or t.name like :name) AND t.gender = :gender AND (t.age between :age1 and :age2) AND (:city = '' OR t.city = :city) AND ( :country = '' OR t.country = :country)"),
    @NamedQuery(name = "TblUsers.findByEmailAndPass", query = "SELECT t FROM TblUsers t WHERE t.email = :email AND t.password = :password"),
    @NamedQuery(name = "TblUsers.findByGenderAndAgeToAge", query = "SELECT t FROM TblUsers t WHERE t.gender = :gender AND t.age >= :age1 AND t.age <= :age2"),
    @NamedQuery(name = "TblUsers.findAll", query = "SELECT t FROM TblUsers t"),
    @NamedQuery(name = "TblUsers.findById", query = "SELECT t FROM TblUsers t WHERE t.id = :id"),
    @NamedQuery(name = "TblUsers.findByName", query = "SELECT t FROM TblUsers t WHERE t.name = :name"),
    @NamedQuery(name = "TblUsers.findByPassword", query = "SELECT t FROM TblUsers t WHERE t.password = :password"),
    @NamedQuery(name = "TblUsers.findByEmail", query = "SELECT t FROM TblUsers t WHERE t.email = :email"),
    @NamedQuery(name = "TblUsers.findByGender", query = "SELECT t FROM TblUsers t WHERE t.gender = :gender"),
    @NamedQuery(name = "TblUsers.findByBirthday", query = "SELECT t FROM TblUsers t WHERE t.birthday = :birthday"),
    @NamedQuery(name = "TblUsers.findByAge", query = "SELECT t FROM TblUsers t WHERE t.age = :age"),
    @NamedQuery(name = "TblUsers.findByFirstName", query = "SELECT t FROM TblUsers t WHERE t.firstName = :firstName"),
    @NamedQuery(name = "TblUsers.findByLastName", query = "SELECT t FROM TblUsers t WHERE t.lastName = :lastName"),
    @NamedQuery(name = "TblUsers.findByMaritalStatus", query = "SELECT t FROM TblUsers t WHERE t.maritalStatus = :maritalStatus"),
    @NamedQuery(name = "TblUsers.findByCountry", query = "SELECT t FROM TblUsers t WHERE t.country = :country"),
    @NamedQuery(name = "TblUsers.findByCity", query = "SELECT t FROM TblUsers t WHERE t.city = :city"),
    @NamedQuery(name = "TblUsers.findByPhone", query = "SELECT t FROM TblUsers t WHERE t.phone = :phone"),
    @NamedQuery(name = "TblUsers.findByReligion", query = "SELECT t FROM TblUsers t WHERE t.religion = :religion"),
    @NamedQuery(name = "TblUsers.findByCaste", query = "SELECT t FROM TblUsers t WHERE t.caste = :caste"),
    @NamedQuery(name = "TblUsers.findByAvatar", query = "SELECT t FROM TblUsers t WHERE t.avatar = :avatar"),
    @NamedQuery(name = "TblUsers.findByLongtitude", query = "SELECT t FROM TblUsers t WHERE t.longtitude = :longtitude"),
    @NamedQuery(name = "TblUsers.findByLatitude", query = "SELECT t FROM TblUsers t WHERE t.latitude = :latitude"),
    @NamedQuery(name = "TblUsers.findByStatus", query = "SELECT t FROM TblUsers t WHERE t.status = :status"),
    @NamedQuery(name = "TblUsers.findByDescription", query = "SELECT t FROM TblUsers t WHERE t.description = :description")})
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
    @Size(min = 1, max = 20)
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
    @Basic(optional = false)
    @NotNull
    @Column(name = "age")
    private int age;
    @Size(max = 20)
    @Column(name = "first_name")
    private String firstName;
    @Size(max = 20)
    @Column(name = "last_name")
    private String lastName;
    @Size(max = 30)
    @Column(name = "marital_status")
    private String maritalStatus;
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
    @Size(max = 1073741823)
    @Column(name = "caste")
    private String caste;
    @Size(max = 1073741823)
    @Column(name = "avatar")
    private String avatar;
    @Column(name = "longtitude")
    private BigInteger longtitude;
    @Column(name = "latitude")
    private BigInteger latitude;
    @Column(name = "status")
    private Integer status;
    @Size(max = 1073741823)
    @Column(name = "description")
    private String description;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "userId")
    private Collection<TblImages> tblImagesCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "userId1")
    private Collection<TblFriends> tblFriendsCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "userId2")
    private Collection<TblFriends> tblFriendsCollection1;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "userId")
    private Collection<TblUserSubscription> tblUserSubscriptionCollection;

    public TblUsers() {
    }

    public TblUsers(Integer id) {
        this.id = id;
    }

    public TblUsers(String name, String password, String email, boolean gender, String birthday, int age) {
        this.name = name;
        this.password = password;
        this.email = email;
        this.gender = gender;
        this.birthday = birthday;
        this.age = age;
    }
    

    public TblUsers(Integer id, String name, String password, String email, boolean gender, String birthday, int age) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.email = email;
        this.gender = gender;
        this.birthday = birthday;
        this.age = age;
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

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
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

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public BigInteger getLongtitude() {
        return longtitude;
    }

    public void setLongtitude(BigInteger longtitude) {
        this.longtitude = longtitude;
    }

    public BigInteger getLatitude() {
        return latitude;
    }

    public void setLatitude(BigInteger latitude) {
        this.latitude = latitude;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @XmlTransient
    public Collection<TblImages> getTblImagesCollection() {
        return tblImagesCollection;
    }

    public void setTblImagesCollection(Collection<TblImages> tblImagesCollection) {
        this.tblImagesCollection = tblImagesCollection;
    }

    @XmlTransient
    public Collection<TblFriends> getTblFriendsCollection() {
        return tblFriendsCollection;
    }

    public void setTblFriendsCollection(Collection<TblFriends> tblFriendsCollection) {
        this.tblFriendsCollection = tblFriendsCollection;
    }

    @XmlTransient
    public Collection<TblFriends> getTblFriendsCollection1() {
        return tblFriendsCollection1;
    }

    public void setTblFriendsCollection1(Collection<TblFriends> tblFriendsCollection1) {
        this.tblFriendsCollection1 = tblFriendsCollection1;
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
        return "fpt.entities.TblUsers[ id=" + id + " ]";
    }
    
}
