package DAOs;

import Entities.Location;
import Util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class LocationDAO {

    public List<Location> getLocation(){

        Transaction transaction = null;

        List<Location> loc = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            loc = (List<Location>) session.createQuery("from Location").getResultList();
            transaction.commit();


        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return loc;
    }

    public boolean saveLocation(Location loc){
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            session.save(loc);
            // commit transaction

            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return false;

    }
}
