package com.aaa.entity;


import java.sql.Date;

public class User {
    private Integer id;
    private String name;
    private String pwd;
    private String workno;
    private String phone;
    private String sex;
    private Date brith;

    public User(String name, String pwd, String workno, String phone, String sex, Date brith) {
        this.name = name;
        this.pwd = pwd;
        this.workno = workno;
        this.phone = phone;
        this.sex = sex;
        this.brith = brith;
    }


    public User(String name, String pwd) {
        this.name = name;
        this.pwd = pwd;
    }

    public User() {
    }

    public User(String name, String pwd, Date brith) {
        this.name = name;
        this.pwd = pwd;
        this.brith = brith;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public Date getBrith() {
        return brith;
    }

    public void setBrith(Date brith) {
        this.brith = brith;
    }

    public String getWorkno() {
        return workno;
    }

    public void setWorkno(String workno) {
        this.workno = workno;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User(Integer id, String name, String pwd, String workno, String phone, String sex, Date brith) {
        this.id = id;
        this.name = name;
        this.pwd = pwd;
        this.workno = workno;
        this.phone = phone;
        this.sex = sex;
        this.brith = brith;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", pwd='" + pwd + '\'' +
                ", workno='" + workno + '\'' +
                ", phone='" + phone + '\'' +
                ", sex='" + sex + '\'' +
                ", brith=" + brith +
                '}';
    }
}
