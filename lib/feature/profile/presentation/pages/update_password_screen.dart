import 'package:bookia/core/components/bottoms/app_main_bottom.dart';
import 'package:bookia/core/components/inputs/app_text_form_field.dart';
import 'package:bookia/core/utils/app_color.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/feature/auth/presentation/widgets/arrow_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

class UpdatePasswordScreen extends StatelessWidget {
  const UpdatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            ArrowBack(),
            Gap(80),
            Text(
              "New Password",
              style: TextStyles.getText26(color: AppColor.darkColor),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
        child: Column(
          children: [
            Gap(20),
            AppTextFormField(isPassword: true, labelText: "Current Password"),
            Gap(20),
            AppTextFormField(isPassword: true, labelText: "New Password"),
            Gap(20),
            AppTextFormField(isPassword: true, labelText: "Confirm Password"),
            Gap(70),
            AppMainBottom(onPressed: () {}, text: "Update Password"),
          ],
        ),
      ),
    );
  }
}
