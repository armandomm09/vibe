import 'package:flutter/material.dart';
import 'package:flutter_application_5/components/toolbar.dart';
import 'package:flutter_application_5/styles/app_colors.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class RobotViewer extends StatelessWidget {
  const RobotViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(titleWidget: "3D Robot viewe"),
      body: Center(
        child: ModelViewer(
          backgroundColor: AppColors.scaffoldBackground,
          src: "assets/components/citrusCadRelease.gltf"
          ),
      ),
    );
  }
}