import 'package:flutter/material.dart';

class CustomColors{
  final Color _activePrimaryButton = const Color.fromARGB(255, 112, 131, 220);
  final Color _activeSecudaryButton = const Color.fromARGB(255, 128, 94, 149);
  final Color _activeConfirmButton = const Color.fromARGB(255, 94, 149, 108);
  final Color _gradienteMainColor = Colors.blueAccent;
  final Color _gradientSecColor = const Color.fromARGB(255, 62, 99, 149);


  Color getActivePrimaryColor(){
    return _activePrimaryButton;
  }

  Color getActiveSecundaryColor(){
    return _activeSecudaryButton;
  }

  Color getGradienteMainColor(){
    return _gradienteMainColor;
  }

  Color getGradienteSecColor(){
    return _gradientSecColor;
  }

  Color getActiveConfirmButton(){
    return _activeConfirmButton;
  }

}