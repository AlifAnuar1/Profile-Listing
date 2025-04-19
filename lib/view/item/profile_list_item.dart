import 'package:flutter/material.dart';
import 'package:profile_listing/utils/styles.dart';
import 'package:profile_listing/view/pages/profile_details_page.dart';

class ProfileListItem extends StatefulWidget {
  const ProfileListItem({super.key});

  @override
  State<ProfileListItem> createState() => _ProfileListItemState();
}

class _ProfileListItemState extends State<ProfileListItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ProfileDetailsPage();
            },
          ),
        );
      },

      child: Padding(
        padding: EdgeInsets.only(bottom: 4.0),

        child: Container(
          height: 83.0,
          decoration: BoxDecoration(color: AppColors.itemBackground),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),

            child: Row(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/images/user_darlene.png',
                        width: 63,
                        height: 63,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Image.asset(
                        'assets/images/icon_favourite.png',
                        width: 18,
                        height: 16.88,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Darlene Steward",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: AppColors.primaryText,
                        ),
                      ),
                      Text(
                        "darlene.steward7@gmail.com",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14.0,
                          color: AppColors.secondaryText,
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/icon_send_message.png',
                    width: 30,
                    height: 25.98,
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
