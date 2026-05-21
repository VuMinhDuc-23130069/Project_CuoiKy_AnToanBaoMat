package vn.edu.nlu.fit.dao;

import vn.edu.nlu.fit.controller.admin.dashboard.ChartData;

import java.util.List;

public class AdminDashboardDAO extends BaseDao{
    public int getCount(String tableName) {
        return getJdbi().withHandle(handle ->
                handle.createQuery("SELECT COUNT(*) FROM " + tableName)
                        .mapTo(Integer.class)
                        .one()
        );
    }

    public List<ChartData> getRevenueLast7Days() {
        String sql = "select date(order_date) as date, sum(total) as revenue " +
                "from orders " +
                "where order_date >= date_sub(now(), interval 7 day) " +
                "group by date(order_date) " +
                "order by date(order_date) asc";

        return getJdbi().withHandle(h ->
                h.createQuery(sql)
                        .map((rs, context) -> {
                            ChartData data = new ChartData();
                            data.date = rs.getString("date");
                            data.revenue = rs.getDouble("revenue");
                            return data;
                        })
                        .list()
        );
    }
}
