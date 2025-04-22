import 'package:flutter/material.dart';
import 'package:profile_listing/classes/profile_class.dart';
import 'package:profile_listing/repository/profile_dao.dart';

class ProfileProvider with ChangeNotifier{
  List<Profile> _profiles = [];

  List<Profile> get profiles => _profiles;

  final dao = ProfileDao();

  Future<void> onGetAllProfiles() async {
    try {
      _profiles = await dao.onGetAllProfiles();
      notifyListeners();
    } catch (e) {
      print("Error fetching profiles: $e");
      throw Exception("Failed to fetch profiles");
    }
  }

  void onUpdateProfile(Profile updatedProfile) {
    final index = _profiles.indexWhere((p) => p.id == updatedProfile.id);
    if (index != -1) {
      _profiles[index] = updatedProfile;
      notifyListeners();
    }
  }

  Future<void> onDeleteProfile(String profileId) async {
    try {
      final dao = ProfileDao();
      await dao.onDeleteProfile(profileId);
      _profiles.removeWhere((p) => p.id == profileId);
      notifyListeners();
    } catch (e) {
      print("Error deleting profile: $e");
      throw Exception("Failed to delete profile");
    }
  }
}