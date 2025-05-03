import 'package:base_project_flutter/core/widgets/loading_animation.dart';
import 'package:flutter/material.dart';

class LoadingOverlay extends StatefulWidget {
  final Widget? child;
  final bool isLoading;
  final String? loadingMessage;
  final Color? color;

  const LoadingOverlay({
    super.key,
    this.child,
    required this.isLoading,
    this.loadingMessage,
    this.color,
  });

  @override
  State<LoadingOverlay> createState() => _LoadingOverlayState();
}

class _LoadingOverlayState extends State<LoadingOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    if (widget.isLoading) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(LoadingOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isLoading != oldWidget.isLoading) {
      if (widget.isLoading) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final loadingColor = widget.color ?? theme.primaryColor;

    return Stack(
      children: [
        widget.child ??
            const SizedBox.shrink(), // Use SizedBox.shrink() if child is null
        // Fade in/out overlay
        FadeTransition(
          opacity: _animation,
          child: IgnorePointer(
            ignoring: !widget.isLoading,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              color: Colors.black.withValues(
                alpha: widget.isLoading ? 0.5 : 0.0,
              ),
              child: Center(
                child: LoadingAnimation(
                  color: loadingColor,
                  message: widget.loadingMessage,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
