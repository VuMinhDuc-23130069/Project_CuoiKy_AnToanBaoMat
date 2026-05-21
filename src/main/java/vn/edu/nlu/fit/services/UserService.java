package vn.edu.nlu.fit.services;

import vn.edu.nlu.fit.dao.UserDAO;
import vn.edu.nlu.fit.model.Users;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

public class UserService {

    private UserDAO userDAO = new UserDAO();

    private static final String email_regrex =
            "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$"; //nhập đúng định dajg email

    private static final String password_regrex =
            "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,}$"; //có chử cái, số, kí tự đặc biệt, từ 8 kí tự trở lên

    //login
    public Users login(String email, String password) {
        Users user = userDAO.findByEmail(email);

        if (user == null) {
            return null;
        }
        String hashPass = HashMD5.md5(password);
        // sai mật khẩu
        if (!user.getPassword_hash().equals(hashPass)) {
            return null;
        }
        // tài khoản bị khóa
        if (!user.isActive()) {
            throw new IllegalArgumentException("Tài khoản đã bị khóa");
        }
        return user; // OK
    }

    //đk tk
    public void register(String fullName, String email, String phoneNumber,
                         String password, String birthday) {

        Users user = new Users();
        user.setFullName(fullName);
        user.setEmail(email);
        user.setPhoneNumber(phoneNumber);
        user.setPassword_hash(HashMD5.md5(password));
        user.setBirthday(LocalDate.parse(birthday));
        user.setUserRole("user");
        user.setActive(false);

        //  token xác thực
        String token = UUID.randomUUID().toString();
        LocalDateTime expired = LocalDateTime.now().plusMinutes(15);

        user.setResetToken(token);
        user.setResetExpired(expired);

        userDAO.insert(user);

        // gửi mail xác thực
        String verifyLink = "http://localhost:8080/DoAnLTWEB/VerifyEmail?token=" + token;
        EmailUtil.sendVerifyEmail(email, verifyLink);
    }

    public boolean verifyEmail(String token) {
        Users user = userDAO.findByResetToken(token);
        if (user == null) return false;

        userDAO.activateUser(user.getId());
        return true;
    }


    public void sendResetPasswordEmail(String email, String contextPath) {
        Users user = userDAO.findByEmail(email);
        if (user == null) {
            throw new IllegalArgumentException("Email không tồn tại");
        }
        String token = UUID.randomUUID().toString();
        LocalDateTime expired = LocalDateTime.now().plusMinutes(15);
        userDAO.saveResetToken(email, token, expired);
        String resetLink = contextPath + "/ResetPassword?token=" + token;
        EmailUtil.sendResetEmail(email, resetLink);
    }

    public Users findByResetToken(String token) {
        return userDAO.findByResetToken(token);
    }

    public List<Users> findAll() {
        return userDAO.findAll();
    }
    public void updateUser(int id, String fullName, String phone, boolean active) {
        userDAO.updateUser(id, fullName, phone, active);
    }

    public void deleteUser(int id) {
        userDAO.deleteUser(id);
    }

    public void createByAdmin(Users user) {
        // check email trùng
        if (userDAO.findByEmail(user.getEmail()) != null) {
            throw new IllegalArgumentException("Email đã tồn tại");
        }
        userDAO.insertByAdmin(user);
    }


    public void resetPasswordByToken(String token, String newPassword) {
        // check token
        Users user = userDAO.findByResetToken(token);
        if (user == null) {
            throw new IllegalArgumentException("Token không hợp lệ hoặc đã hết hạn");
        }

        // check mật khẩu trống
        if (newPassword == null || newPassword.isEmpty()) {
            throw new IllegalArgumentException("Vui lòng nhập mật khẩu mới");
        }

        // check mật khẩu mạnh
        if (!newPassword.matches(password_regrex)) {
            throw new IllegalArgumentException(
                    "Mật khẩu phải ≥ 8 ký tự, gồm chữ, số và ký tự đặc biệt"
            );
        }

        // hash mật khẩu
        String hashedPassword = HashMD5.md5(newPassword);

        // cập nhật mật khẩu
        userDAO.updatePasswordByToken(token, hashedPassword);
        // xoá token sau khi dùng
        userDAO.clearResetToken(token);
    }



}
