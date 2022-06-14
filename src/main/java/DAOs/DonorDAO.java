package DAOs;

import Entities.Donor;
import Entities.Location;
import Util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.Base64;
import java.util.List;

public class DonorDAO {

    public boolean saveDonor(Donor don){

        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();

            session.save(don);
            // commit transaction
            transaction.commit();
            System.out.println("Trans don");
            return true;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            System.out.println(e);
            e.printStackTrace();
        }
        return false;

    }

    public List<Donor> getDonors(){
        Transaction transaction = null;
        List<Donor> don = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            don = (List<Donor>) session.createQuery("from Donor").getResultList();
            transaction.commit();
            for(Donor d: don){
                byte[] encodeBase64 = Base64.getEncoder().encode(d.getPicture());

                String base64Encoded = new String(encodeBase64, "UTF-8");
                d.setBase64(base64Encoded);
            }


        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return don;
    }
}
