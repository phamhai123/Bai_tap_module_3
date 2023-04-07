package com.example.zz1_list_customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private static List<Customer> customerList;
    static {
        customerList = new ArrayList<>();
        customerList.add(new Customer("Mai Văn Hoàn","1983-08-20","Hà Nội","conan.jfif"));
        customerList.add(new Customer("Nguyễn Văn Nam","1983-08-21","Bắc Giang","nhanvata.jfif"));
        customerList.add(new Customer("Nguyễn Thái Hòa","1983-08-22","Nam Dịnh","nhanvatb.jfif"));
        customerList.add(new Customer("Trần Đăng Khoa","1983-08-17","Hà Tây","nhanvatc.jfif"));
        customerList.add(new Customer("Nguyễn Đình Thi","1983-08-19","Hà Nội","nhanvatd.jpg"));
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customerList",customerList);
        request.getRequestDispatcher("customer.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.setAttribute("customerList",customerList);
//        request.getRequestDispatcher("index.jsp");
    }
}
