import 'package:accomodation_module/utils/strings.dart';

class Validators{
  static String? emailValidator(String? email){
    if(email!.isEmpty){
      return Strings.emptyEmail;
    }
    final regex = RegExp(r'[a-zA-Z]{4}[0-9]{2}-[0-9]{9}@student\.mmust\.ac\.ke');
    if(!regex.hasMatch(email)){
      return Strings.invalidEmail;
    }
    return null;
  }
  static String? passValidator(String? pass){
    if(pass!.isEmpty){
      return Strings.emptyPass;
    }
    if(pass.length < 8){
      return Strings.lessThan8;
    }
    if(pass.length > 15){
      return Strings.moreThan15;
    }
    final hasCaps = RegExp(r'[A-Z]').hasMatch(pass);
    if(!hasCaps){
      return Strings.checkCaps;
    }
    final hasSpecialChar = RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(pass);
    if(!hasSpecialChar){
      return Strings.checkSpecialChar;
    }
    return null;
  }
}