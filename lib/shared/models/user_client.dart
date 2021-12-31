import 'package:firebase_learning/shared/models/abstract_user.dart';
import 'package:firebase_learning/shared/models/training_block.dart';

class UserClient extends AbstractUser{
  late String uniqueCodeClient;
  late List<TrainingBlock> listTrainingBlock;
}