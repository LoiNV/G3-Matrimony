package fpt.entities;

import fpt.entities.TblUsers;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-01-03T23:32:06")
@StaticMetamodel(TblImages.class)
public class TblImages_ { 

    public static volatile SingularAttribute<TblImages, String> imgLink;
    public static volatile SingularAttribute<TblImages, Integer> id;
    public static volatile SingularAttribute<TblImages, TblUsers> userId;
    public static volatile SingularAttribute<TblImages, Integer> status;

}