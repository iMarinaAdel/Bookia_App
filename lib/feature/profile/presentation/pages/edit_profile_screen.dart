import 'package:bookia/core/components/bottoms/app_main_bottom.dart';
import 'package:bookia/core/components/inputs/app_text_form_field.dart';
import 'package:bookia/core/extentions/dailogs.dart';
import 'package:bookia/core/utils/app_color.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/feature/auth/presentation/widgets/arrow_back.dart';
import 'package:bookia/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:bookia/feature/profile/presentation/cubit/profile_states.dart';
import 'package:bookia/feature/profile/presentation/widgets/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

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
          Dialogs.hideLoadingDialog(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              ArrowBack(),
              Gap(90),
              Text(
                "Edit Profile",
                style: TextStyles.getText26(color: AppColor.darkColor),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // profile image with edit icon
                ProfileImage(),
                Gap(50),
                // form fields
                AppTextFormField(
                  controller: cubit.nameController,
                  isPassword: false,
                  labelText: "Full Name",
                ),
                Gap(20),
                AppTextFormField(
                  controller: cubit.phoneController,
                  isPassword: false,
                  labelText: "Phone Number",
                ),
                Gap(20),
                AppTextFormField(
                  controller: cubit.addressController,
                  isPassword: false,
                  labelText: "Address",
                ),
                Gap(70),
                // update profile button
                Center(
                  child: AppMainBottom(
                    onPressed: () {
                      cubit.updateProfile();
                    },
                    text: "Update Profile",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
