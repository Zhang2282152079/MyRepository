import com.aaa.dao.JDBCUtils;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class Test1 {
    public static void main(String[] args) {
        JDBCUtils jdbcUtils=new JDBCUtils();
        try {
            Connection coon =jdbcUtils.getConnection();


            String sql="select * from t_user where username=? and password=?;";
            Object[] params={"王菲","0121"};
            List<Map> mapList=jdbcUtils.executeQuary(sql,params);
            for (Map map : mapList) {
                System.out.println(map);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
