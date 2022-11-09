import 'package:flutter/material.dart';
import 'package:ft_worldstreet/schema/color_schema.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor = AppColors.primary;
  final String? title;
  final bool automaticallyImplyLeading;
  final AppBar? appBar;
  final List<Widget>? actions;
  final bool? isShowReload;
  final bool showSettingIcon;

  final bool showAddTaskFinishIcon;
  final bool deleteIcon;
  final Callback? ontap;
  final Callback? reloadOnTap;

  const CommonAppBar({
    Key? key,
    this.title,
    this.isShowReload = false,
    this.ontap,
    this.reloadOnTap,
    this.appBar,
    this.automaticallyImplyLeading = true,
    this.actions,
    this.showSettingIcon = true,
    this.showAddTaskFinishIcon = false,
    this.deleteIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 50,
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: (isShowReload!)
          ? IconButton(
              icon: const Icon(
                Icons.replay,
                color: AppColors.greyDark1,
              ),
              onPressed: reloadOnTap)
          : automaticallyImplyLeading
              ? IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: AppColors.white,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                )
              : const SizedBox(),
      backgroundColor: AppColors.greenUnread,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: const TextStyle(
          color: AppColors.white, fontSize: 20, fontWeight: FontWeight.bold),
      title: Text(title ?? ""),
      actions: [
        if (showSettingIcon)
          IconButton(
            onPressed: () {
              // Get.toNamed(AppRouter.settingScreen);
            },
            icon: const Icon(Icons.settings),
            color: AppColors.white,
          ),
        if (showAddTaskFinishIcon)
          IconButton(
            onPressed: ontap,
            icon: const Icon(Icons.check),
            color: Colors.white,
          ),
        if (deleteIcon)
          IconButton(
            onPressed: ontap,
            icon: const Icon(Icons.delete),
            color: Colors.white,
          ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar!.preferredSize.height);
}
