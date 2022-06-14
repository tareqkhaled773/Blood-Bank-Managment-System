package Util;

import Beans.BloodQuantity;
import Entities.*;
import example.*;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;

import java.util.Properties;

/**
 * Java based configuration
 * @author ramesh Fadatare
 *
 */
public class HibernateUtil {
	private static SessionFactory sessionFactory;

	public static SessionFactory getSessionFactory() {
		if (sessionFactory == null) {
			try {
				Configuration configuration = new Configuration();
				

				// Hibernate settings equivalent to hibernate.cfg.xml's properties
				Properties settings = new Properties();
				settings.put(Environment.DRIVER, "com.mysql.jdbc.Driver");
				settings.put(Environment.URL, "jdbc:mysql://localhost:3306/bloodbank?useSSL=false");
				settings.put(Environment.USER, "malick");
				settings.put(Environment.PASS, "test123");
				settings.put(Environment.DIALECT, "org.hibernate.dialect.MySQL5Dialect");

				settings.put(Environment.SHOW_SQL, "true");

				settings.put(Environment.CURRENT_SESSION_CONTEXT_CLASS, "thread");

				settings.put(Environment.HBM2DDL_AUTO, "update");

				configuration.setProperties(settings);
				configuration.addAnnotatedClass(Admin.class);
				configuration.addAnnotatedClass(User.class);
				configuration.addAnnotatedClass(Request.class);
				configuration.addAnnotatedClass(Location.class);
				configuration.addAnnotatedClass(Donor.class);
				configuration.addAnnotatedClass(BloodStock.class);
				configuration.addAnnotatedClass(BloodQuantity.class);
				configuration.addAnnotatedClass(BloodTotal.class);

				ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
						.applySettings(configuration.getProperties()).build();
				System.out.println("Hibernate Java Config serviceRegistry created");
				sessionFactory = configuration.buildSessionFactory(serviceRegistry);
				return sessionFactory;

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return sessionFactory;
	}
}
