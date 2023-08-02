import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:water_counter_app/assets/interval_progress_bar.dart';
import 'package:water_counter_app/screens/drinks_screen.dart';

class StartScreen extends StatefulWidget {
  final double hidratacion;
  final int valueWater;
  const StartScreen(
      {Key? key, required this.hidratacion, required this.valueWater})
      : super(key: key);
  final int totalValue = 2500;

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  get valueWater => widget.valueWater;
  get totalValue => widget.totalValue;
  get hidratacion => widget.hidratacion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 16.0,
        leadingWidth: 100,
        leading: Text(
          'Hola Agüita',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        actions: [
          _hour(context),
        ],
        //actions: []
      ),
      body: SizedBox(
        height: 155.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _totalM(),
            _verticalGap(),
            _indicators(),
            _verticalGap(),
            _buttonReg(),
          ],
        ),
      ),
    );
  }

  Widget _hour(BuildContext context) {
  return StreamBuilder<int>(
    stream: Stream.periodic(const Duration(seconds: 1), (i) => i),
    builder: (context, snapshot) {
      return Text(
        DateFormat('h:mm a').format(DateTime.now()),
        style: Theme.of(context).textTheme.bodySmall,
      );
    },
  );
}

  Widget _verticalGap() {
    return const SizedBox(
      height: 4.0,
    );
  }
  Widget _totalM() {
    return Column(
      children: [
        SizedBox(
          height: 25.0,
          child: Text(
            '${valueWater.toString()} ml',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        Text(
          'Faltan ${totalValue - valueWater <= 0 ? 0 : totalValue - valueWater} ml',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }

  Widget _indicators() {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _percentage(),
          const SizedBox(
            width: 10,
          ),
          _smallDivider(),
          const SizedBox(
            width: 10,
          ),
          _hydration(),
        ],
      ),
    );
  }

  Widget _percentage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(
                strokeWidth: 6,
                value: valueWater * 100 / totalValue / 100,
                color: const Color.fromARGB(255, 7, 127, 207),
                backgroundColor: Color.fromARGB(57, 55, 65, 141),
              ),
              Text(
                '${valueWater * 100 ~/ totalValue >= 100 ? 100 : valueWater * 100 ~/ totalValue}%',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),

      Text(
        ' ${DateFormat('dd-MM-yy').format(DateTime.now())}',
        style: Theme.of(context).textTheme.bodySmall,
      ),
      ],
    );
  }

  Widget _smallDivider() {
    return const VerticalDivider(
      color: Color.fromARGB(255, 51, 51, 51),
      thickness: 1,
      width: 20,
      indent: 10,
      endIndent: 0,
    );
  }

  Widget _hydration() {
    return Column(
      children: [
        IntervalProgressBar(value: hidratacion),
        //_intervalBar(),

        Text(
          'Hidratación',
          style: Theme.of(context).textTheme.bodySmall,
        )
      ],
    );
  }

  // Widget _intervalBar() {
  //   return Text(
  //     '1.0',
  //     style: Theme.of(context).textTheme.headlineSmall,
  //   );
  // }

  Widget _buttonReg() {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints.tightFor(
          width: 175,
          height: 27,
        ),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DrinksScreen(
                        hidratacion: hidratacion,
                        valueWater: valueWater,
                      )),
            );
          },
          child: const Text('Hemos bebido agua'),
        ),
      ),
    );
  }
}