package service.impl;

import converter.AccountConverter;
import dao.IAccountDAO;
import dao.impl.AccountDAO;
import dto.AccountDTO;
import entity.Account;
import org.apache.commons.lang.RandomStringUtils;
import service.IAccountService;
import util.EmailUtil;
import util.SecurityUtil;
import util.SessionUtil;

import javax.inject.Inject;
import javax.mail.MessagingException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;

public class AccountService implements IAccountService {

    private IAccountDAO accountDAO = new AccountDAO();
    private AccountConverter accountConverter = new AccountConverter();

    @Override
    public boolean insertAccount(AccountDTO user) {
        Account account = accountConverter.toEntity(user);
        Account em = account;
        if (accountDAO.insert(account)) {
            return true;
        }
        return false;
    }

    @Override
    public Account updateAccount(AccountDTO user) {
        Account account = accountConverter.toEntity(user);
        return accountDAO.update(account);
    }

    @Override
    public boolean deleteAccount(AccountDTO user) {
        Account account = accountConverter.toEntity(user);
        if (accountDAO.delete(account)) {
            return true;
        }
        return false;
    }

    @Override
    public AccountDTO findById(Integer id) {
        return accountConverter.toDto(accountDAO.findById(id));
    }

    @Override
    public AccountDTO findByUsernamePassword(String username, String password) {
        return accountConverter.toDto(accountDAO.findByUsernamePassword(username, password));
    }

    @Override
    public AccountDTO findByEmail(String email) {
        return accountConverter.toDto(accountDAO.findByEmail(email));
    }

    @Override
    public Boolean registerAccount(AccountDTO account) {
        if (accountDAO.findByUsername(account.getUsername()) == null
                && accountDAO.findByEmail(account.getEmail()) == null) {
            account.setRoleid(2);
            account.setActive(true);
            if (insertAccount(account)) {
                return true;
            } else return false;
        }
        return false;
    }

    @Override
    public Boolean sendMailRegister(AccountDTO account, String contextfile) {
        if (account.getPass().equals(account.getComfirmPass())
                && accountDAO.findByEmail(account.getEmail()) == null
                && accountDAO.findByUsername(account.getUsername()) == null) {
            Calendar calendar = Calendar.getInstance();
            calendar.add(Calendar.HOUR_OF_DAY, 1);
            Date timeReset = calendar.getTime();
            DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            String strTimeReset = dateFormat.format(timeReset);
            String subject = "User Email Verification";
            String content = "Registered successfully." +
                    "\nPlease verify your account using this code: " + account.getCode();
            try {
                EmailUtil.sendEmail(account.getEmail(), subject, content);
                return true;
            } catch (Exception ex) {
                return false;
            }
        }
        return false;
    }

    @Override
    public Integer countTotalStudent() {
        return accountDAO.countTotalStudent();
    }

    @Override
    public Boolean updatePassword(AccountDTO accountDTO) {
        accountDTO.setPass(accountDTO.getNewPass());
        if (updateAccount(accountDTO) != null) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public Integer recoverPassword(String email, String contextfile) {
        try {
            accountDAO = new AccountDAO();
            Account account = new Account();
            account = accountDAO.findByEmail(email);
            AccountDTO accountDTO = new AccountDTO();
            accountDTO = accountConverter.toDto(account);
            if (account != null) {
                String newPassword = RandomStringUtils.randomAlphabetic(8);
                accountDTO.setPassreset(newPassword);
                updateAccount(accountDTO);
                Calendar calendar = Calendar.getInstance();
                calendar.add(Calendar.HOUR_OF_DAY, 1);
                Date timeReset = calendar.getTime();
                DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                String strTimeReset = dateFormat.format(timeReset);
                String subject = "Reset password";
                String content = "New password: " + newPassword
                        + "\nClick on the following link to reset your password:"
                        + "\nhttps://"+contextfile+"/recover-password?value="
                        + SecurityUtil.encoded(email + "|" + newPassword + "|" + strTimeReset)
                        + "\nThe link is valid until: " + strTimeReset;
                System.out.println(content);
                EmailUtil.sendEmail(email, subject, content);
                return 1;
            } else {
                return -2;
            }
        } catch (Exception ex) {
            return -1;
        }
    }

    @Override
    public Integer resetPassword(String email, String newpassword, String strDatelink) {
        try {
            AccountDAO accountDAO = new AccountDAO();
            Account account = accountDAO.findByEmail(email);
            if (account.getPassreset() != null && account.getPassreset().equals(newpassword)) {
                Date dateLink = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").parse(strDatelink);
                if (dateLink.after(Calendar.getInstance().getTime())) {
                    return accountDAO.resetPassword(email, newpassword);
                } else {
                    return -2;
                }
            } else {
                return -1;
            }
        } catch (ParseException e) {
            return -1;
        }
    }
}
