import 'dart:math';

import 'package:flutter/material.dart';


class Polygons extends StatefulWidget {
  const Polygons({Key? key}) : super(key: key);

  @override
  State<Polygons> createState() => _PolygonsState();
}

class _PolygonsState extends State<Polygons> with TickerProviderStateMixin{

  late AnimationController _sidesController;
  late Animation<int> _sideAnimation;

  @override
  void initState() {
    super.initState();
    _sidesController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _sideAnimation = IntTween(
      begin: 3,
      end: 35,
    ).animate(CurvedAnimation(parent: _sidesController, curve: Curves.easeInQuad));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _sidesController.repeat(reverse: true);
  }

  @override
  void dispose() {
    super.dispose();
    _sidesController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: AnimatedBuilder(
          animation: _sidesController,
          builder: (context, child) {
            return CustomPaint(
              painter: Polygon(sides: _sideAnimation.value),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
              ),
            );
          },
        ),
      ),
    );
  }
}

class Polygon extends CustomPainter {
  final int sides;

  Polygon({required this.sides});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
        ..color = Colors.deepOrange
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeWidth = 5;

    final path = Path();
    final center = Offset(size.width / 2, size.height / 2);
    final angle = (2 * pi) / sides;
    final angles = List.generate(sides, (index) => index * angle);
    final radius = size.width / 2;

    path.moveTo(
        center.dx + radius * cos(0),
        center.dy + radius * sin(0));

    for (final angle in angles) {
      path.lineTo(
          center.dx + radius * cos(angle),
          center.dy + radius * sin(angle));
    }
    path.close();
    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
  oldDelegate is Polygon && oldDelegate.sides != sides;
}
