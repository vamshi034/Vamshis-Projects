import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.vamshi.DTO.UserPojo;


public class SetUp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Configuration configuration = new Configuration().configure();
		StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder().
		applySettings(configuration.getProperties());
		SessionFactory factory = configuration.buildSessionFactory(builder.build());
		Session session = factory.openSession();
		
		try {
			Transaction transaction = session.beginTransaction();
			UserPojo newUser = new UserPojo();
			newUser.setUserName("hello");
			newUser.setPassword("hello123");
			session.save(newUser);
			transaction.commit();
		} catch(HibernateException e){
			e.printStackTrace();
		} finally{
			session.close();
		}
	}

}
