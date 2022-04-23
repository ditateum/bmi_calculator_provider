import 'package:flutter/material.dart';

class IndicatorButton extends StatelessWidget {
  const IndicatorButton({
    Key? key,
    required this.size,
    required this.indicator,
    this.value = 0,
    required this.addButton,
    required this.minusButton,
  }) : super(key: key);

  final Size size;
  final String indicator;
  final double value;
  final Function() addButton;
  final Function() minusButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.870 / 2,
      height: size.height / 4,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xff272A4E),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            indicator,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '${value.round()}',
            style: const TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: const Color(0xff212747),
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: IconButton(
                  onPressed: minusButton,
                  icon: const Icon(
                    Icons.remove,
                  ),
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Container(
                alignment: Alignment.center,
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: const Color(0xff212747),
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: IconButton(
                  onPressed: addButton,
                  icon: const Center(
                    child: Icon(
                      Icons.add,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
