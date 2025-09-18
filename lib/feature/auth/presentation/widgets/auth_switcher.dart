import 'package:bookia/routes/app_navigation.dart';
import 'package:bookia/core/utils/app_color.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/feature/auth/presentation/models/auth_type.dart';
import 'package:bookia/routes/routes.dart';
import 'package:flutter/material.dart';

class AuthSwitcher extends StatelessWidget {
  const AuthSwitcher({super.key, required this.type, this.onTapResent});
  final AuthType type;
  final VoidCallback? onTapResent;

  @override
  Widget build(BuildContext context) {
    String message;
    String actionText;
    String screen;
    VoidCallback onTap;
    switch (type) {
      case AuthType.login:
        message = "Don’t have an account?";
        actionText = " Register Now";
        screen = Routes.register;
        onTap = () => pushReplacementTo(context, screen);
        break;
      case AuthType.register:
        message = "Already have an account?";
        actionText = " Login Now";
        screen = Routes.login;
        onTap = () => pushReplacementTo(context, screen);

        break;
      case AuthType.forgetPassword:
        message = "Remember Password?";
        actionText = " Login";
        screen = Routes.login;
        onTap = () => pushReplacementTo(context, screen);
        break;
      case AuthType.oTPVerification:
        message = "Didn’t received code?";
        actionText = " Resend";
        screen = Routes.forgetPassword;
        onTap = onTap = onTapResent ?? () {};
        break;
    }
    return Align(
      alignment: AlignmentGeometry.center,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: message,
              style: TextStyles.getText16(color: AppColor.darkColor),
            ),
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: GestureDetector(
                onTap: onTap,
                child: Text(
                  actionText,
                  style: TextStyles.getText16(color: AppColor.primaryColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
