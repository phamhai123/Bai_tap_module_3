package com.example.user_manager.controller;

import com.example.user_manager.model.User;
import com.example.user_manager.server.UserServer;
import com.example.user_manager.server.UserServerImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserServlet", value = {"/users",""})
public class UserServlet extends HttpServlet {
    UserServer userServer = new UserServerImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "create":
                showCreateUser(request,response);
                break;
            case "update":
                showUpdateUser(request,response);
                break;
            case "delete":
                break;
            case "search":
                searchUserName(request,response);
                break;
            default:
                listUser(request,response);
                break;
        }
    }
    public void listUser(HttpServletRequest request, HttpServletResponse response){
        List<User> users = this.userServer.findAll();
        request.setAttribute("users",users);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/user/list.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
    public void searchUserName(HttpServletRequest request, HttpServletResponse response){
        String name = request.getParameter("name");
        List<User> users = this.userServer.search(name);
        request.setAttribute("users",users);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/user/list.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
    public void showCreateUser(HttpServletRequest request, HttpServletResponse response){
        RequestDispatcher dispatcher = request.getRequestDispatcher("/user/create.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
    public void showUpdateUser(HttpServletRequest request, HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        User user = this.userServer.findById(id);
        request.setAttribute("user",user);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/user/update.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "create":
                createUser(request,response);
                break;
            case "update":
                updateUser(request,response);
                break;
            case "delete":
                deleteUser(request,response);
                break;
            default:
//                listUser(request,response);
                break;
        }
    }
    public void createUser(HttpServletRequest request, HttpServletResponse response){
        int id = 0;
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        User user = new User(id,name,birthday,email,address);
        this.userServer.save(user);
        try {
            response.sendRedirect("/users");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    public void updateUser(HttpServletRequest request, HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        User user = new User(id,name,birthday,email,address);
        this.userServer.update(id,user);
        try {
            response.sendRedirect("/users");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public void deleteUser(HttpServletRequest request, HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        this.userServer.remove(id);
        try {
            response.sendRedirect("/users");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
