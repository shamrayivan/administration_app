import 'package:administration_app/ui/common/widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';

class AnalyseLogisticsShimmer extends StatelessWidget {
  const AnalyseLogisticsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ShimmerWidget(height: 44, radius: 16),
            SizedBox(height: 10,),
            ShimmerWidget(height: 30, radius: 16, width: 150,),
            SizedBox(height: 4,),
            Expanded(child: ShimmerWidget(height: 300, radius: 16,)),
          ],
        ),
      ),
    );
  }
}
