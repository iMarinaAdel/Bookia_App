import 'package:bookia/core/components/bottoms/app_main_bottom.dart';
import 'package:bookia/core/components/inputs/app_text_form_field.dart';
import 'package:bookia/core/extentions/dailogs.dart';
import 'package:bookia/core/utils/app_color.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/feature/auth/presentation/widgets/arrow_back.dart';
import 'package:bookia/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:bookia/feature/profile/presentation/cubit/profile_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';

class UpdatePasswordScreen extends StatelessWidget {
  const UpdatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ProfileCubit>();
    return BlocListener<ProfileCubit, ProfileStates>(
      listener: (BuildContext context, state) {
        if (state is ProfileLoading) {
          Dialogs.showLoadingDialog(context);
        } else if (state is ProfileError) {
          Dialogs.hideLoadingDialog(context);
          Dialogs.showErrorDialog(context, state.message ?? "");
        } else if (state is ProfileSuccess) {
          Dialogs.hideLoadingDialog(context);
          Dialogs.showSuccessDialog(context, "Password updated successfully");
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              ArrowBack(),
              Gap(70),
              Text(
                "New Password",
                style: TextStyles.getText26(color: AppColor.darkColor),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
          child: Form(
            key: cubit.formKey,
            child: Column(
              children: [
                Gap(20),
                AppTextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Current password is required";
                    }
                    return null;
                  },
                  controller: cubit.currentPasswordController,
                  isPassword: true,
                  labelText: "Current Password",
                ),
                Gap(20),
                AppTextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "New password is required";
                    }
                    if (value.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    if (value == cubit.currentPasswordController.text) {
                      return "New password must be different from current password";
                    }
                    return null;
                  },
                  controller: cubit.newPasswordController,
                  isPassword: true,
                  labelText: "New Password",
                ),
                Gap(20),
                AppTextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please confirm your password";
                    }
                    if (value != cubit.newPasswordController.text) {
                      return "Passwords do not match";
                    }
                    return null;
                  },
                  controller: cubit.confirmPasswordController,
                  isPassword: true,
                  labelText: "Confirm Password",
                ),
                Gap(70),
                AppMainBottom(
                  onPressed: () {
                    if (cubit.formKey.currentState!.validate()) {
                      cubit.resetPassword();
                    }
                  },
                  text: "Update Password",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
