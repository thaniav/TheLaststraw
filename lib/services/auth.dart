import 'package:firebase_auth/firebase_auth.dart';
import 'package:palet/models/user.dart';
import 'package:palet/services/database.dart';
class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserID _userFromFirebaseUser(FirebaseUser user){
    return user != null ? UserID(user.uid): null;
  }

  Stream <UserID> get user{
    return _auth.onAuthStateChanged
        .map((FirebaseUser user)=> _userFromFirebaseUser(user));
  }
  //learn what future is
//  Future signInAnon() async{
//    try{
//      AuthResult result = await _auth.signInAnonymously();
//      FirebaseUser user=result.user;
//      return _userFromFirebaseUser(user);
//
//    }
//    catch(e){
//      print(e.toString());
//      return null;
//
//
//
//    }
//  }


  Future signInWithEmailAndPassword(String email, String password) async{

    try{
      AuthResult result= await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);

    }
    catch(e){
      print(e.toString());
      return null;

    }
  }

 Future registerWithEmailAndPassword(String email, String password) async{

    try{
      AuthResult result= await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      await DatabaseService(uid: user.uid).updateUserData(null,null,null,null);
      return _userFromFirebaseUser(user);

    }
    catch(e){
      print(e.toString());
      return null;

    }
 }

 Future signOut() async{
    try {
      return await _auth.signOut();

    }
    catch(e){
      print(e.toString());
      return null;
    }

 }


}



