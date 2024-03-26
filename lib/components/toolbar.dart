import 'package:flutter/material.dart';
import 'package:flutter_application_5/styles/app_colors.dart';
import 'package:flutter_application_5/styles/text_styles.dart';

class Toolbar extends StatelessWidget implements PreferredSizeWidget {
  final dynamic titleWidget;
  final List<Widget>? actions;

  const Toolbar({Key? key, required this.titleWidget, this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title;

    if (titleWidget is String) {
      title = Text(titleWidget, style: AppText.header1);
    } else {
      title = titleWidget;
    }

    return AppBar(
      backgroundColor: AppColors.persianGreen,
      title: title,
      actions: actions,
      centerTitle: false,
      shadowColor: AppColors.mint,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
