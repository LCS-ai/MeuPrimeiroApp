import 'package:firebase_learning/shared/models/abstract_user.dart';
import 'package:firebase_learning/shared/models/user_client.dart';

class UserTrainer extends AbstractUser{
  //Lista de IDs dos clientes
  late List<int> clientIds;

  //Lista dos Clientes
  late List<UserClient> listClient;


}