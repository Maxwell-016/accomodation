import 'package:accomodation_module/utils/appColors.dart';
import 'package:accomodation_module/view_model/view_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

class CustomTextField extends HookConsumerWidget {
  final String hint;
  final String label;
  final TextEditingController fieldController;
  final Icon icon;
  final Icon? altIcon;
  final FormFieldValidator<String?> validator;
  final double width;
  const CustomTextField(
      {super.key,
      required this.width,
      required this.hint,
      required this.label,
      required this.fieldController,
      required this.icon,
      this.altIcon,
      required this.validator});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool hasAltIcon = altIcon != null;
    final viewModelProvider = ref.watch(viewModel);
    double deviceWidth = MediaQuery.of(context).size.width;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    Logger logger = Logger();
    return SizedBox(
      width: width,
      child: TextFormField(
        controller: fieldController,
        validator: validator,
        obscureText: hasAltIcon ? viewModelProvider.isObscured : false,
        decoration: InputDecoration(
          hintText: hint,
          label: Text(label),
          labelStyle: TextStyle(
            color: isDark? Colors.white : Colors.black
          ),
          prefixIcon: hasAltIcon
              ? IconButton(
                  onPressed: () {
                    viewModelProvider.toggleObscured();
                    logger.d(viewModelProvider.isObscured);
                  },
                  icon: viewModelProvider.isObscured
                      ? icon
                      : altIcon ?? const Icon(Icons.visibility),
                )
              : icon,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                  color: isDark? AppColors.darkTextFieldBorder : AppColors.lightTextFieldBorder, width: 1.0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide:
                  const BorderSide(color: AppColors.mmustBlue, width: 1.0)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.red, width: 2.0)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.red, width: 2.0)),
        ),
      ),
    );
  }
}
