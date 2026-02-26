import 'package:flutter/material.dart';

class HomeSection extends StatefulWidget {
  final Widget child;
  final GlobalKey scrollKey;
  final String title;
  final bool last;

  const HomeSection({
    super.key,
    this.last = false,
    required this.child,
    required this.scrollKey,
    required this.title,
  });

  @override
  State<HomeSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _titleSlide;
  late Animation<Offset> _childSlide;
  late Animation<double> _fadeTitle;
  late Animation<double> _fadeChild;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _titleSlide = Tween<Offset>(
      begin: const Offset(0, 0.3), // de baixo pra cima
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _childSlide = Tween<Offset>(
      begin: const Offset(0, -0.3), // de cima pra baixo
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeTitle = Tween<double>(begin: 0, end: 1).animate(_controller);
    _fadeChild = Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isWide = size.width > 1200;

    return Container(
      key: widget.scrollKey,
      width: isWide ? 1200 : size.width * 0.95,
      constraints: widget.last ? null : BoxConstraints(minHeight: size.height),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeTransition(
              opacity: _fadeTitle,
              child: SlideTransition(
                position: _titleSlide,
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            FadeTransition(
              opacity: _fadeChild,
              child: SlideTransition(
                position: _childSlide,
                child: widget.child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
