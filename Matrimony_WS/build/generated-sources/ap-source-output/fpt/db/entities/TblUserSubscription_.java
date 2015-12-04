package fpt.db.entities;

import fpt.db.entities.TblSubcription;
import fpt.db.entities.TblUsers;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2015-12-04T16:02:29")
@StaticMetamodel(TblUserSubscription.class)
public class TblUserSubscription_ { 

    public static volatile SingularAttribute<TblUserSubscription, TblSubcription> subId;
    public static volatile SingularAttribute<TblUserSubscription, Date> chargedDate;
    public static volatile SingularAttribute<TblUserSubscription, Integer> id;
    public static volatile SingularAttribute<TblUserSubscription, TblUsers> userId;

}