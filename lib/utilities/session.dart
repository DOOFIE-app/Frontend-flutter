import 'dio.dart';

class SessionProvider {
  void loadAllUsers() async {
    final responce = await dio.get('/users');
    print('============> responce == $responce <================');
  }
}
