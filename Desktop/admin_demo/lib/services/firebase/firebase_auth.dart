import 'package:firedart/auth/user_gateway.dart';
import 'package:firedart/firedart.dart';

class AuthService {
  static Future<void> signInByEmail(String email, String password,
      Function(Object e) onException, Function(User? user) onUser) async {
    User? user;
    try {
      user = await FirebaseAuth.instance.signIn(email, password);
    } catch (e) {
      onException(e);
    }

    onUser(user);
  }

  static void signOut() {
    FirebaseAuth.instance.signOut();
  }
}
