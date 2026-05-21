package vn.edu.nlu.fit.services;

import vn.edu.nlu.fit.dao.NewsDAO;
import vn.edu.nlu.fit.model.News;

public class NewsService {
    NewsDAO newsDAO = new NewsDAO();
    public News getNewsById(int id) {
        return newsDAO.getNewsById(id);
    }
}
