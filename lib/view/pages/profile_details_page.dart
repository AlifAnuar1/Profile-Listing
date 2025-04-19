import 'package:flutter/material.dart';
import 'package:profile_listing/utils/styles.dart';
import 'package:profile_listing/view/pages/profile_edit_details_page.dart';

class ProfileDetailsPage extends StatefulWidget {
  const ProfileDetailsPage({super.key});

  @override
  State<ProfileDetailsPage> createState() => _ProfileDetailsPageState();
}

class _ProfileDetailsPageState extends State<ProfileDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 49.0),
            Center(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/images/user_darlene.png',
                          width: 135,
                          height: 135,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Image.asset(
                          'assets/images/icon_favourite.png',
                          width: 32,
                          height: 30,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    "Darlene Steward",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: AppColors.profileTitleText,
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ProfileEditDetailsPage();
                          },
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: AppColors.secondary, width: 1.5),
                      foregroundColor: AppColors.secondary,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: Text("Edit profile", style: TextStyle(fontSize: 14)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 48.0),
            Container(
              height: 69.0,
              decoration: BoxDecoration(color: AppColors.itemBackground),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    Image.asset('assets/images/icon_email.png'),
                    SizedBox(width: 8.0,),
                    Text(
                      "darlene.steward7@gmail.com",
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34.0),
              child: FilledButton(
                  onPressed: () {
                    
                  },
                  style: FilledButton.styleFrom(
                    minimumSize: Size(double.infinity, 47.0),
                    backgroundColor: AppColors.primaryButton
                  ),
                  child: Text('Send Email'),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
