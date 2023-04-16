package com.example.user_manager.server;

import com.example.user_manager.model.User;

import java.util.List;

public interface UserServer {
    List<User> findAll();
    List<User> search(String name);
    void save(User user);
    User findById(int id);
    void update(int id,User user);
    void remove(int id);
}
