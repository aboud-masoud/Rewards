import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:rewards_app/utils/app_constants.dart';
import 'package:rewards_app/utils/global_value.dart';

enum PageLoading { none, loading }

enum DeleteLoading { none, loading }

class ProfileBloc {
  final CollectionReference profile = FirebaseFirestore.instance.collection('profiles');
  ValueNotifier<PageLoading> reloadImageView = ValueNotifier<PageLoading>(PageLoading.none);
  final ImagePicker picker = ImagePicker();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  ValueNotifier<DeleteLoading> deleteAccountStatus = ValueNotifier<DeleteLoading>(DeleteLoading.none);

  Future<void> uploadFile(
    File filePath,
  ) async {
    try {
      try {
        deleteFile();
      } catch (e) {
        print("Image not Exsist");
      }

      await FirebaseStorage.instance.ref().child('images/$userEmail').putFile(filePath);
    } catch (e) {
      print(e);
    }
  }

  Future<String> getDownloadURL() async {
    try {
      return await FirebaseStorage.instance.ref().child('images/$userEmail').getDownloadURL();
    } catch (e) {
      return "";
    }
  }

  Future<void> deleteFile() async {
    try {
      await FirebaseStorage.instance.ref().child('images/$userEmail').delete();
    } catch (e) {
      print(e);
    }
  }

  Future deleteUser() async {
    const storage = FlutterSecureStorage();
    String pass = await storage.read(key: AppConstants.biometricP) ?? "";
    final User? user;
    try {
      user = (await _auth.signInWithEmailAndPassword(
        email: userEmail,
        password: pass,
      ))
          .user;

      if (user != null) {
        deleteAccountStatus.value = DeleteLoading.loading;
        user.delete();
        await profile.doc(userEmail).delete();
        await storage.deleteAll();

        return true;
      } else {
        return false;
      }
    } catch (error) {
      print("--" + error.toString());
      return false;
    }
  }

  // Future<String> uploadFile(File image) async {
  //   // Reference storageReference = FirebaseStorage.instance.ref().child('profile/${image.path}');
  //   // UploadTask uploadTask = storageReference.putFile(image);
  //   // String returnURL = "";
  //   // await uploadTask.whenComplete(() async {
  //   //   print('File Uploaded');
  //   //   await storageReference.getDownloadURL().then((fileURL) {
  //   //     returnURL = fileURL;
  //   //   });
  //   // });

  //   return returnURL;
  // }

  // String downloadURLExample() {
  //   String downloadURL = "";
  //   FirebaseStorage.instance.ref('users/123/avatar.jpg').getDownloadURL().then((value) {
  //     return downloadURL;
  //   });
  //   return downloadURL;
  // }
}
