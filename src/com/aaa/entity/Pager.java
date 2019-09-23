package com.aaa.entity;

import java.util.List;

public class Pager {

    private Integer pageNo;
    private Integer pageSize;
    //页
    private Integer first;
    private Integer last;
    private Integer prev;
    private Integer next;
    //总页数
    private Integer pages;
    //当前页显示的数据集合
    private List data;
    //总条数
    private Integer totalCount;

    public Pager() {
    }

    public Pager(Integer pageNo, Integer pageSize, List data, Integer totalCount) {
        this.pageNo = pageNo;
        this.pageSize = pageSize;
        this.data = data;
        this.totalCount = totalCount;

        pages=totalCount%pageSize==0?totalCount/pageSize:totalCount/pageSize+1;

        next=pageNo+1;
        if (next>pages) next=pages;

        prev=pageNo-1;
        if (prev<1)prev=1;

        last=pages;
    }

    public Integer getPageNo() {
        return pageNo;
    }

    public void setPageNo(Integer pageNo) {
        this.pageNo = pageNo;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getFirst() {
        return first;
    }

    public void setFirst(Integer first) {
        this.first = first;
    }

    public Integer getLast() {
        return last;
    }

    public void setLast(Integer last) {
        this.last = last;
    }

    public Integer getPrev() {
        return prev;
    }

    public void setPrev(Integer prev) {
        this.prev = prev;
    }

    public Integer getNext() {
        return next;
    }

    public void setNext(Integer next) {
        this.next = next;
    }

    public Integer getPages() {
        return totalCount%pageSize==0?totalCount/pageSize:totalCount/pageSize+1;
    }

    public void setPages(Integer pages) {
        this.pages = pages;
    }

    public List getData() {
        return data;
    }

    public void setData(List data) {
        this.data = data;
    }

    public Integer getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(Integer totalCount) {
        this.totalCount = totalCount;
    }

    @Override
    public String toString() {
        return "{" +
                "pageNo=" + pageNo +
                ", pageSize=" + pageSize +
                ", first=" + first +
                ", last=" + last +
                ", prev=" + prev +
                ", next=" + next +
                ", pages=" + pages +
                ", data=" + data +
                ", totalCount=" + totalCount +
                '}';
    }
}
