package com.aaa.service;

import com.aaa.entity.Pager;

public interface RoleService {
    //根据page的属性（页号，每页的条数）来查 ，获得pager对象（包含了：页号  每页的条数  每页的数据集合(sql查出)  总条数）
    Pager queryByPages(int pageNo);
}
