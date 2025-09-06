import 'package:bookia/componatns/app_main_bottom.dart';
import 'package:bookia/componatns/app_text_form_field.dart';
import 'package:bookia/const/app_assets.dart';
import 'package:bookia/core/services/app_navigation.dart';
import 'package:bookia/core/utils/app_color.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/feature/auth/pages/register_screen.dart';
import 'package:bookia/feature/auth/widgets/app_social_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () {
            AppNavigation.popTo(context);
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.borderColor),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(Icons.arrow_back_ios_new_rounded),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome back! Glad \n to see you, Again!",
                style: TextStyles.getText26(color: AppColor.darkColor),
              ),
              Gap(20),
              AppTextFormField(labelText: 'Email', hintText: "Enter Your Email"),
              Gap(15),
              AppTextFormField(
                labelText: 'Password',
                hintText: "Enter Your Password",
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    AppAssets.eyeSvg,
                    width: 25,
                    height: 25,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentGeometry.centerRight,
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: AppColor.primaryColor,
                  ),
                  onPressed: () {},
                  child: Text(
                    textAlign: TextAlign.end,
                    "Forgot Password?",
                    style: TextStyles.getText16(color: AppColor.darkGrayColor),
                  ),
                ),
              ),
              Gap(30),
              AppMainBottom(onPressed: () {}, text: "Login"),
              Gap(30),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: AppColor.grayColor,
                      thickness: 1,
                      indent: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Or Login with",
                      style: TextStyles.getText16(color: AppColor.primaryColor),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: AppColor.grayColor,
                      thickness: 1,
                      endIndent: 20,
                    ),
                  ),
                ],
              ),
              Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppSocialButton(AppAssets: AppAssets.facebookSvg),
                  Gap(10),
                  AppSocialButton(AppAssets: AppAssets.googleSvg),
                  Gap(10),
                  AppSocialButton(AppAssets: AppAssets.appleSvg),
                ],
              ),
              Gap(30),
        
              Align(
                alignment: AlignmentGeometry.center,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Don’t have an account?",
                        style: TextStyles.getText16(color: AppColor.darkColor),
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: GestureDetector(
                          onTap: () {
                            AppNavigation.pushReplacementTo(
                              context,
                              RegisterScreen(),
                            );
                          },
                          child: Text(
                            " Register Now",
                            style: TextStyles.getText16(
                              color: AppColor.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
