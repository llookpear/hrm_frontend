import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../utils/style/app_color.dart';
import 'fonts_style_widget.dart';

class AppBarWidget extends HookConsumerWidget implements PreferredSizeWidget {
  final String title;
  final Function() onPressed;
  final Function()? actionOnPressed;
  final IconData? actionIcons;
  final Color color;

  const AppBarWidget({
    super.key,
    this.actionOnPressed,
    this.actionIcons,
    required this.title,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      forceMaterialTransparency: true,
      backgroundColor: color,
      leadingWidth: 80,
      leading: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: AppColor.darkGreyColor,
        ),
      ),
      title: FontsStyle(
        size: 20,
        text: title,
        color:  AppColor.darkGreyColor,
        weight: FontWeight.bold,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: IconButton(
            onPressed: actionOnPressed,
            icon: Icon(
              actionIcons,
            ),
            color: AppColor.darkGreyColor,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
