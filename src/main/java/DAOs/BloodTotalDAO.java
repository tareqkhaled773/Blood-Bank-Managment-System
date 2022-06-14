package DAOs;

import Beans.BloodQuantity;
import Entities.BloodStock;
import Entities.BloodTotal;
import Entities.Donor;
import Entities.Request;
import Util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

public class BloodTotalDAO {

    public void insert(BloodStock bs){

        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();

            List<BloodTotal> bloodtotal= new ArrayList<BloodTotal>();
            bloodtotal= getBloodTotal();
            for(BloodTotal bt: bloodtotal ){

                if(bt.getBloodgroup().equals(bs.getBloodgroup()) && bt.getFklocation().equals(bs.getFklocation())){

                    Integer newQuantity = bt.getQuantity() + bs.getQuantity();
                    Query query = session.createQuery("UPDATE BloodTotal set quantity = :Quantity where idbloodtotal = :ID")
                            .setParameter("Quantity",newQuantity)
                            .setParameter("ID",bt.getIdbloodtotal());
                   int rowc = query.executeUpdate();

                    transaction.commit();
                    return;

                }
            }

            BloodTotal b = new BloodTotal();
            b.setBloodgroup(bs.getBloodgroup());
            b.setFklocation(bs.getFklocation());
            b.setQuantity(bs.getQuantity());
            session.save(b);
            transaction.commit();


        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }

    }

    public List<BloodTotal> getBloodTotal(){

        List<BloodTotal> bloodtotal= new ArrayList<BloodTotal>();

        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();

            bloodtotal = (List<BloodTotal>) session.createQuery("from BloodTotal ").getResultList();

            transaction.commit();


        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return bloodtotal;

    }
}
