import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class MakeTextWith extends StatelessWidget {
  final String text;
  final String whichFont;
  final double textSize;
  final FontWeight? fontWeight;
  final Color? color;
  const MakeTextWith(
      {super.key,
      required this.text,
      required this.whichFont,
      required this.textSize,
      this.fontWeight,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.getFont(
        whichFont,
        fontSize: textSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
