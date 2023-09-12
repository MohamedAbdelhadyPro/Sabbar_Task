import 'package:flutter/material.dart';
import 'package:handover/core/utils/assets.dart';
import 'package:handover/widgets/image_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: Center(
            child: ImageWidget(
          AppAssets.logoSvg,
          color: Colors.white,
          width: 75.w,
        )));
  }
}
