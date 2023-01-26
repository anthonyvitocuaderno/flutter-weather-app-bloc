import 'dart:async';

import 'package:user_repository/src/models/models.dart';

class UserRepository {
  User? _user;

  Future<User?> getUser() async {
    if (_user != null) return _user;
    return Future.delayed(
      const Duration(milliseconds: 100),
          () => _user = User('John Doe', 'https://github.com/johndoe'),
    );
  }

  Future<void> setUser(String name, String url) async {
    _user = User(name, url);
  }
}
