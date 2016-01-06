package fpt.entities;

import fpt.entities.TblSubcription;
import fpt.entities.TblUsers;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-01-06T23:24:24")
@StaticMetamodel(TblUserSubscription.class)
public class TblUserSubscription_ { 

    public static volatile SingularAttribute<TblUserSubscription, TblSubcription> subId;
    public static volatile SingularAttribute<TblUserSubscription, String> chargedDate;
    public static volatile SingularAttribute<TblUserSubscription, Integer> id;
    public static volatile SingularAttribute<TblUserSubscription, TblUsers> userId;

}