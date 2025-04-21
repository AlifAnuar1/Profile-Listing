import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:profile_listing/classes/profile_class.dart';
import 'package:profile_listing/utils/styles.dart';
import 'package:profile_listing/view/pages/profile_details_page.dart';
import 'package:profile_listing/view/pages/profile_edit_details_page.dart';

class ProfileListItem extends StatefulWidget {
  const ProfileListItem({super.key, required this.profile});

  final Profile profile;

  @override
  State<ProfileListItem> createState() => _ProfileListItemState();
}

class _ProfileListItemState extends State<ProfileListItem> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        extentRatio: 0.43,
        children: [
          Container(
            decoration: BoxDecoration(color: AppColors.secondary),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ProfileEditDetailsPage(
                            profileId: widget.profile.id!,
                          );
                        },
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(32.0),
                    child: Image.asset(
                      'assets/images/icon_edit.png',
                      width: 21.29,
                      height: 24.7,
                    ),
                  ),
                ),
                Container(
                  width: 1.5, // Width of the divider
                  color: AppColors.divider,
                  margin: EdgeInsets.symmetric(
                    vertical: 8.0,
                  ), // Vertical spacing
                ),
                InkWell(
                  onTap: () {
                    _onDeleteProfile();
                  },
                  child: Padding(
                    padding: EdgeInsets.all(32.0),
                    child: Image.asset(
                      'assets/images/icon_delete.png',
                      width: 21.29,
                      height: 24.7,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ProfileDetailsPage(profileId: widget.profile.id!);
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
                        child:
                            widget.profile.profilePicUrl != null &&
                                    widget.profile.profilePicUrl!.isNotEmpty
                                ? Image.network(
                                  widget.profile.profilePicUrl!,
                                  width: 63,
                                  height: 63,
                                  fit: BoxFit.cover,
                                )
                                : SizedBox(width: 63, height: 63),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child:
                            widget.profile.isFavourite
                                ? Image.asset(
                                  'assets/images/icon_favourite.png',
                                  width: 18,
                                  height: 16.88,
                                  fit: BoxFit.cover,
                                )
                                : SizedBox.shrink(),
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
                          "${widget.profile.firstName} ${widget.profile.lastName}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            color: AppColors.primaryText,
                          ),
                        ),
                        Text(
                          "${widget.profile.email}",
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
      ),
    );
  }

  void _onDeleteProfile() {
    showDialog(
      context: context,
      builder:
          (context) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.dialogBackground,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Are you sure you want to delete “Fullsnack Designer” from your contact?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          "This action cannot be undone.",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(height: 0.5, color: AppColors.dividerDialog),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Center(
                              child: Text(
                                "Cancel",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                      VerticalDivider(
                        width: 0.5,
                        thickness: 0.5,
                        color: AppColors.dividerDialog,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Center(
                              child: Text(
                                "Delete",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.secondary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
