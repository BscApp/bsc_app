import 'package:bsc_app/core/dioServices.dart';
import 'package:bsc_app/features/auth/model/user.dart';

class RemoteAuth {
  final dio=Dioservices.dio;
  Future<User> login(String email,String password) async {
    final response = await dio.post('/auth/user/login',data: {'email':email,'password':password});
    return User.fromJson(response.data);
  }
  Future<User> register(User user) async {
    print(user.phone);
    print(user.toJson());
    final response = await dio.post('/auth/user/register',data: user.toJson());
    return User.fromJson(response.data);
  }
  Future<void>delAccount(String id)async{
   try {
       final res=await dio.delete("/auth/user/del/$id"); 
      return; 
      } catch (e) {
         return;
      }
  }
  Future<User>UpdateUser(User user)async{
    final response = await dio.put('/auth/user/${user.cardId}',data: user.toJson());
    return User.fromJson(response.data);
  }
}
