import 'package:bookia/feature/profile/presentation/models/profile_item_model.dart';
import 'package:bookia/feature/profile/presentation/widgets/profile_app_bar.dart';
import 'package:bookia/feature/profile/presentation/widgets/profile_list_tile.dart';
import 'package:bookia/feature/profile/presentation/widgets/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
