import 'package:boilerplate/module/common/style/app_color.dart';
import 'package:boilerplate/module/common/style/app_text_style.dart';
import 'package:flutter/material.dart';

class AppButton {
  static Widget primary(
          {required String text,
          VoidCallback? onPressed,
          required BuildContext context,
          required String name}) =>
      ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            textStyle: AppTextStyle.s14w700(context),
            backgroundColor:
                onPressed == null ? AppColors.black : AppColors.blueNormal,
            foregroundColor: AppColors.whiteCard,
            fixedSize: const Size(double.maxFinite, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            )),
        child: name == ''
            ? Text(
                text,
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    name,
                    height: 20,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    text,
                  ),
                ],
              ),
      );
  static Widget withIcon(
          {required String text,
          VoidCallback? onPressed,
          BuildContext? context,
          required String name}) =>
      ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            textStyle: AppTextStyle.s14w700(context!),
            backgroundColor:
                onPressed == null ? AppColors.black : AppColors.black,
            foregroundColor: AppColors.whiteCard,
            fixedSize: const Size(double.maxFinite, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
            ),
            const SizedBox(
              width: 10,
            ),
            const Icon(Icons.navigate_next),
          ],
        ),
      );
  static ElevatedButton secondary(
          {required String text,
          VoidCallback? onPressed,
          BuildContext? context}) =>
      ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.white,
            foregroundColor: AppColors.black,
            textStyle: AppTextStyle.s14w700(context!),
            fixedSize: const Size(double.maxFinite, 48),
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: AppColors.black,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(vertical: 15),
            elevation: 0),
        child: Text(text),
      );
}
