package DAOs;

import Beans.BloodQuantity;
import Entities.Admin;
import Entities.BloodStock;
import Entities.BloodTotal;
import Entities.Location;
import Util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.ArrayList;
import java.util.List;

public class BloodStockDAO {

    public boolean saveBlood(BloodStock blo){
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            session.save(blo);

            // commit transaction
            transaction.commit();
            BloodTotalDAO btd = new BloodTotalDAO();
            btd.insert(blo);
            return true;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return false;

    }
    public boolean checkBlood(Integer quantity,String bloodGroup,Integer location){

        Transaction transaction = null;
        Admin admin = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            Long quant = (Long) session.createQuery(" SELECT sum(quantity) FROM BloodStock WHERE  bloodgroup= :BloodGroup and fklocation = :Location")
                    .setParameter("BloodGroup",bloodGroup)
                    .setParameter("Location",location)
                    .getSingleResult();


            transaction.commit();
            if(quant>=quantity){
                return true;
            }
            else {
                return false;
            }

        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }


        return false;
    }
    public List<BloodQuantity> getBloods(Integer location){
        ArrayList<String> bloodGroups = new ArrayList<String>();
        bloodGroups.add("A+");
        bloodGroups.add("A-");
        bloodGroups.add("B+");
        bloodGroups.add("B-");
        bloodGroups.add("O+");
        bloodGroups.add("O-");
        bloodGroups.add("AB+");
        bloodGroups.add("AB-");
        ArrayList<Integer> quantities = new ArrayList<Integer>();
        List<BloodQuantity> bq= new ArrayList<BloodQuantity>();

        for(String group: bloodGroups) {
            Transaction transaction = null;
            try (Session session = HibernateUtil.getSessionFactory().openSession()) {
                // start a transaction


                transaction = session.beginTransaction();
                Long quant = (Long) session.createQuery(" SELECT sum(quantity) FROM BloodStock WHERE  bloodgroup= :BloodGroup and fklocation = :Location")
                        .setParameter("BloodGroup",group)
                        .setParameter("Location",location)
                        .getSingleResult();
               // query.setParameter("Location", location);
                //query.setParameter("BloodGroup", group);
                if(quant == null){
                    quant = Long.valueOf(0);
                }
                BloodQuantity b = new BloodQuantity();
                b.setbType(group);
               // b.setQuantity((Integer) query.getSingleResult());
                b.setQuantity(quant);
                // quantities.add((Integer) query.getSingleResult());
                bq.add(b);
                transaction.commit();


            } catch (Exception e) {
                System.out.println(e);
                if (transaction != null) {
                    //transaction.rollback();
                }
                e.printStackTrace();
            }
        }

        return bq;

    }
}
