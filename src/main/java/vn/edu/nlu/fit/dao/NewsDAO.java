package vn.edu.nlu.fit.dao;

import vn.edu.nlu.fit.model.News;

import java.util.List;

public class NewsDAO extends BaseDao{

        public int getTotalNews() {
            return getJdbi().withHandle(handle ->
                    handle.createQuery("SELECT COUNT(*) FROM news WHERE is_published = 1")
                            .mapTo(Integer.class)
                            .one()
            );
        }
        public List<News> getNewsByPage(int offset, int limit) {
            String sql = "SELECT id, title, content, short_description as shortDescription, image_url as imageURL," +
                    "user_id as userID, date_post as datePost, is_published as isPublished " +
                    "FROM news WHERE is_published = 1 ORDER BY date_post DESC LIMIT :limit OFFSET :offset";

            return getJdbi().withHandle(handle ->
                    handle.createQuery(sql)
                            .bind("limit", limit)// số lượng
                            .bind("offset", offset)// vị trí lấy
                            .mapToBean(News.class)
                            .list()
            );
        }
        public List<News> getRecentNews(int limit) {
            String sql = "SELECT  id, title, content, short_description as shortDescription, image_url as imageURL," +
                    "user_id as userID, date_post as datePost, is_published as isPublished " +
                    "FROM news WHERE is_published = 1 ORDER BY date_post DESC LIMIT :limit";

            return getJdbi().withHandle(handle ->
                    handle.createQuery(sql)
                            .bind("limit", limit)
                            .mapToBean(News.class)
                            .list()
            );
        }

    public News getNewsById(int id) {
        String sql = "select * from news where id = :id";

        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("id", id)
                        .map((rs, ctx) -> {
                            News n = new News();
                            n.setId(rs.getInt("id"));
                            n.setTitle(rs.getString("title"));
                            n.setContent(rs.getString("content"));
                            n.setShortDescription(rs.getString("short_description"));
                            n.setImageURL(rs.getString("image_url"));
                            n.setDatePost(rs.getTimestamp("date_post"));
                            n.setUserID(rs.getInt("user_id"));
                            return n;
                        })
                        .findOne()
                        .orElse(null)
        );
    }
}
