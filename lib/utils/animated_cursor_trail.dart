import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimatedCursorTrailState {
  const AnimatedCursorTrailState({
    this.decoration = defaultDecoration,
    this.offset = Offset.zero,
    this.size = defaultSize,
  });

  static const Size defaultSize = Size(20, 20);
  static const BoxDecoration defaultDecoration = BoxDecoration(
    borderRadius: BorderRadius.all(
      Radius.circular(90),
    ),
  );

  final BoxDecoration decoration;
  final Offset offset;
  final Size size;
}

class AnimatedCursorTrailProvider extends ChangeNotifier {
  AnimatedCursorTrailProvider();

  AnimatedCursorTrailState state = AnimatedCursorTrailState();
  final listTrail = <Offset>[];
  double trailOpacity = 1.0;

  void changeCursor(GlobalKey key, {BoxDecoration? decoration}) {
    final renderBox = key.currentContext?.findRenderObject() as RenderBox?;

    if (renderBox == null) return;

    state = AnimatedCursorTrailState(
      decoration: decoration ?? AnimatedCursorTrailState.defaultDecoration,
      offset: renderBox.localToGlobal(Offset.zero).translate(
            renderBox.size.width / 2,
            renderBox.size.height / 2,
          ),
      size: renderBox.size,
    );

    notifyListeners();
  }

  void resetCursor() {
    state = AnimatedCursorTrailState();
    listTrail.clear();
    startTrailFadeTimer();
    notifyListeners();
  }

  void updateCursorPosition(Offset position, double scrollOffset) {
    state = AnimatedCursorTrailState(offset: position);
    listTrail.add(position.translate(0, scrollOffset));

    // Limit the number of points to 15
    if (listTrail.length > 15) {
      listTrail.removeAt(0);
    }

    resetTrailOpacity();
    startTrailFadeTimer();
    notifyListeners();
  }

  void startTrailFadeTimer() {
    const fadeDuration = Duration(seconds: 1);

    Timer(fadeDuration, () {
      resetTrailOpacity();
      notifyListeners();
    });
  }

  void resetTrailOpacity() {
    trailOpacity = 1.0;
    notifyListeners();
  }
}

class AnimatedCursorTrail extends StatefulWidget {
  const AnimatedCursorTrail({
    Key? key,
    this.child,
    this.active = true,
    required this.controller,
  }) : super(key: key);

  final Widget? child;
  final bool active;
  final ScrollController controller;

  @override
  State<AnimatedCursorTrail> createState() => _AnimatedCursorTrailState();
}

class _AnimatedCursorTrailState extends State<AnimatedCursorTrail> {
  double opacityLevel = 1.0;
  void changeOpacity() {
    if (mounted) setState(() => opacityLevel = 0.0);
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      changeOpacity();
    });
    return ChangeNotifierProvider(
      create: (context) => AnimatedCursorTrailProvider(),
      child: Consumer<AnimatedCursorTrailProvider>(
        builder: (context, provider, child) {
          return Stack(
            children: [
              if (widget.active)
                AnimatedOpacity(
                  opacity: opacityLevel,
                  duration: const Duration(milliseconds: 500),
                  child: CustomPaint(
                    painter: TrailPainter(provider.listTrail,
                        Theme.of(context).colorScheme.primary, provider),
                  ),
                ),
              if (child != null) child,
              if (widget.active)
                Positioned.fill(
                  child: MouseRegion(
                    onHover: (event) {
                      opacityLevel = 1;
                      provider.updateCursorPosition(
                        event.position,
                        widget.controller.offset,
                      );
                    },
                    onExit: (_) {
                      provider.resetCursor();
                    },
                    opaque: false,
                  ),
                ),
            ],
          );
        },
        child: widget.child,
      ),
    );
  }
}

class TrailPainter extends CustomPainter {
  final List<Offset> points;
  final Color color;
  final AnimatedCursorTrailProvider provider;

  TrailPainter(this.points, this.color, this.provider);

  @override
  void paint(Canvas canvas, Size size) {
    if (points.length < 2) {
      return;
    }

    final paint = Paint()
      ..color = color.withOpacity(provider.trailOpacity)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10.0;

    for (int i = 0; i < points.length - 1; i++) {
      canvas.drawLine(points[i], points[i + 1], paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
