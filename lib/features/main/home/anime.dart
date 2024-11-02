import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anime'),
      ),
      body: Center(
        child: TweenAnimationBuilder(
          builder: (context, size, child) {
            return Container(
              height: size,
              width: size,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.blue.withOpacity(0.5),
                        blurRadius: size,
                        spreadRadius: size / 2)
                  ]),
            );
          },
          tween: Tween<double>(begin: 0, end: 200),
          duration: const Duration(seconds: 2),
        ),
      ),
    );
  }
}
