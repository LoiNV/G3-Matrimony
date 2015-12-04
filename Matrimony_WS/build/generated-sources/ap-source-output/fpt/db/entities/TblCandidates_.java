package fpt.db.entities;

import fpt.db.entities.TblUsers;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2015-12-04T16:02:29")
@StaticMetamodel(TblCandidates.class)
public class TblCandidates_ { 

    public static volatile SingularAttribute<TblCandidates, TblUsers> userId1;
    public static volatile SingularAttribute<TblCandidates, Date> createdDate;
    public static volatile SingularAttribute<TblCandidates, TblUsers> userId2;
    public static volatile SingularAttribute<TblCandidates, Integer> id;
    public static volatile SingularAttribute<TblCandidates, Integer> status;

}