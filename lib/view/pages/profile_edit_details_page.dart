import 'package:flutter/material.dart';
import 'package:profile_listing/classes/profile_class.dart';
import 'package:profile_listing/repository/profile_dao.dart';
import 'package:profile_listing/utils/styles.dart';
import 'package:profile_listing/view/widget/loading_widget.dart';

class ProfileEditDetailsPage extends StatefulWidget {
  const ProfileEditDetailsPage({super.key, required this.profileId});

  final String profileId;

  @override
  State<ProfileEditDetailsPage> createState() => _ProfileEditDetailsPageState();
}

class _ProfileEditDetailsPageState extends State<ProfileEditDetailsPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final ProfileDao _profileDao = ProfileDao();

  late Profile _profile;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    _onGetProfile();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Profile")),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: _isLoading ? LoadingWidget() : _profileEditDetailsUI(),
      ),
    );
  }

  Widget _profileEditDetailsUI() {
    return Padding(
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
                    SizedBox(height: 8.0),
                    Text(
                      "${_profile.firstName} ${_profile.lastName}",
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
                controller: _firstNameController,
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
                controller: _lastNameController,
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
                controller: _emailController,
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
                  _onUpdateProfile();
                },
                style: FilledButton.styleFrom(
                  minimumSize: Size(double.infinity, 40.0),
                  backgroundColor: AppColors.primaryButton,
                ),
                child: Text('Save'),
              ),
            ],
          ),
        );
  }

  Future<void> _onGetProfile() async {
    try {
      Profile? profile = await _profileDao.onGetProfile(widget.profileId);

      if (profile != null) {
        setState(() {
          _profile = profile;
          _isLoading = false;

          _firstNameController.text = "${_profile.firstName}";
          _lastNameController.text = "${_profile.lastName}";
          _emailController.text = "${_profile.email}";
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error Fetching Profile: $e')));
    }
  }

  void _onUpdateProfile() async {
    try {
      final updatedProfile = Profile(
        id: _profile.id,
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        email: _emailController.text,
        profilePicUrl: _profile.profilePicUrl,
        isFavourite: _profile.isFavourite
      );

      await _profileDao.onUpdateProfile(_profile.id!, updatedProfile);

      print("Profile successfully updated!");

      _onGetProfile();
    } catch (e) {
      print("Failed to update profile : $e");
    }
  }
}
