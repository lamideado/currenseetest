import 'package:flutter/material.dart';
import 'package:currenseetest/themes/colors.dart';
import 'package:currenseetest/themes/text.dart';

class appbar extends StatelessWidget implements PreferredSizeWidget {
  const appbar({super.key})
      : preferredSize = const Size.fromHeight(50.0);

  @override
  final Size preferredSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: const [
      ],
      backgroundColor: AppColors.black,
      elevation: 0,
      title: SizedBox(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              boldText(text: 'CurrenSee', size: 20, color: AppColors.primary),
              modifiedText(text: ' News', size: 20, color: AppColors.lightwhite)
            ],
          )),
      centerTitle: true,
    );
  }
}
