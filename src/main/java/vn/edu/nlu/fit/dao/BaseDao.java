package vn.edu.nlu.fit.dao;

import com.mysql.cj.jdbc.MysqlDataSource;
import org.jdbi.v3.core.Jdbi;

import java.sql.SQLException;

public abstract class BaseDao {
    private static Jdbi jdbi;

    protected Jdbi getJdbi(){
        if(jdbi==null) makeConnect();
        return jdbi;
    }

    private void makeConnect() {

        MysqlDataSource dataSource= new MysqlDataSource();

        String url= "jdbc:mysql://"+DBProperties.getDbHost()+":"+DBProperties.getDbPort()+"/"+DBProperties.getDbName()+"?"+DBProperties.getDbOption();
        dataSource.setURL(url);

        dataSource.setUser(DBProperties.getUsername());
        dataSource.setPassword(DBProperties.getPassword());
        try{
            dataSource.setUseCompression(true);//nen du lieu tu mysql gui len
            dataSource.setAutoReconnect(true);//tu dong ket noi lai khi bi ngat ket noi voi mySQL

        }catch (SQLException e){
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        jdbi=Jdbi.create(dataSource);
    }



}
