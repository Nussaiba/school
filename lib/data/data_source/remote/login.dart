import 'package:school/api_link.dart';
import 'package:school/core/class/crud.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);

  postdata(String email, String password) async {
    var response = await crud.postData(AppLink.login, {
      "email": email,
      "password": password,
    });
    print(AppLink.login);
    print(   "email: $email");
    print( "password: $password");
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }
}
