package com.aaa.dao;

import com.aaa.entity.Pager;

import java.util.List;
import java.util.Map;

public interface RoleDao {
    List<Map> queryAll();
    Pager queryByPages(int pageNo, int pageSize);
}
