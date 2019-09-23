package com.aaa.service;

import com.aaa.dao.RoleDao;
import com.aaa.dao.RoleDaoImpl;
import com.aaa.entity.Pager;
import com.aaa.myUtils.PageUtils;

public class RoleServiceImpl implements RoleService{
    RoleDao roleDao=new RoleDaoImpl();

    @Override
    public Pager queryByPages(int pageNo) {
        return roleDao.queryByPages(pageNo, PageUtils.PAGE_SIZE);
    }
}
