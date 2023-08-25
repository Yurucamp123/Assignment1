package Base.Impl;

import Base.AccountDao;
import model.entity.Account;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import utils.HibernateUtils;

import javax.persistence.Query;
import java.util.List;

public class AccountDaoImpl implements AccountDao {
    private SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
    @Override
    public List<Account> getAllAccounts() {
        List<Account> accounts = null;
        try (Session session = sessionFactory.openSession()) {
            accounts = session.createQuery("FROM Account", Account.class).list();
        } catch (Exception e) {
            // Handle exception appropriately
            e.printStackTrace();
        }
        return accounts;
    }
    @Override
    public void saveOrUpdateAccount(Account account) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
            session.saveOrUpdate(account);
            transaction.commit();
        } catch (Exception e) {
            // Handle exception appropriately
            e.printStackTrace();
        }
    }
    @Override
    public void deleteAccountById(int id) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
            Account account = session.get(Account.class, id);
            if (account != null) {
                session.delete(account);
            }
            transaction.commit();
        } catch (Exception e) {
            // Handle exception appropriately
            e.printStackTrace();
        }
    }
    @Override
    public Account findAccountById(int id) {
        Account account = null;
        try (Session session = sessionFactory.openSession()) {
            account = session.get(Account.class, id);
        } catch (Exception e) {
            // Handle exception appropriately
            e.printStackTrace();
        }
        return account;
    }

    @Override
    public Account findAccountByNameAndPass(String username, String password) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
            Query query = session.createQuery("FROM Account a Where a.account = :username AND a.password = :password", Account.class);
            query.setParameter("username", username);
            query.setParameter("password", password);
            // commit transaction
            transaction.commit();
            return (Account) query.getSingleResult();
        } catch (Exception e) {
            // Handle exception appropriately
            e.printStackTrace();
        }
        return null;
    }
}