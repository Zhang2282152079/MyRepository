package com.aaa.servlet;

import com.aaa.entity.Pager;
import com.aaa.service.UserService;
import com.aaa.service.UserServiceImpl;
import com.alibaba.fastjson.JSON;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet(name = "UserListServlet2",urlPatterns = {"/ulistSer2"})
public class UserListServlet2 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        /*UserDao userDao=new UserDaoImpl();
        List<Map> mapList=userDao.queryAll();

        //将数据存入到request对象中
        request.setAttribute("maplist",mapList);
        //服务器端转发
        request.getRequestDispatcher("admin/user_list.jsp").forward(request,response);
*/
        request.setCharacterEncoding("utf-8");
        String pageNo= request.getParameter("pageNo"); //可以从地址栏获取
        if (pageNo==null){
            pageNo="1";
        }
        UserService userService=new UserServiceImpl();
        //根据page的属性（页号，每页的条数）来查 ，获得pager对象（包含了：页号  每页的条数  每页的数据集合(sql查出)  总条数）
        //每访问一次servlet就生成一个新的pager对象
        //然后jsp页面通过request.getAttribute("pager")获得pager对象，获得pager对象中的查询的集合数据，然后显示再页面上
        Pager pager = userService.queryByPages(Integer.parseInt(pageNo));

        /*request.setAttribute("pager",pager);
        request.getRequestDispatcher("admin/user_list.jsp").forward(request,response);*/

//不再request.setAttribute，而是输出json字符串

        //将Java转换成json格式的字符串
        String str= JSON.toJSONStringWithDateFormat(pager,"yyyy-MM-dd");
        PrintWriter writer=response.getWriter();
        writer.print(str);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
