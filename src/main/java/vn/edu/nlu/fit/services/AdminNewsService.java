package vn.edu.nlu.fit.services;

import vn.edu.nlu.fit.dao.AdminNewsDAO;
import vn.edu.nlu.fit.model.News;

import java.util.List;

public class AdminNewsService {
    AdminNewsDAO dao = new AdminNewsDAO();

    public List<News> getAll() {
        return dao.getAll();
    }
    public void insert(News n) {
        dao.insert(n);
    }
    public News getById(int id) {
        return dao.getById(id);
    }
    public void update(News n) {
        dao.update(n);
    }
    public void delete(int id) {
        dao.delete(id);
    }
}
