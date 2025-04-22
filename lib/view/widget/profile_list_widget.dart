import 'package:flutter/material.dart';
import 'package:profile_listing/classes/profile_class.dart';
import 'package:profile_listing/view/item/profile_list_item.dart';
import 'package:profile_listing/view/widget/empty_list_widget.dart';

class ProfileListWidget extends StatelessWidget {
  const ProfileListWidget({
    super.key,
    required this.profileList,
    required this.onDeleteProfile,
    required this.onRefresh,
  });

  final List<Profile> profileList;
  final Function(Profile) onDeleteProfile;
  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    return _initUI();
  }

  Widget _initUI() {
    if (profileList.isEmpty) {
      return EmptyListWidget();
    } else {
      return Padding(
        padding: EdgeInsets.only(top: 16.0),

        child: ListView.builder(
          itemCount: profileList.length,
          itemBuilder: (context, index) {
            return ProfileListItem(
              profile: profileList[index],
              onDeleteProfile: () {
                onDeleteProfile(profileList[index]);
              },
              onUpdateProfile: (Profile updatedProfile) {
                onRefresh();
              },
            );
          },
        ),
      );
    }
  }
}
