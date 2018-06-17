package mylib.springmvc.service;

import mylib.springmvc.model.Login;
import mylib.springmvc.model.User;

public interface UserServiceImpl implements UserService {
  
  void register(User user){
  }
  
  User validateUser(Login login){
	  return null;
  }
}