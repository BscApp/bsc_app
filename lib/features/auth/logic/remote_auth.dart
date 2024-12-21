import 'package:bsc_app/core/dioServices.dart';
import 'package:bsc_app/features/auth/model/user.dart';

class RemoteAuth {
  final dio=Dioservices.dio;
  Future<User> login(String email,String password) async {
    final response = await dio.post('/auth/user/login',data: {'email':email,'password':password});
    print(response.data);
    return User.fromJson(response.data);
  }
  Future<User> register(User user) async {
    final response = await dio.post('/auth/user/register',data: user.toJson());
    return User.fromJson(response.data);
  }
}
