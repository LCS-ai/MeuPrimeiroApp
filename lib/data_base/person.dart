import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

class Person {
  late String name;
  late String age;
  late String phone;

  Person({required this.name, required this.age, required this.phone});

  void setPerson() async {

    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    FirebaseFirestore.instance.collection('contact').doc().set({
      'name': this.name,
      'age': this.age,
      'phone': this.phone,
    });
  }
}
