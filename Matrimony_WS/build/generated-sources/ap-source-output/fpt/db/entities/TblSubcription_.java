package fpt.db.entities;

import fpt.db.entities.TblUserSubscription;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2015-12-04T16:02:29")
@StaticMetamodel(TblSubcription.class)
public class TblSubcription_ { 

    public static volatile SingularAttribute<TblSubcription, Integer> duration;
    public static volatile SingularAttribute<TblSubcription, Double> price;
    public static volatile SingularAttribute<TblSubcription, String> name;
    public static volatile CollectionAttribute<TblSubcription, TblUserSubscription> tblUserSubscriptionCollection;
    public static volatile SingularAttribute<TblSubcription, Integer> id;

}