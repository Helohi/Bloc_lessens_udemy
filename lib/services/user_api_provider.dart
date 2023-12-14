import 'package:bloc_test/model/user.dart';
import 'package:dio/dio.dart';

class UserProvider {
  //https://jsonplaceholder.typicode.com/users
  Future<List<User>> getUsers() async {
    final response =
        await Dio().get('https://jsonplaceholder.typicode.com/users');

    if (response.statusCode == 200) {
      final List<dynamic> userJson = response.data;
      return userJson.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching users');
    }
  }
}
