import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maklifeecommerce/app/routes/app_pages.dart';
import 'package:maklifeecommerce/app/utils/app_colors/app_colors.dart';
import 'package:maklifeecommerce/app/utils/app_dimens/app_dimens.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).drawerTheme.backgroundColor,
      elevation: 10,
      width: Get.width / 3,
      child: ListView(
        children: [
          Column(
            children: [
              const CircleAvatar(
                radius: 70,
                child: FlutterLogo(),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                color: Colors.white,
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                title: Text(
                  "Profile",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: AppDimens.font24,
                  ),
                ),
                leading: Icon(
                  Icons.person,
                  color: AppColors.bgColor,
                  size: 24,
                ),
              ),
              ListTile(
                title: Text(
                  "Admin",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: AppDimens.font24,
                  ),
                ),
                leading: Icon(
                  Icons.admin_panel_settings,
                  color: AppColors.bgColor,
                  size: 24,
                ),
              ),
            ],
          ),

          ListTile(
            title: Text(
              "Billing",
              style: const TextStyle(
                color: Colors.white,
                fontSize: AppDimens.font24,
              ),
            ),
            leading: Icon(
              Icons.home,
              color: AppColors.bgColor,
              size: 24,
            ),
            onTap: () {
              // Get.toNamed(Routes.COMPANY_INFO);
            },
          ),

          // Expanded(
          //     child: Container(
          //   margin: const EdgeInsets.only(left: 15),
          //   alignment: Alignment.bottomLeft,
          //   child: Text(
          //     "Constants.logout.toUpperCase()",
          //     style: const TextStyle(
          //       color: Colors.white,
          //       fontSize: 16,
          //     ),
          //   ),
          // ))
        ],
      ),
    );
  }
}
