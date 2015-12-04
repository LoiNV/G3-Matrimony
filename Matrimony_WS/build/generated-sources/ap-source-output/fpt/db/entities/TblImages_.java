package fpt.db.entities;

import fpt.db.entities.TblUsers;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2015-12-04T16:02:29")
@StaticMetamodel(TblImages.class)
public class TblImages_ { 

    public static volatile SingularAttribute<TblImages, String> imgLink;
    public static volatile SingularAttribute<TblImages, Integer> id;
    public static volatile SingularAttribute<TblImages, TblUsers> userId;

}