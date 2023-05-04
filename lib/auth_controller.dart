import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelveapp/homescreen.dart';
import 'package:travelveapp/login.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();

  late Rx<User?> _user;

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreens);
  }

  _initialScreens(User? user) async {
    if (user == null) {
      print('User is null. Redirecting to LoginScreen');
      await Get.offAll(() => LoginScreen());
    } else {
      print('User is not null. Redirecting to HomeScreen');
      await Get.offAll(() => HomeScreen(email: user.email!,));
    }
  }

  Future<void> register(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _initialScreens(auth.currentUser);
    } catch (e) {
      Get.snackbar("About User", "User message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            'Account creation failed!',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          messageText: Text(
            e.toString(),
            style: TextStyle(
              color: Colors.white,
            ),
          ));
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      _initialScreens(auth.currentUser);
    } catch (e) {
      Get.snackbar("About Login", "Login message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            'Login failed!',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          messageText: Text(
            e.toString(),
            style: TextStyle(
              color: Colors.white,
            ),
          ));
    }
  }
  Future<void> addPayment(String email, double amount) async {
    try {
      CollectionReference payments = FirebaseFirestore.instance.collection('payments');
      await payments.add({
        'email': email,
        'amount': amount,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      Get.snackbar("Payment", "Error adding payment",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            'Payment failed!',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          messageText: Text(
            e.toString(),
            style: TextStyle(
              color: Colors.white,
            ),
          ));
    }
  }
String? getEmail() {
    final user = auth.currentUser;
    return user?.email;
  }

  void logOut()async {
    await auth.signOut();
  }
}
