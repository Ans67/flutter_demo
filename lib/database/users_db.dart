import 'package:flutter_application/models/user.dart';

class UsersDB {
  static List<User> _users = [
    User()
      ..firstName = 'test'
      ..lastName = 'test'
      ..userName = 'test'
      ..password = 'test',
  ];

  static User authUser;

  static void add(User user) {
    _users.add(user);
  }

  static bool isAuthenticated(LoginUser loginUser) {
    var userExist = _users.firstWhere(
      (element) =>
          element.userName == loginUser.userName &&
          element.password == loginUser.password,
      orElse: () => null,
    );

    authUser = userExist;

    return userExist != null;
  }
}
