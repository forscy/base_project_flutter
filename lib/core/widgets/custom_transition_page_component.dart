import 'package:base_project_flutter/core/animation/custom_transition_builder.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class CustomTransitionPageComponent {
  static GoRouterPageBuilder fadeTransitionPageBuilder(Widget child) {
    return (context, state) {
      return CustomTransitionPage(
        key: state.pageKey,
        child: child,
        transitionsBuilder: CustomTransitionBuilder.fadeTransition,
      );
    };
  }

  static GoRouterPageBuilder slideTransitionPageBuilder(Widget child) {
    return (context, state) {
      return CustomTransitionPage(
        key: state.pageKey,
        child: child,
        transitionsBuilder: CustomTransitionBuilder.slideTransition,
      );
    };
  }

  static GoRouterPageBuilder scaleTransitionPageBuilder(Widget child) {
    return (context, state) {
      return CustomTransitionPage(
        key: state.pageKey,
        child: child,
        transitionsBuilder: CustomTransitionBuilder.scaleTransition,
      );
    };
  }

  static GoRouterPageBuilder slideFromBottomTransitionPageBuilder(
    Widget child,
  ) {
    return (context, state) {
      return CustomTransitionPage(
        key: state.pageKey,
        child: child,
        transitionsBuilder: CustomTransitionBuilder.slideFromBottomTransition,
      );
    };
  }

  static GoRouterPageBuilder fadeSlideTransitionPageBuilder(Widget child) {
    return (context, state) {
      return CustomTransitionPage(
        key: state.pageKey,
        child: child,
        transitionsBuilder: CustomTransitionBuilder.fadeSlideTransition,
      );
    };
  }
}
