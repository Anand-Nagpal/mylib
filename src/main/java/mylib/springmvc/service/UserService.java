package mylib.springmvc.service;

import mylib.springmvc.model.Login;
import mylib.springmvc.model.User;

public interface UserService {
  
  void register(User user);
  User validateUser(Login login);
}