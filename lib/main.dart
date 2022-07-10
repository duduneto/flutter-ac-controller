import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: _title,
      home: MyHomeStateful(),
    );
  }
}

class MyHomeStateful extends StatefulWidget {
  const MyHomeStateful({Key? key}) : super(key: key);

  @override
  State<MyHomeStateful> createState() => _MyHomeStatefulState();
}

class _MyHomeStatefulState extends State<MyHomeStateful> {
  GlobalKey stickyKey = GlobalKey();
  int _count = 0;
  final slider = SleekCircularSlider(
    appearance: CircularSliderAppearance(
        size: 280,
        startAngle: 45,
        angleRange: 90,
        counterClockwise: true,
        infoProperties: InfoProperties(
          modifier: (double value) {
            final roundedValue = value.ceil().toInt().toString();
            return '$roundedValue °C';
          },
        ),
        customWidths: CustomSliderWidths(shadowWidth: 0, handlerSize: 10)),
    min: 16,
    max: 32,
    initialValue: 18,
    onChange: (double value) {
      // callback providing a value while its being changed (with a pan gesture)
    },
    onChangeStart: (double startValue) {
      // callback providing a starting value (when a pan gesture starts)
    },
    onChangeEnd: (double endValue) {
      // ucallback providing an ending value (when a pan gesture ends)
    },
  );
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // Uncomment to change the background color
      // backgroundColor: CupertinoColors.systemPink,
      navigationBar: const CupertinoNavigationBar(
        middle: Text('AcControl'),
      ),
      child: ListView(
        children: <Widget>[
          Center(
            child: Container(
              padding: const EdgeInsets.all(0.0),
              color: Colors.white,
              height: 720,
              child: Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.fromLTRB(
                      40,
                      0,
                      0,
                      0,
                    ),
                    child: slider,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
