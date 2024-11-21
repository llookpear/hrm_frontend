// import 'package:fluentui_system_icons/fluentui_system_icons.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'fonts_style_widget.dart';
//
// class AppBarActionsWidget extends HookConsumerWidget
//     implements PreferredSizeWidget {
//   final String title;
//   final Function() onPressed;
//   final Function() actionOnPressed;
//
//   const AppBarActionsWidget({
//     super.key,
//     required this.actionOnPressed,
//     required this.title,
//     required this.onPressed,
//   });
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return AppBar(
//       forceMaterialTransparency : true,
//       backgroundColor: const Color(0xFFF9F9F9),
//       leadingWidth: 100,
//       leading: IconButton(
//         onPressed: onPressed,
//         icon: const Icon(
//           FluentIcons.ios_arrow_24_filled,
//           color: Color(0xFF4F4F4F),
//         ),
//       ),
//       actions: [
//         IconButton(
//           onPressed: actionOnPressed,
//           icon: const Icon(
//             FluentIcons.add_16_filled,
//             color: Color(0xFF4F4F4F),
//           ),
//         ),
//       ],
//       title: FontsStyle(
//         size: 20,
//         text: title,
//         color: const Color(0xFF4F4F4F),
//         weight: FontWeight.bold,
//       ),
//     );
//   }
//
//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }
