package fpt.entities;

import fpt.entities.TblFriends;
import fpt.entities.TblImages;
import fpt.entities.TblUserSubscription;
import java.math.BigInteger;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-01-03T23:32:06")
@StaticMetamodel(TblUsers.class)
public class TblUsers_ { 

    public static volatile SingularAttribute<TblUsers, String> birthday;
    public static volatile CollectionAttribute<TblUsers, TblFriends> tblFriendsCollection;
    public static volatile SingularAttribute<TblUsers, String> lastName;
    public static volatile SingularAttribute<TblUsers, String> country;
    public static volatile CollectionAttribute<TblUsers, TblImages> tblImagesCollection;
    public static volatile SingularAttribute<TblUsers, Boolean> gender;
    public static volatile SingularAttribute<TblUsers, String> city;
    public static volatile SingularAttribute<TblUsers, String> caste;
    public static volatile SingularAttribute<TblUsers, BigInteger> latitude;
    public static volatile SingularAttribute<TblUsers, BigInteger> longtitude;
    public static volatile SingularAttribute<TblUsers, String> description;
    public static volatile CollectionAttribute<TblUsers, TblUserSubscription> tblUserSubscriptionCollection;
    public static volatile SingularAttribute<TblUsers, String> avatar;
    public static volatile SingularAttribute<TblUsers, String> religion;
    public static volatile SingularAttribute<TblUsers, String> firstName;
    public static volatile SingularAttribute<TblUsers, String> password;
    public static volatile SingularAttribute<TblUsers, String> phone;
    public static volatile CollectionAttribute<TblUsers, TblFriends> tblFriendsCollection1;
    public static volatile SingularAttribute<TblUsers, String> name;
    public static volatile SingularAttribute<TblUsers, Integer> id;
    public static volatile SingularAttribute<TblUsers, String> email;
    public static volatile SingularAttribute<TblUsers, Integer> age;
    public static volatile SingularAttribute<TblUsers, String> maritalStatus;
    public static volatile SingularAttribute<TblUsers, Integer> status;

}