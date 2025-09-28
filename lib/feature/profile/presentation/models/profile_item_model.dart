import 'package:bookia/routes/app_navigation.dart';
import 'package:bookia/routes/routes.dart';
import 'package:flutter/material.dart';

class ProfileItemModel {
  final String title;

  final void Function(BuildContext context) onTap;

  ProfileItemModel({required this.title, required this.onTap});
}

List<ProfileItemModel> profileItems = [
  ProfileItemModel(title: "My Orders", onTap: (context) {}),
  ProfileItemModel(
    title: "Edit Profile",
    onTap: (BuildContext context) {
      pushTo(context, Routes.editProfile);
    },
  ),
  ProfileItemModel(
    title: "Reset Password",
    onTap: (context) {
      pushTo(context, Routes.resetPassword);
    },
  ),
  ProfileItemModel(title: "FAQ", onTap: (context) {}),
  ProfileItemModel(title: "Contact Us", onTap: (context) {}),
  ProfileItemModel(title: "Privacy & Terms", onTap: (context) {}),
];
