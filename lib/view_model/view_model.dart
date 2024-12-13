import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final viewModel = ChangeNotifierProvider.autoDispose<ViewModel>((ref) => ViewModel());
class ViewModel extends ChangeNotifier{
  bool isObscured = true;

  void toggleObscured(){
    isObscured = !isObscured;
    notifyListeners();
  }
}