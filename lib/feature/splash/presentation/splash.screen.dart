import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';
import 'package:burningbros_product/core/generated/assets.gen.dart';
import 'package:burningbros_product/core/routing/route_config.dart';
import 'package:burningbros_product/core/routing/route_path.dart';
import 'package:burningbros_product/core/style/color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        if (mounted) {
          Routes.router.navigateTo(
            context,
            RoutePath.products,
            replace: true,
          );
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColor.secondary,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FractionallySizedBox(
              widthFactor: 0.5,
              child: Image(
                image: AssetImage(Assets.image.logo.path),
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Text(
              Localization.of(context)!.appName,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w900,
                color: AppColor.text,
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Text(
              Localization.of(context)!.slogan,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: AppColor.text,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
