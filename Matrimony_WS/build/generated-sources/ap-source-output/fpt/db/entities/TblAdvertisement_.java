package fpt.db.entities;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2015-12-12T14:09:30")
@StaticMetamodel(TblAdvertisement.class)
public class TblAdvertisement_ { 

    public static volatile SingularAttribute<TblAdvertisement, String> image;
    public static volatile SingularAttribute<TblAdvertisement, Date> createdDate;
    public static volatile SingularAttribute<TblAdvertisement, Double> price;
    public static volatile SingularAttribute<TblAdvertisement, String> link;
    public static volatile SingularAttribute<TblAdvertisement, Integer> id;
    public static volatile SingularAttribute<TblAdvertisement, String> message;
    public static volatile SingularAttribute<TblAdvertisement, Integer> status;

}