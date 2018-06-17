package mylib.springmvc.dao;

import mylib.springmvc.model.Login;
import mylib.springmvc.model.User;

public interface UserDao {
  void register(User user);
  User validateUser(Login login);
}