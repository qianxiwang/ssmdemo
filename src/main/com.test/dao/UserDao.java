package dao;

import domain.User;

import java.util.List;
import java.util.Map;

public interface UserDao {

    public User findUserById(int id);

    public List<User> findAll();

    public void saveUser(User user);

    public boolean updateUser(User user);

    public boolean deleteUser(int id);

    //显示图表
    public List<Map<String, Object>> queryForList();
}
