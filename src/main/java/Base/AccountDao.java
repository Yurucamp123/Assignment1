package Base;

import model.entity.Account;
import model.entity.Employee;

import java.util.List;

public interface AccountDao {
    List<Account> getAllAccounts();
    void saveOrUpdateAccount(Account account);
    void deleteAccountById (int id);
    Account findAccountById (int id);
    Account findAccountByNameAndPass (String username, String password);
}
