import 'package:base_project_flutter/features/home/models/feature_item_model.dart';
import 'package:base_project_flutter/features/home/ui/widgets/feature_item_widget.dart';
import 'package:flutter/material.dart';

class FeatureGridWidget extends StatelessWidget {
  const FeatureGridWidget({super.key, required this.features});
  final List<FeatureItemModel> features;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 0.9,
      ),
      itemCount: features.length,
      itemBuilder: (context, index) {
        final feature = features[index];
        return FeatureItemWidget(
          icon: feature.icon,
          title: feature.title,
          color: feature.color,
          route: feature.route,
        );
      },
    );
  }
}
