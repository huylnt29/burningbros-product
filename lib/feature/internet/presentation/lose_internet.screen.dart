import 'package:burningbros_product/core/generated/assets.gen.dart';
import 'package:burningbros_product/core/widget/announcment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';

class LoseInternetScreen extends StatelessWidget {
  const LoseInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Announcement(
        message: Localization.of(context)!.internetLoss,
        imagePath: Assets.image.internetLoss.path,
      ),
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
    );
  }
}
