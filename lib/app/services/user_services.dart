import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pinext/app/models/pinext_user_model.dart';
import 'package:pinext/app/services/firebase_services.dart';

class UserServices {
  UserServices._internal();
  static final UserServices _userServices = UserServices._internal();
  factory UserServices() => _userServices;

  late PinextUserModel currentUser;
  Future<PinextUserModel> getCurrentUser() async {
    DocumentSnapshot userSnapshot = await FirebaseServices()
        .firebaseFirestore
        .collection("pinext_users")
        .doc(FirebaseServices().getUserId())
        .get();
    currentUser =
        PinextUserModel.fromMap(userSnapshot.data() as Map<String, dynamic>);
    log(currentUser.toString());
    return currentUser;
  }
}
