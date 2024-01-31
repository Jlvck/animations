// Copyright 2019 the Dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license
// that can be found in the LICENSE file.

import 'package:flutter/material.dart';

const owlUrl =
    'https://raw.githubusercontent.com/flutter/website/main/src/assets/images/docs/owl.jpg';

class FadeInDemo extends StatefulWidget {
  const FadeInDemo({super.key});

  @override
  State<FadeInDemo> createState() => _FadeInDemoState();
}

class _FadeInDemoState extends State<FadeInDemo> {
  String show = "Show details";
  String hide = "Hide details";
  int time = 2;
  double opacity = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fade In Demo"),
      ),
      body: Center(
        child: Column(children: <Widget>[
          Image.network(owlUrl, height: height * 0.6),
          TextButton(
            child: Text(
              opacity == 0.0 ? show : hide,
              style: const TextStyle(color: Colors.blueAccent),
            ),
            onPressed: () => {
              setState(() {
                if (opacity == 0) {
                  time = 2000;
                  opacity = 1;
                } else {
                  opacity = 0;
                  time = 500;
                }
              })
            },
          ),
          AnimatedOpacity(
            opacity: opacity,
            duration: Duration(milliseconds: time),
            child: const Column(
              children: [
                Text('Type: Owl'),
                Text('Age: 39'),
                Text('Employment: None'),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
