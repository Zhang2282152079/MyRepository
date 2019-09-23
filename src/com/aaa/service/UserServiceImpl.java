/**
 * service层，对一系列dao层方法的调用
 */



package com.aaa.service;

import com.aaa.dao.UserDao;
import com.aaa.dao.UserDaoImpl;
import com.aaa.entity.Message;
import com.aaa.entity.Pager;
import com.aaa.entity.User;
import com.aaa.myUtils.PageUtils;

import java.util.Map;

public class UserServiceImpl implements UserService {
    //实例化userdao作为service的属性
    UserDao userDao=new UserDaoImpl();

    //登录前(注册前)检验用户是否存在
    @Override
    public Map checkUser(User info) {
        return userDao.checkUser(info);
    }

    @Override
    public int addUser(User user) {
        if (userDao.checkUser(user)!=null){
            throw new RuntimeException("用户已存在");
        }else {
            return userDao.addUser(user);
        }
    }

    @Override
    public Map queryById(int id) {
        return userDao.queryById(id);
    }

    @Override
    public int deleteUser(int id) {
        return userDao.deleteUser(id);
    }

    @Override
    public int updateUser(User user) {

        return userDao.updateUser(user);
    }



    @Override
    public Pager queryByPages(int pageNo) {

        return userDao.queryByPages(pageNo,PageUtils.PAGE_SIZE);
    }

    @Override
    public Message updateAndAdd(User user) {
        Message message=new Message();
        int a=-1;
        System.out.println(user.getId());
        if (user.getId()==null||user.getId()==0){
            System.out.println("没有id，进入注册操作");
            a=userDao.addUser(user);
            if (a>0){
                message=new Message(200,"注册成功");
            }else {
                message=new Message(300,"注册失败");
            }
        }else {
            System.out.println("有id，进行修改操作");
            a=userDao.updateUser(user);
            if (a>0){
                message=new Message(201,"修改成功");
            }else {
                message=new Message(301,"修改失败");
            }
        }
        return message;
    }

}
