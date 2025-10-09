import 'package:bookia/core/services/local/local_helper.dart';
import 'package:bookia/feature/profile/data/models/request/reset_password_params.dart';
import 'package:bookia/feature/profile/data/models/request/update.profile.params.dart';
import 'package:bookia/feature/profile/data/repo/profile_repo.dart';
import 'package:bookia/feature/profile/presentation/cubit/profile_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitial());
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  var currentPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  initData() {
    var userData = LocalHelper.getUserData();
    nameController.text = userData?.name ?? "";
    phoneController.text = userData?.phone ?? "";
    addressController.text = userData?.address ?? "";
  }

  updateProfile() async {
    emit(ProfileLoading());

    var params = UpdateProfileParams(
      name: nameController.text,
      address: addressController.text,
      phone: phoneController.text,
    );

    var res = await ProfileRepo.updateProfile(params);

    if (res) {
      emit(ProfileSuccess());
    } else {
      emit(ProfileError(message: "Failed to update profile"));
    }
  }

  resetPassword() async {
    emit(ProfileLoading());

    var params = ResetPasswordParams(
      currentPassword: currentPasswordController.text,
      newPassword: newPasswordController.text,
      confirmPassword: confirmPasswordController.text,
    );

    var res = await ProfileRepo.changePassword(params);

    if (res) {
      emit(ProfileSuccess());
    } else {
      emit(ProfileError(message: "Current password is incorrect"));
    }
  }
}
