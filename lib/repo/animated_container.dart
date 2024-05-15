import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: LearningAnimations(),
    debugShowCheckedModeBanner: false,
  ));
}

class LearningAnimations extends StatefulWidget {
  const LearningAnimations({super.key});

  @override
  State<LearningAnimations> createState() => _LearningAnimationsState();
}

class _LearningAnimationsState extends State<LearningAnimations> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: Center(
                child: AnimatedContainer(
                  decoration: BoxDecoration(
                      color: selected ? Colors.blueAccent : Colors.amber[300],
                      borderRadius: selected
                          ? BorderRadius.circular(80)
                          : BorderRadius.circular(25)),
                  clipBehavior: Clip.antiAlias,
                  width: selected ? 300 : 200,
                  height: selected ? 200 : 400,
                  alignment:
                      selected ? Alignment.bottomCenter : Alignment.topLeft,
                  duration: const Duration(seconds: 2),
                  curve: Curves.fastOutSlowIn,
                  child: const Center(
                    child: FlutterLogo(
                      size: 200,
                    ),
                  ),
                ),
              )),
          const SizedBox(
            height: 50,
          ),
          Switch(
            value: selected,
            onChanged: (value) {
              setState(() {
                selected = !selected;
              });
            },
          ),
        ],
      ),
    );
  }
}

class SwitchClass extends StatefulWidget {
  const SwitchClass({super.key});

  @override
  State<SwitchClass> createState() => _SwitchClassState();
}

class _SwitchClassState extends State<SwitchClass> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: status,
      onChanged: (value) {
        print("Value : $value");
        setState(() {
          status = value;
        });
        Container(
          width: 20,
          height: 15,
          child: Text('Value : $status'),
        );
      },
    );
  }
}
