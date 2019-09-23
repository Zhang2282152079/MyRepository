package com.aaa.dao;

import com.aaa.entity.Pager;
import com.aaa.entity.User;

import java.util.List;
import java.util.Map;

public interface UserDao {
    int addUser(User user);
    Map checkUser(User info);
    Map queryById(int id);
    List<Map> queryAll();
    int deleteUser(int id);
    int updateUser(User user);

    Pager queryByPages(int pageNo, int pageSize);
}
