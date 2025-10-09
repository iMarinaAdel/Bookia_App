import 'package:bookia/core/routes/app_navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/feature/profile/presentation/widgets/profile_app_bar.dart';
import 'package:bookia/feature/profile/presentation/widgets/profile_list_tile.dart';
import 'package:bookia/feature/profile/presentation/widgets/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final List<ProfileItemModel> profileItems = [
      ProfileItemModel(title: "My Orders", onTap: (context) {}),
      ProfileItemModel(
        title: "Edit Profile",
        onTap: (BuildContext context) {
          pushTo(context, Routes.editProfile).then((value) {
            setState(() {});
          });
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
    return Scaffold(
      appBar: ProfileAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // user info
            UserInfo(),
            Gap(30),
            // list
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return ProfileListTile(item: profileItems[index]);
                },
                separatorBuilder: (context, index) => Gap(20),
                itemCount: profileItems.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileItemModel {
  final String title;

  final void Function(BuildContext context) onTap;

  ProfileItemModel({required this.title, required this.onTap});
}
