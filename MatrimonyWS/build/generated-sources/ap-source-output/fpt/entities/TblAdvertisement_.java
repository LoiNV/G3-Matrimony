package fpt.entities;

import fpt.entities.TblCustomers;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-01-06T23:24:24")
@StaticMetamodel(TblAdvertisement.class)
public class TblAdvertisement_ { 

    public static volatile SingularAttribute<TblAdvertisement, Integer> duration;
    public static volatile SingularAttribute<TblAdvertisement, String> image;
    public static volatile SingularAttribute<TblAdvertisement, Double> amount;
    public static volatile SingularAttribute<TblAdvertisement, String> createdDate;
    public static volatile SingularAttribute<TblAdvertisement, String> link;
    public static volatile SingularAttribute<TblAdvertisement, TblCustomers> customerId;
    public static volatile SingularAttribute<TblAdvertisement, Integer> id;
    public static volatile SingularAttribute<TblAdvertisement, String> message;
    public static volatile SingularAttribute<TblAdvertisement, Integer> status;

}