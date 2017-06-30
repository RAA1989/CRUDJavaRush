package crud.dao;


import crud.model.User;

import java.util.List;

public interface UserDao {
    void addUser(User user);

    void updateuser(User user);

    void removeUser(int id);

    User getUserById(int id);

    List<User> getAllUsersList();

    List<User> searchUsers(String name);

}