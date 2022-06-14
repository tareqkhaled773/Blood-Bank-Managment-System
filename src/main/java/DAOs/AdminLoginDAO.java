package DAOs;

import Entities.Admin;
import Util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;


public class AdminLoginDAO {

    public static boolean validate(String userName, String password) {

        Transaction transaction = null;
        Admin admin = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            admin = (Admin) session.createQuery("FROM Admin a WHERE a.Username = :Username").setParameter("Username", userName)
                    .uniqueResult();

            if(admin != null && admin.getPassword().equals(password)) {
                System.out.println("Validated");
                return true;
            }
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return false;
    }
}
