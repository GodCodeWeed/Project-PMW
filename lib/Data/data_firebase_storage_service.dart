import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import '../Utility/DependencyInjection/dependencyInjection.dart' as DI;

class FireBaseStorage {
  final _firebaseStorage = DI.locator<FirebaseStorage>();
      // final _firebaseFirestore = DI.locator<FirebaseFirestore>();

  Future<void> getResumeAsync(String email) async {}

  Future<bool> uploadResumeAsync(String email, XFile? image, String? role, String? expirience ) async {
    try{
    var file = File(image!.path);

    if (image != null) {
      var snapshot =
          await _firebaseStorage.ref().child('images/$email').putFile(file);
      var downloadUrl = await snapshot.ref.getDownloadURL();

    // _firebaseFirestore
    //                     .collection("Users")
    //                     .doc(email)
    //                     .set({
    //                   "role": role,
    //                   "expirience": expirience,
    //            // 
    //                 });
    } else {
      return false;
    }

    return true;
    }catch(e)
    {
      return false;
    }
  }

  Future<void> removeResumeAsync(String email) async {}
}
