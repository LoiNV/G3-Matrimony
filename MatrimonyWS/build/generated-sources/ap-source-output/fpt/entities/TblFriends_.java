package fpt.entities;

import fpt.entities.TblUsers;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-01-09T10:43:56")
@StaticMetamodel(TblFriends.class)
public class TblFriends_ { 

    public static volatile SingularAttribute<TblFriends, TblUsers> userId1;
    public static volatile SingularAttribute<TblFriends, String> createdDate;
    public static volatile SingularAttribute<TblFriends, TblUsers> userId2;
    public static volatile SingularAttribute<TblFriends, String> namespace;
    public static volatile SingularAttribute<TblFriends, Integer> id;
    public static volatile SingularAttribute<TblFriends, Integer> status;

}