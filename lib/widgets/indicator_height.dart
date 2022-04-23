import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/bmi.dart';

class HeightIndicator extends StatelessWidget {
  const HeightIndicator({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height / 5,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xff272A4E),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Consumer<BmiProvider>(
        builder: (context, value, _) => Column(
          children: [
            const Text(
              'Height',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              '${value.height.round()}cm',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Slider(
              value: value.height,
              min: 0,
              max: 200,
              onChanged: (newValue) {
                value.setHeight(newValue);
              },
            ),
          ],
        ),
      ),
    );
  }
}
