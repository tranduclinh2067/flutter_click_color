import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedColor = 0;

  final List<Color> _colorList = [
    Colors.amber,
    Colors.blue,
    Colors.green,
    Colors.pink,
    Colors.red,
    Colors.purple,
    Colors.grey,
    Colors.lime,
    Colors.teal,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(seconds: 2),
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
          color: _colorList[_selectedColor],
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                child: ListView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                    ),
                    scrollDirection: Axis.horizontal,
                    children: List.generate(_colorList.length, (index) {
                      return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedColor = index;
                            });
                          },
                          child: colorBox(
                              _colorList[index], _selectedColor == index));
                    })),
              )
            ]),
      ),
    );
  }

  Widget colorBox(Color color, bool selected) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      curve: Curves.fastLinearToSlowEaseIn,
      width: selected ? 55 : 35,
      height: selected ? 55 : 35,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: selected ? 4 : 2),
          color: color),
    );
  }
}
