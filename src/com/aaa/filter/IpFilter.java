package com.aaa.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName = "IpFilter",urlPatterns = "/*")
public class IpFilter implements Filter {
    public IpFilter() {
        System.out.println("过滤器使用构造函数构建对象");
    }

    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletResponse response= (HttpServletResponse) resp;
        /**
         * 获取请求的ip地址，浏览器请求的ip，这个ip是服务器的？？？
         */
        String ip=req.getRemoteAddr();
        if (ip.contains("192.")){
            response.sendError(HttpServletResponse.SC_NOT_FOUND,"禁止访问此ip");
        }else {
            chain.doFilter(req, resp);
        }

    }

    public void init(FilterConfig config) throws ServletException {

    }

}
