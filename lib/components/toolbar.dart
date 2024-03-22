import 'package:flutter/material.dart';
import 'package:flutter_application_5/styles/app_colors.dart';
import 'package:flutter_application_5/styles/text_styles.dart';

class Toolbar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final List<Widget>? actions;
  const Toolbar({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: AppColors.persianGreen,
        title: Text(title, style: AppText.header1),
        actions: actions,
        centerTitle: false,
        shadowColor: AppColors.mint,
      );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}