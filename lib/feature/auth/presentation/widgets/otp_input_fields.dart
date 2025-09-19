import 'package:bookia/core/utils/app_color.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart'
    show PinCodeTextField, PinTheme, PinCodeFieldShape;

class OtpInputFields extends StatelessWidget {
  const OtpInputFields({super.key, this.validator});
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    return PinCodeTextField(
      validator: validator,
      controller: cubit.verifyCodeControllar,
      appContext: context,
      length: 6,
      obscureText: false,
      backgroundColor: Colors.transparent,
      keyboardType: TextInputType.number,
      cursorColor: AppColor.primaryColor,
      enableActiveFill: true,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(10),
        fieldHeight: 60,
        fieldWidth: 50,
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
