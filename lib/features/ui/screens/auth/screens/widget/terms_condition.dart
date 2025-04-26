import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CheckBoxRow extends StatefulWidget {
  const CheckBoxRow({super.key, this.text});
final String? text;
  @override
  State<CheckBoxRow> createState() => _CheckBoxRowState();
}

class _CheckBoxRowState extends State<CheckBoxRow> {
  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final textSize = screenWidth * 0.03; // approx 12 for medium screen
    final checkboxSize = screenWidth * 0.04; // approx 16 for medium screen

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: checkboxSize,
          height: checkboxSize,
          child: Checkbox(
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value!;
              });
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            side: BorderSide(color: Colors.deepPurple),
            checkColor: Colors.white,
            activeColor: Colors.deepPurple,
            visualDensity: VisualDensity.compact,
          ),
        ),
        SizedBox(width: screenWidth * 0.02),
        Expanded(
          child: Text(
            //text??'By Signing up, you agree to the terms and conditions.',

            widget.text ?? 'By Signing up, you agree to the terms and conditions.',
            softWrap: true,
            overflow: TextOverflow.visible,

            style: GoogleFonts.poppins(
              fontSize: textSize,
              fontWeight: FontWeight.w400,
              color: Colors.grey[800],
            ),
          ),
        ),
      ],
    );
  }
}
