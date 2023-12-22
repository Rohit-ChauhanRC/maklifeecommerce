import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maklifeecommerce/app/utils/app_colors/app_colors.dart';
import 'package:maklifeecommerce/app/utils/app_dimens/app_dimens.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    required this.quantity,
    required this.volume,
  });
  final IconData icon;
  final String title;
  final int quantity;
  final String volume;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 200,
        width: 120,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.creamColor1,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.black,
          ),
        ),
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Image.asset(
              "assets/images/Paneer.png",
              height: 100,
              width: 120,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              // width: 100,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: AppDimens.font18,
                  overflow: TextOverflow.visible,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.visible,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  // width: 100,
                  child: Text(
                    quantity.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.brownColor,
                      fontSize: AppDimens.font16,
                      overflow: TextOverflow.visible,
                    ),
                    overflow: TextOverflow.visible,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    volume,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.brownColor,
                      fontSize: AppDimens.font16,
                      overflow: TextOverflow.visible,
                    ),
                    overflow: TextOverflow.visible,
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                "₹5000.0",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.brownColor,
                  fontSize: AppDimens.font16,
                  overflow: TextOverflow.visible,
                ),
                overflow: TextOverflow.visible,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
