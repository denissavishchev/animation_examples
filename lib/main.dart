import 'package:animation_lessons/polygons.dart';
import 'package:animation_lessons/three_d_effect.dart';
import 'package:animation_lessons/transform_lesson.dart';
import 'package:animation_lessons/tween_animation_builder.dart';
import 'package:flutter/material.dart';
import 'chained_animation.dart';
import 'custom_button_animation.dart';
import 'hero_animation.dart';
import 'implicit_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      home: Container(),
    );
  }
}

