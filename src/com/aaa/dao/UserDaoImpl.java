package com.aaa.dao;

import com.aaa.entity.Pager;
import com.aaa.entity.User;

import java.util.List;
import java.util.Map;

public class UserDaoImpl extends JDBCUtils implements UserDao {
    @Override
    public int addUser(User user) {
        String sql="insert into t_user(username, password, workno, phone, sex, birth) values (?,?,?,?,?,?)";
        Object [] params=new Object[]{user.getName(),user.getPwd(),user.getWorkno(),user.getPhone(),user.getSex(),user.getBrith()};
        return executeUpdate(sql,params);
     }

    @Override
    public Map checkUser(User info) {
        /*Connection conn;
        try {
            conn=getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }*/
        String sql="select * from t_user where username=? and password=?";
        Object[] params=new Object[]{info.getName(),info.getPwd()};
        List<Map> mapList=executeQuary(sql,params);
        //System.out.println(mapList.size()>0?mapList.get(0):null);
        //System.out.println("执行checkLogin");
        return mapList.size()>0?mapList.get(0):null;
    }

    @Override
    public Map queryById(int id) {
        String sql="select * from t_user where id=?";
        Object[] params=new Object[]{id};
        List<Map> mapList=executeQuary(sql,params);
        return mapList.size()>0?mapList.get(0):null;
    }

    @Override
    public List<Map> queryAll() {
        String sql="select id,username,password,workno,phone,sex,birth from t_user";
        List<Map> mapList=executeQuary(sql,null);
        return mapList;
    }

    @Override
    public int deleteUser(int id) {
        String sql="delete from t_user where id=?";
        Object[] params=new Object[]{id};
        return executeUpdate(sql,params);
    }

    @Override
    public int updateUser(User user) {
        String sql="update t_user set username=?,workno=?,phone=?,sex=?,birth=? where id=?";
        Object[] params=new Object[]{user.getName(),user.getWorkno(),user.getPhone(),user.getSex(),user.getBrith(),user.getId()};
        return executeUpdate(sql,params);
    }

    /**
     * 从数据库获取一页数据 和总条数
     * @param pageNo
     * @param pageSize
     * @return
     */
    @Override
    public Pager queryByPages(int pageNo, int pageSize) {
        String sql="select * from t_user limit ?,?";
        Object[]params=new Object[]{(pageNo-1)*pageSize,pageSize};
        List<Map> mapList= executeQuary(sql,params);
        Integer totalCot= Integer.valueOf(queryCount().toString());
        //pager对象里包含：页号  每页的条数  每页的数据集合(sql查出)  总条数
        Pager pager=new Pager(pageNo,pageSize,mapList,totalCot);
        return pager;
    }
    public Long queryCount(){
        String sql="select count(*) cnt from t_user";
        List<Map> mapList=executeQuary(sql,null);
        return (Long) mapList.get(0).get("cnt");
    }

}
