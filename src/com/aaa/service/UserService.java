package com.aaa.service;

import com.aaa.dao.UserDao;
import com.aaa.dao.UserDaoImpl;
import com.aaa.entity.Message;
import com.aaa.entity.Pager;
import com.aaa.entity.User;

import java.util.Map;

public interface UserService {


    Map checkUser(User info);
    int addUser(User user);
    Map queryById(int id);
    int deleteUser(int id);
    int updateUser(User user);
    Message updateAndAdd(User user);

//根据page的属性（页号，每页的条数）来查 ，获得pager对象（包含了：页号  每页的条数  每页的数据集合(sql查出)  总条数）
    Pager queryByPages(int pageNo);

}
