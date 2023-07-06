import 'package:flutter/material.dart';

class IntervalProgressBar extends StatefulWidget {
  const IntervalProgressBar({super.key});

  @override
  State<IntervalProgressBar> createState() => _IntervalProgressBarState();
}

class _IntervalProgressBarState extends State<IntervalProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _bar(),
        _label(),
        _separator(),
      ],
    );
  }

Widget _bar(){
  return Column(
    children: [
      _interval(customColor: Color.fromARGB(255, 42, 222, 232)),
      _separator(),
      _interval(customColor: Color.fromARGB(255, 24, 169, 236)),
      _separator(),
      _interval(customColor: Color.fromARGB(255, 23, 202, 127)),
      _separator(),
      _interval(customColor: Color.fromARGB(255, 13, 170, 86)),
      _separator(),
      _interval(customColor: Color.fromARGB(255, 215, 218, 25)),
      _separator(),
      _interval(customColor: Color.fromARGB(255, 219, 229, 39)),
      _separator(),
      _interval(customColor: Color.fromARGB(255, 233, 165, 38)),
      _separator(), 
      _interval(customColor: Color.fromARGB(255, 230, 149, 9)),
      _separator(),   
      _interval(customColor: Color.fromARGB(255, 188, 70, 37)),
      _separator(),
      _interval(customColor: const Color.fromARGB(255, 255, 0, 0)),
    ],
  );
}

Widget _interval({required Color customColor}){
  return SizedBox(
    width: 22.0,
    height: 3.0,
    child: DecoratedBox(
      decoration: BoxDecoration(
        color: customColor,
      ),
      ),
  );
}

Widget _separator(){
  return const SizedBox(
    height: 3,
  );
}

  Widget _label(){
    return Text(
      '1.0',
      style: Theme.of(context).textTheme.headlineSmall,
      );
  }
}