package DAOs;
import Entities.*;
import Util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;


public class RequestDAO {

        public static boolean saverequest(Request req) {

            Transaction transaction = null;
            try (Session session = HibernateUtil.getSessionFactory().openSession()) {
                transaction = session.beginTransaction();
                session.save(req);
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

    public List<Request> getRequests(){
        Transaction transaction = null;
        List<Request> req = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            req = (List<Request>) session.createQuery("from Request ").getResultList();
            transaction.commit();


        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return req;
    }
    }


