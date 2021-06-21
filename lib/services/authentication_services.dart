import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.idTokenChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
    // LoginScreen()), (Route<dynamic> route) => false);
  }
  
  Future<String> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      print("Berhasil Login");            
      return "Berhasil Login";
    } on FirebaseAuthException catch (e) {
      print(e.message);      
      return e.message;
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential auth = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      User user = auth.user;
      return user;
    } on FirebaseAuthException catch(e){
      print(e.message);
      return null;
    }
  }

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential auth = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      User user = auth.user;      
      return user;
    } on FirebaseAuthException catch(e){
      print(e.message);
      return null;
    }
  }  

}