import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

import '../Utility/DependencyInjection/dependencyInjection.dart' as DI;
class FireBaseAuthentication
{
  var _firebaseAuth = DI.locator<FirebaseAuth>();

  Future<User?> getCurrentUserAsync()
 async {
    final User? user = await _firebaseAuth.currentUser;
    
    if(user != null)
    {
     return user;
    }

    return null;
  }

  Future<User?> signUpAsync(String email, String password)
  async {
 final User? user = (await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password)).user;
  
  if(user != null)
  {
    return user;
  }
return null;
  }

  Future<User?> loginAsync(String email, String password) async {
    final User? user = (await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password)
    ).user;

    if (user != null) {
      return user;
    }
    return null;
  }

}