import 'package:firebase_learning/shared/models/abstract_user.dart';
import 'package:firebase_learning/shared/models/user_trainer.dart';

class UserAdm extends AbstractUser{
  late String gyName;
  late String gyLogoImg;
  late List<int> listTrainerIds;
  late List<UserTrainer> listUserTrainer;
}