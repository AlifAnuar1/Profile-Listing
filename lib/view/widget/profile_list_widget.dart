import 'package:flutter/material.dart';
import 'package:profile_listing/classes/profile_class.dart';
import 'package:profile_listing/view/item/profile_list_item.dart';

class ProfileListWidget extends StatelessWidget {
  const ProfileListWidget({super.key, required this.profileList});

  final List<Profile> profileList;

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    if (profileList.isEmpty) {
      return Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/icon_empty_list.png',
                width: 150,
                height: 150,
              ),
              const SizedBox(height: 16),
              const Text(
                "Looks like your contact list is empty.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
              const Text(
                "Add a new contact now.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.only(top: 16.0),

        child: ListView.builder(
          itemCount: profileList.length,
          itemBuilder: (context, index) {
            return ProfileListItem(profile: profileList[index]);
          },
        ),
      );
    }
  }
}
