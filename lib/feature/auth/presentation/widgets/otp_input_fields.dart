import 'package:bookia/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart'
    show PinCodeTextField, PinTheme, PinCodeFieldShape;

class OtpInputFields extends StatelessWidget {
  const OtpInputFields({super.key});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 4,
      obscureText: false,
      backgroundColor: Colors.transparent,
      keyboardType: TextInputType.number,
      cursorColor: AppColor.primaryColor,
      enableActiveFill: true,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(10),
        fieldHeight: 60,
        fieldWidth: 70,
        activeColor: AppColor.primaryColor,
        selectedColor: AppColor.primaryColor,
        inactiveColor: AppColor.borderColor,
        activeFillColor: AppColor.whiteColor,
        inactiveFillColor: AppColor.textFormColor,
        selectedFillColor: AppColor.whiteColor,
      ),
    );
  }
}
