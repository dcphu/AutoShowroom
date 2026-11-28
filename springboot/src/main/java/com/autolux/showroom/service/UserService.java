package com.autolux.showroom.service;

import com.autolux.showroom.entity.User;
import com.autolux.showroom.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UserService {

    private final UserRepository userRepository;

    @Autowired
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public Optional<User> findByUsername(String username) {
        if (username == null) return Optional.empty();
        return userRepository.findByUsername(username.trim());
    }

    public boolean checkLogin(String username, String rawPassword) {
        if (username == null || rawPassword == null) return false;
        Optional<User> opt = userRepository.findByUsername(username.trim());
        if (opt.isPresent()) {
            User user = opt.get();
            return "ACTIVE".equalsIgnoreCase(user.getStatus()) && rawPassword.trim().equals(user.getPassword());
        }
        return false;
    }

    public User save(User user) {
        return userRepository.save(user);
    }

    public long count() {
        return userRepository.count();
    }
}
