package com.aaa.dao;

import com.aaa.entity.Pager;

import java.util.List;
import java.util.Map;

public class RoleDaoImpl extends JDBCUtils implements RoleDao {
    @Override
    public List<Map> queryAll() {
        String sql="select * from t_role";
        List<Map> mapList=executeQuary(sql,null);
        return mapList;
    }

    @Override
    public Pager queryByPages(int pageNo, int pageSize) {
        String sql="select * from t_role limit ?,?";
        Object[]params=new Object[]{(pageNo-1)*pageSize,pageSize};
        List<Map> mapList= executeQuary(sql,params);
        Integer totalCot= Integer.valueOf(queryCount().toString());
        //pager对象里包含：页号  每页的条数  每页的数据集合(sql查出)  总条数
        Pager pager=new Pager(pageNo,pageSize,mapList,totalCot);
        return pager;
    }

    public Long queryCount(){
        String sql="select count(*) cnt from t_role";
        List<Map> mapList=executeQuary(sql,null);
        return (Long) mapList.get(0).get("cnt");
    }
}
