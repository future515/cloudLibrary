package edu.hebtu.service.impl;

import edu.hebtu.dao.UserMapper;
import edu.hebtu.pojo.User;
import edu.hebtu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public User login(User user) {
        return userMapper.login(user);
    }
}
