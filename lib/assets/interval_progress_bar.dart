import 'package:flutter/material.dart';

class IntervalProgressBar extends StatefulWidget {
  final double value;

  const IntervalProgressBar({Key? key, required this.value}) : super(key: key);

  @override
  State<IntervalProgressBar> createState() =>
  _IntervalProgressBarState();
}

class _IntervalProgressBarState extends
State<IntervalProgressBar> {
  double get value => widget.value;

  List <Color> darkColors = [
    const Color.fromARGB(255, 22, 45, 67),
    const Color.fromARGB(255, 28, 55, 53),
    const Color.fromARGB(255, 33, 59, 34),
    const Color.fromARGB(255, 42, 59, 17),
    const Color.fromARGB(255, 50, 59, 18),
    const Color.fromARGB(255, 63, 60, 21),
    const Color.fromARGB(255, 71, 57, 9),
    const Color.fromARGB(255, 75, 51, 9),
    const Color.fromARGB(255, 77, 40, 15),
    const Color.fromARGB(255, 71, 29, 23)
  ];

  List <Color> brightColors = [
    const Color.fromARGB(255, 66, 144, 255),
    const Color.fromARGB(255, 94, 173, 167),
    const Color.fromARGB(255, 118, 188, 116),
    const Color.fromARGB(255, 145, 186, 62),
    const Color.fromARGB(255, 169, 183, 60),
    const Color.fromARGB(255, 192, 181, 60),
    const Color.fromARGB(255, 230, 190, 64),
    const Color.fromARGB(255, 237, 169, 59),
    const Color.fromARGB(255, 235, 138, 60),
    const Color.fromARGB(255, 229, 95, 72) 

  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _bar(),
        const SizedBox(
          width: 8,
        ),
        _label(),
      ],
    );
  }

  Widget _bar() {
    List<Color> actualColors = [];
    if (widget.value == 0) {
      actualColors = darkColors;
    } else {
      for (int i = 0; i < brightColors.length; i++) {
        if (10 / value <= i.toDouble()) {
          actualColors.add(brightColors[i]);
        } else {
          actualColors.add(darkColors[i]);
        }
      }
    }
    if (value >= 5) {
      actualColors = brightColors;
    }
    return Column(
      children: [
        _interval(customColor:actualColors[0]),
        _separator(),
        _interval(customColor:actualColors[1]),
        _separator(),
        _interval(customColor:actualColors[2] ),
        _separator(),
        _interval(customColor:actualColors[3]),
        _separator(),
        _interval(customColor:actualColors[4] ),
        _separator(),
        _interval(customColor:actualColors[5] ),
        _separator(),
        _interval(customColor: actualColors[6]),
        _separator(),
        _interval(customColor: actualColors[7]),
        _separator(),
        _interval(customColor: actualColors[8]),
        _separator(),
        _interval(customColor:actualColors[9]),

      ],
    );
  }

  Widget _interval({required Color customColor}){
    return SizedBox(
      width: 15.0,
      height: 3.8,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: customColor,
        ),
      ),
    );
  }

  Widget _separator() {
    return const SizedBox(
      height: 2.2,
    );
  }

  Widget _label() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        const SizedBox(
          height: 30.0,
        ),
        Text(
          '${value >= 5 ? 5 : value.toStringAsFixed(1)}',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }

}