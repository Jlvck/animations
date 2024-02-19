import 'package:flutter/material.dart';

//animate 4
void main() => runApp(const LogoAppBuilder());

class LogoAppBuilder extends StatefulWidget {
  const LogoAppBuilder({super.key});

  @override
  State<LogoAppBuilder> createState() => _LogoAppBuilderState();
}

class _LogoAppBuilderState extends State<LogoAppBuilder>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);

    animation = Tween<double>(
      begin: 0,
      end: 300,
    ).animate(controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Future.delayed(const Duration(seconds: 2), () {
            controller.reverse();
          });
        } else if (status == AnimationStatus.dismissed) {
          Future.delayed(const Duration(seconds: 1), () {
            controller.forward();
          });
        }
      })
      ..addStatusListener((status) => print("$status"));
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GrowTransition(
      animation: animation,
      child: const LogoWidget(),
    );
  }
}

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: const FlutterLogo(),
    );
  }
}

class GrowTransition extends StatelessWidget {
  const GrowTransition(
      {super.key, required this.child, required this.animation});
  final Widget child;
  final Animation<double> animation;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return SizedBox(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}
