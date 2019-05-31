package service;

import dao.UserDao;
import domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    public User findUserById(int id) {
        return userDao.findUserById(id);
    }

    public List<User> findAll() {
        return userDao.findAll();
    }

    public void saveUser(User user) {
        userDao.saveUser(user);
    }

    public boolean updateUser(User user) {
        return userDao.updateUser(user);
    }

    public boolean deleteUser(int id) {
        return userDao.deleteUser(id);
    }


    public List<Map<String, Object>> queryForList() {
        return userDao.queryForList();
    }


}
