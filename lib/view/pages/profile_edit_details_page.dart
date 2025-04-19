import 'package:flutter/material.dart';
import 'package:profile_listing/utils/styles.dart';

class ProfileEditDetailsPage extends StatefulWidget {
  const ProfileEditDetailsPage({super.key});

  @override
  State<ProfileEditDetailsPage> createState() => _ProfileEditDetailsPageState();
}

class _ProfileEditDetailsPageState extends State<ProfileEditDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Profile")),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
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
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/icon_edit_profile.png',
                              width: 33,
                              height: 33,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0,),
                    Text(
                      "Darlene Steward",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: AppColors.profileTitleText,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 48.0),
              Text(
                "First Name",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.profileContentTitleText,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 8.0),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(48.0),
                    borderSide: BorderSide(color: AppColors.border),
                  ),
                ),
              ),
              SizedBox(height: 24.0),
              Text(
                "Last Name",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.profileContentTitleText,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 8.0),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(48.0),
                    borderSide: BorderSide(color: AppColors.border),
                  ),
                ),
              ),
              SizedBox(height: 24.0),
              Text(
                "Email",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.profileContentTitleText,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 8.0),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(48.0),
                    borderSide: BorderSide(color: AppColors.border),
                  ),
                ),
              ),
              SizedBox(height: 32.0),
              FilledButton(
                onPressed: () {
                  
                },
                style: FilledButton.styleFrom(
                  minimumSize: Size(double.infinity, 40.0),
                  backgroundColor: AppColors.primaryButton
                ),
                child: Text('Get Started'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
