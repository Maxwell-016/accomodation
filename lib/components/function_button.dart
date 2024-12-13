import 'package:accomodation_module/components/make_text_with.dart';
import 'package:flutter/material.dart';


class FunctionButton extends StatelessWidget {
  final Color color;
  final String text;
  final Icon? icon;
  final double width;
  final double height;
  final Future Function() onPressed;
  const FunctionButton(
      {super.key,
      required this.color,
      required this.text,
      this.icon,
      required this.width,
      required this.onPressed, required this.height});

  @override
  Widget build(BuildContext context) {
    bool hasIcon = icon != null;
    return SizedBox(
      width: width,
      height: height,
      child: MaterialButton(
        color: color,
        onPressed: onPressed,
        child: hasIcon
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  icon ??
                      const Icon(
                        Icons.hourglass_empty,
                        color: Colors.transparent,
                      ),
                  MakeTextWith(text: text, whichFont: "Open Sans", textSize: 17.0),
                ],
              )
            : MakeTextWith(text: text, whichFont: "Open Sans", textSize: 17.0),
      ),
    );
  }
}
