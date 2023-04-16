package com.example.user_manager.repository;

import com.example.user_manager.model.User;

import java.util.List;

public interface ISUserRepository {
    List<User> findAll();
    List<User> search(String name);
    void save(User user);
    User findById(int id);
    void update(int id,User user);
    void remove(int id);
}
