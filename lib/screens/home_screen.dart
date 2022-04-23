import 'package:flutter/material.dart';

import '../widgets/gender_button.dart';
import '../widgets/indicator_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: size.width,
                    height: size.height / 4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GenderButton(
                          gender: 'MALE',
                          size: size,
                          iconGender: Icons.male,
                          onClick: () {},
                        ),
                        GenderButton(
                          gender: 'FEMALE',
                          size: size,
                          iconGender: Icons.female,
                          onClick: () {},
                        ),
                      ],
                    ),
                  ),
                  HeightIndicator(size: size),
                  SizedBox(
                    width: size.width,
                    height: size.height / 3.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IndicatorButton(
                          size: size,
                          indicator: 'WEIGHT',
                          value: 0,
                          addButton: () {},
                          minusButton: () {},
                        ),
                        IndicatorButton(
                          size: size,
                          indicator: 'AGE',
                          value: 0,
                          addButton: () {},
                          minusButton: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 45,
            color: Theme.of(context).colorScheme.primary,
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Calculate your BMI',
                style: TextStyle(
                  color: Theme.of(context).textTheme.titleMedium?.color,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HeightIndicator extends StatelessWidget {
  HeightIndicator({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;
  double value = 100;

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
      child: Column(
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
            '${value.round()}cm',
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Slider(
            value: value,
            min: 0,
            max: 200,
            onChanged: (newWalue) {},
          ),
        ],
      ),
    );
  }
}
