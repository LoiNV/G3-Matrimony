package fpt.entities;

import fpt.entities.TblAdvertisement;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-01-06T23:24:24")
@StaticMetamodel(TblCustomers.class)
public class TblCustomers_ { 

    public static volatile SingularAttribute<TblCustomers, String> phone;
    public static volatile SingularAttribute<TblCustomers, String> name;
    public static volatile SingularAttribute<TblCustomers, Integer> id;
    public static volatile SingularAttribute<TblCustomers, Integer> position;
    public static volatile SingularAttribute<TblCustomers, String> email;
    public static volatile SingularAttribute<TblCustomers, Integer> status;
    public static volatile CollectionAttribute<TblCustomers, TblAdvertisement> tblAdvertisementCollection;

}