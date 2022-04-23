import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/bmi.dart';

class GenderButton extends StatelessWidget {
  const GenderButton({
    Key? key,
    required this.size,
    required this.onClick,
    required this.iconGender,
    required this.gender,
  }) : super(key: key);

  final Size size;
  final Function() onClick;
  final Widget iconGender;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        alignment: Alignment.center,
        width: size.width * 0.870 / 2,
        height: size.height / 5,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xff272A4E),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer<BmiProvider>(
              builder: (context, value, _) => IconButton(
                onPressed: onClick,
                icon: iconGender,
              ),
            ),
            Text(
              gender,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
