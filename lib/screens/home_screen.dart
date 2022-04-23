import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/gender_button.dart';
import '../widgets/indicator_button.dart';
import '../widgets/indicator_height.dart';
import '../providers/bmi.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bmi = Provider.of<BmiProvider>(context);
    bool gender = bmi.gender;

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
                    child: Consumer<BmiProvider>(
                      builder: (context, value, _) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GenderButton(
                            gender: 'MALE',
                            size: size,
                            iconGender: Icon(
                              Icons.male,
                              color: gender ? Colors.purple : Colors.white,
                              size: 60.0,
                            ),
                            onClick: () {
                              value.chooseGender();
                            },
                          ),
                          GenderButton(
                            gender: 'FEMALE',
                            size: size,
                            iconGender: Icon(
                              Icons.female,
                              color: gender ? Colors.white : Colors.purple,
                              size: 60.0,
                            ),
                            onClick: () {
                              value.chooseGender();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  HeightIndicator(size: size),
                  SizedBox(
                    width: size.width,
                    height: size.height / 3.5,
                    child: Consumer<BmiProvider>(
                      builder: (context, value, _) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IndicatorButton(
                            size: size,
                            indicator: 'WEIGHT (Kg)',
                            value: value.weight,
                            addButton: () {
                              value.addWeight();
                            },
                            minusButton: () {
                              value.minusWeight();
                            },
                          ),
                          IndicatorButton(
                            size: size,
                            indicator: 'AGE',
                            value: value.age,
                            addButton: () {
                              value.addAge();
                            },
                            minusButton: () {
                              value.minusAge();
                            },
                          ),
                        ],
                      ),
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
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Consumer<BmiProvider>(
                        builder: (context, value, _) => Container(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Your BMI: ${value.calculateBmi.toStringAsFixed(1)}",
                                style: const TextStyle(
                                  fontSize: 24.0,
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                'Your category: ${value.categoryBmi}',
                                style: const TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                              const Divider(),
                              Text('Your age: ${value.age}'),
                              const Divider(),
                              Text(
                                'Your gender: ${value.gender ? 'Male' : 'Female'}',
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
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
