import 'package:accomodation_module/components/custom_text_field.dart';
import 'package:accomodation_module/components/function_button.dart';
import 'package:accomodation_module/components/make_text_with.dart';
import 'package:accomodation_module/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/appColors.dart';
import '../../utils/strings.dart';

class LoginSmallScreen extends HookConsumerWidget {
  const LoginSmallScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    final formKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    Color blackAndWhite = isDark? Colors.white : Colors.black;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //lock icon
                SizedBox(height: deviceHeight/8.5,),
                const Icon(
                  Icons.lock,
                  size: 50.0,
                  color: AppColors.mmustBlue,
                ),
                SizedBox(height: deviceHeight/8.5,),

                //Text to prompt user for credentials
                const MakeTextWith(text: Strings.loginText, whichFont: "Open Sans", textSize: 20.0),
                SizedBox(height: deviceHeight/16.5,),
                //Card containing the fields,
                Card(
                  color: Colors.black,
                  shadowColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Text field for capturing email
                          CustomTextField(
                            hint: Strings.emailHint,
                            label: Strings.emailLabel,
                            fieldController: emailController,
                            icon: Icon(Icons.email,color: blackAndWhite,),
                            validator: Validators.emailValidator,
                            width: deviceWidth / 1.3,
                          ),
                          SizedBox(height: deviceHeight/16.5,),
                          //Text field for capturing default password
                          CustomTextField(
                            hint: Strings.passHint,
                            label: Strings.passLabel,
                            fieldController: passController,
                            icon: Icon(Icons.visibility_off,color: blackAndWhite,),
                            altIcon: Icon(Icons.visibility,color: blackAndWhite,),
                            validator: Validators.passValidator,
                            width: deviceWidth / 1.3,
                          ),
                          SizedBox(height: deviceHeight/37,),
                          TextButton(
                          onPressed: () {  },
                          child: const MakeTextWith(text: Strings.forgotPass, whichFont: "Roboto", textSize: 17.0,color: AppColors.mmustBlue,fontWeight: FontWeight.bold,),),
                          SizedBox(height: deviceHeight/37,),
                          //Login button
                          FunctionButton(
                            color: AppColors.mmustBlue,
                            text: Strings.login,
                            width: deviceWidth / 1.3,
                            onPressed: () async {},
                            height: 50.0,
                          ),
                          SizedBox(height: deviceHeight/16.5,),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
