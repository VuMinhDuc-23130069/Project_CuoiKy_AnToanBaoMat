package vn.edu.nlu.fit.dao;

import vn.edu.nlu.fit.model.News;

import java.util.List;

public class AdminNewsDAO extends BaseDao{
    public List<News> getAll() {
        return getJdbi().withHandle(handle ->
                handle.createQuery("SELECT * FROM news ORDER BY date_post DESC")
                        .mapToBean(News.class)
                        .list()
        );
    }

    public int insert(News n) {
        String sql = "insert into news (title, content, short_description, image_url, user_id, date_post, is_published) " +
                "values (:title, :content, :short, :img, :uid, :date, :status)";
        return getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("title", n.getTitle())
                        .bind("content", n.getContent())
                        .bind("short", n.getShortDescription())
                        .bind("img", n.getImageURL())
                        .bind("uid", 1) // Mặc định Admin ID = 1 (hoặc lấy từ session)
                        .bind("date", n.getDatePost())
                        .bind("status", n.getIsPublished())
                        .execute()
        );
    }

    public News getById(int id) {
        return getJdbi().withHandle(handle ->
                handle.createQuery("select * from news where id = :id")
                        .bind("id", id)
                        .mapToBean(News.class)
                        .one()
        );
    }

    public int update(News n) {
        String sql = "update news set title=:title, content=:content, short_description=:short, " +
                "image_url=:img, date_post=:date, is_published=:status where id=:id";
        return getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("title", n.getTitle())
                        .bind("content", n.getContent())
                        .bind("short", n.getShortDescription())
                        .bind("img", n.getImageURL())
                        .bind("date", n.getDatePost())
                        .bind("status", n.getIsPublished())
                        .bind("id", n.getId())
                        .execute()
        );
    }

    public int delete(int id) {
        return getJdbi().withHandle(handle ->
                handle.createUpdate("delete from news where id = :id")
                        .bind("id", id)
                        .execute()
        );
    }
}

