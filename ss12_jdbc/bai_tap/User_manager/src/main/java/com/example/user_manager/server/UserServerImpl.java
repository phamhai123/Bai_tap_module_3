package com.example.user_manager.server;

import com.example.user_manager.model.User;
import com.example.user_manager.repository.ISUserRepository;
import com.example.user_manager.repository.ISUserRepositoryImpl;

import java.util.List;

public class UserServerImpl implements UserServer {
    ISUserRepository userRepository = new ISUserRepositoryImpl();
    @Override
    public List<User> findAll() {
        return userRepository.findAll();
    }

    @Override
    public List<User> search(String name) {
        return userRepository.search(name);
    }

    @Override
    public void save(User user) {
        userRepository.save(user);
    }

    @Override
    public User findById(int id) {
        return userRepository.findById(id);
    }

    @Override
    public void update(int id, User user) {
        userRepository.update(id,user);
    }

    @Override
    public void remove(int id) {
        userRepository.remove(id);
    }
}
