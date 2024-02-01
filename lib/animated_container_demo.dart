// Copyright 2019 the Dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license
// that can be found in the LICENSE file.

import 'dart:math';

import 'package:flutter/material.dart';

const Duration _duration = Duration(milliseconds: 400);

double randomBorderRadius() {
  return Random().nextDouble() * 64;
}

double randomMargin() {
  return Random().nextDouble() * 64;
}

Color randomColor() {
  return Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
}

class AnimatedContainerDemo extends StatefulWidget {
  const AnimatedContainerDemo({super.key});

  @override
  State<AnimatedContainerDemo> createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  late Color color;
  late double borderRadius;
  late double margin;

  @override
  void initState() {
    super.initState();
    color = randomColor();
    borderRadius = randomBorderRadius();
    margin = randomMargin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Container Demo"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                width: 128,
                height: 128,
                child: AnimatedContainer(
                  margin: EdgeInsets.all(margin),
                  curve: Curves.easeInOutBack,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  duration: _duration,
                ),
              ),
              ElevatedButton(
                child: const Text('Change'),
                onPressed: () => change(),
              ),
              const SizedBox(
                height: 30,
              ),
              Values(title: "Border Radius", value: borderRadius),
              Values(title: "Margin", value: margin),
              Values(title: "Color", value: color.toString())
            ],
          ),
        ),
      ),
    );
  }

  void change() {
    setState(() {
      color = randomColor();
      margin = randomMargin();
      borderRadius = randomBorderRadius();
    });
  }
}

class Values extends StatelessWidget {
  const Values({
    super.key,
    required this.title,
    required this.value,
  });

  final dynamic value;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title),
          const SizedBox(
            width: 10,
          ),
          title == "Color"
              ? Text(value.toString().toUpperCase())
              : SizedBox(
                  width: 20,
                  child: TweenAnimationBuilder(
                    tween: IntTween(
                      begin: 0,
                      end: value.toInt(),
                    ),
                    duration: _duration,
                    builder: (context, value, child) => Text("$value"),
                  ),
                )
        ],
      ),
    );
  }
}
