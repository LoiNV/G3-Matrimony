package fpt.entities;

import fpt.entities.TblUserSubscription;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-01-06T23:24:24")
@StaticMetamodel(TblSubcription.class)
public class TblSubcription_ { 

    public static volatile SingularAttribute<TblSubcription, Integer> duration;
    public static volatile SingularAttribute<TblSubcription, Double> price;
    public static volatile SingularAttribute<TblSubcription, String> name;
    public static volatile CollectionAttribute<TblSubcription, TblUserSubscription> tblUserSubscriptionCollection;
    public static volatile SingularAttribute<TblSubcription, Integer> id;

}