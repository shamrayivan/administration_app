import 'package:administration_app/ui/common/widgets/shimmer_widget.dart';
import 'package:administration_app/ui/res/const_colors.dart';
import 'package:flutter/material.dart';

class EfficiencyTransportShimmer extends StatelessWidget {
  const EfficiencyTransportShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for(int i = 0; i< 20; i++)
          Container(
            decoration: BoxDecoration(border: Border.all(width: 0.1, color: greyColor)),
              child: const ShimmerWidget(height: 60, radius: 16)),
        ],
      ),
    );
  }
}
