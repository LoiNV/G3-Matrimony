package fpt.db.entities;

import fpt.db.entities.TblCandidates;
import fpt.db.entities.TblImages;
import fpt.db.entities.TblUserSubscription;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2015-12-04T16:02:29")
@StaticMetamodel(TblUsers.class)
public class TblUsers_ { 

    public static volatile SingularAttribute<TblUsers, String> birthday;
    public static volatile SingularAttribute<TblUsers, String> lastName;
    public static volatile SingularAttribute<TblUsers, String> country;
    public static volatile CollectionAttribute<TblUsers, TblImages> tblImagesCollection;
    public static volatile SingularAttribute<TblUsers, Boolean> gender;
    public static volatile SingularAttribute<TblUsers, String> city;
    public static volatile SingularAttribute<TblUsers, String> caste;
    public static volatile CollectionAttribute<TblUsers, TblUserSubscription> tblUserSubscriptionCollection;
    public static volatile SingularAttribute<TblUsers, String> religion;
    public static volatile SingularAttribute<TblUsers, String> firstName;
    public static volatile SingularAttribute<TblUsers, String> password;
    public static volatile SingularAttribute<TblUsers, String> phone;
    public static volatile SingularAttribute<TblUsers, String> name;
    public static volatile SingularAttribute<TblUsers, Integer> id;
    public static volatile SingularAttribute<TblUsers, String> email;
    public static volatile SingularAttribute<TblUsers, String> maritalStatus;
    public static volatile SingularAttribute<TblUsers, Integer> age;
    public static volatile CollectionAttribute<TblUsers, TblCandidates> tblCandidatesCollection;
    public static volatile SingularAttribute<TblUsers, Integer> height;
    public static volatile SingularAttribute<TblUsers, Integer> status;
    public static volatile CollectionAttribute<TblUsers, TblCandidates> tblCandidatesCollection1;

}