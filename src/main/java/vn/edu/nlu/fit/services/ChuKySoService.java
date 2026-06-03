package vn.edu.nlu.fit.services;

import vn.edu.nlu.fit.dao.UserKeyDAO;
import vn.edu.nlu.fit.model.UserKey;

public class ChuKySoService {

    private UserKeyDAO userKeyDAO;

    public ChuKySoService() {
        this.userKeyDAO = new UserKeyDAO();
    }

    public UserKey getActiveKey(int userId) {
        return userKeyDAO.getActiveKeyByUserId(userId);
    }

    // Xử lý báo mất khoá
    public boolean revokeKey(int userId) {
        try {
            userKeyDAO.revokeKey(userId);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
