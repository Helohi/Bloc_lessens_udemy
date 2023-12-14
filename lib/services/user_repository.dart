import 'package:bloc_test/model/user.dart';
import 'package:bloc_test/services/user_api_provider.dart';

class UserRepository {
  final UserProvider _userProvider = UserProvider();

  Future<List<User>> getAllUsers() => _userProvider.getUsers();
}
