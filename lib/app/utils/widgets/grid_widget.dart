import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'card_widget.dart';

class GridWidget extends StatelessWidget {
  GridWidget({super.key});

  get itemBuilder => null;

  final List gridList = [
    {
      "icon": Icons.wallet_membership,
      "title": "Constants.memberCont",
      "onTap": () {
        // Get.toNamed(Routes.MEMBER_CONTRIBUTION);
      }
    },
    {
      "icon": Icons.checklist_outlined,
      "title": "Constants.checkStatus",
      "onTap": () {
        // Get.toNamed(Routes.CHECK_STATUS);
      }
    },
    {
      "icon": Icons.paypal,
      "title": "Constants.payPartial",
      "onTap": () {
        // Get.toNamed(Routes.PAY_PARTIAL_INSTALLMENT);
      }
    },
    {
      "icon": Icons.view_carousel,
      "title": "Constants.viewMember",
      "onTap": () {
        // Get.toNamed(Routes.VIEW_MEMBER_STATUS);
      }
    },
    {
      "icon": Icons.add_business_rounded,
      "title": "Constants.addShare",
      "onTap": () {
        // Get.toNamed(Routes.ADDITION_SHARE_PURCHASE);
      }
    },
    {
      "icon": Icons.update_outlined,
      "title": "Constants.updateRegMob",
      "onTap": () {
        // Get.toNamed(Routes.UPDATE_REG_MOB);
      }
    },
    {
      "icon": Icons.update_outlined,
      "title": "Constants.shareAck",
      "onTap": () {
        // Get.toNamed(Routes.SHARE_ACKNOWLEDGEMENT);
      }
    },
    {
      "icon": Icons.wallet_membership,
      "title": "Constants.memberCont",
      "onTap": () {
        // Get.toNamed(Routes.MEMBER_CONTRIBUTION);
      }
    },
    {
      "icon": Icons.wallet_membership,
      "title": "Constants.memberCont",
      "onTap": () {
        // Get.toNamed(Routes.MEMBER_CONTRIBUTION);
      }
    },
    {
      "icon": Icons.wallet_membership,
      "title": "Constants.memberCont",
      "onTap": () {
        // Get.toNamed(Routes.MEMBER_CONTRIBUTION);
      }
    },
    {
      "icon": Icons.wallet_membership,
      "title": "Constants.memberCont",
      "onTap": () {
        // Get.toNamed(Routes.MEMBER_CONTRIBUTION);
      }
    },
    {
      "icon": Icons.wallet_membership,
      "title": "Constants.memberCont",
      "onTap": () {
        // Get.toNamed(Routes.MEMBER_CONTRIBUTION);
      }
    },
    {
      "icon": Icons.wallet_membership,
      "title": "Constants.memberCont",
      "onTap": () {
        // Get.toNamed(Routes.MEMBER_CONTRIBUTION);
      }
    },
    {
      "icon": Icons.wallet_membership,
      "title": "Constants.memberCont",
      "onTap": () {
        // Get.toNamed(Routes.MEMBER_CONTRIBUTION);
      }
    },
    {
      "icon": Icons.wallet_membership,
      "title": "Constants.memberCont",
      "onTap": () {
        // Get.toNamed(Routes.MEMBER_CONTRIBUTION);
      }
    },
    {
      "icon": Icons.wallet_membership,
      "title": "Constants.memberCont",
      "onTap": () {
        // Get.toNamed(Routes.MEMBER_CONTRIBUTION);
      }
    },
    {
      "icon": Icons.wallet_membership,
      "title": "Constants.memberCont",
      "onTap": () {
        // Get.toNamed(Routes.MEMBER_CONTRIBUTION);
      }
    },
    {
      "icon": Icons.wallet_membership,
      "title": "Constants.memberCont",
      "onTap": () {
        // Get.toNamed(Routes.MEMBER_CONTRIBUTION);
      }
    },
    {
      "icon": Icons.wallet_membership,
      "title": "Constants.memberCont",
      "onTap": () {
        // Get.toNamed(Routes.MEMBER_CONTRIBUTION);
      }
    },
    {
      "icon": Icons.wallet_membership,
      "title": "Constants.memberCont",
      "onTap": () {
        // Get.toNamed(Routes.MEMBER_CONTRIBUTION);
      }
    },
    {
      "icon": Icons.wallet_membership,
      "title": "Constants.memberCont",
      "onTap": () {
        // Get.toNamed(Routes.MEMBER_CONTRIBUTION);
      }
    },
    {
      "icon": Icons.wallet_membership,
      "title": "Constants.memberCont",
      "onTap": () {
        // Get.toNamed(Routes.MEMBER_CONTRIBUTION);
      }
    },
    {
      "icon": Icons.wallet_membership,
      "title": "Constants.memberCont",
      "onTap": () {
        // Get.toNamed(Routes.MEMBER_CONTRIBUTION);
      }
    },
    {
      "icon": Icons.wallet_membership,
      "title": "Constants.memberCont",
      "onTap": () {
        // Get.toNamed(Routes.MEMBER_CONTRIBUTION);
      }
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemCount: gridList.length,
        itemBuilder: (_, i) {
          var grid = gridList[i];
          return CardWidget(
            icon: grid["icon"],
            title: grid["title"],
            onTap: grid["onTap"],
          );
        });
  }
}
