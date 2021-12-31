import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_learning/pages/learning_firebase.dart';
import 'package:firebase_learning/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:ntp/ntp.dart';



void main() async {
  /*WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  Person p = Person(name: 'Lucax', age: '20', phone: '99999-5558');
  p.setPerson();

*/

  /*

  FirebaseFirestore.instance.collection('TestTime').doc('segundo').set({'name': 'test',
    'iconURL': 'https://picsum.photos/250?image=9',
    'createdAt': FieldValue.serverTimestamp(),
    'updatedAt': FieldValue.serverTimestamp(),}).then((value) => print('gravado com sucesso!')).catchError((onError)=>print('Deu erro $onError'));

*/
 // FirebaseFirestore.instance.collection('TestTime').get().then((value) => value.docs.forEach((element) {print(element.data());}));








  //db.collection('created').doc('some-id').set({'testando' : 'testes'}).then((value) => print('gravado com sucesso')).catchError((onError)=>print('Deu erro $onError'));



  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Aprendendo login e BD',
      //home: LearnFirebase(),



      home: LoginPage(),
      debugShowCheckedModeBanner: false,);
  }
}

