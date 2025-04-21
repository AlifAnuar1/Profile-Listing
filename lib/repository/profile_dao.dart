import 'package:firebase_database/firebase_database.dart';
import 'package:profile_listing/classes/profile_class.dart';

class ProfileDao {
  final _databaseRef = FirebaseDatabase.instance.ref('profiles');

  Future<String> onCreateProfile(Profile profile) async {
    DatabaseReference newUserRef = _databaseRef.push();

    profile.id = newUserRef.key;

    await newUserRef.set(profile.toMap());

    return newUserRef.key!;
  }

  Future<void> onUpdateUser(String profileId, Profile updatedProfile) async {
    await _databaseRef.child(profileId).update(updatedProfile.toMap());
  }

  Future<void> onUpdateProfile(String profileId, Profile updatedProfile) async {
    try {
      if (profileId.isEmpty) {
        throw Exception(
          "Invalid profileId: Cannot update a profile with an empty ID.",
        );
      }

      final Map<String, dynamic> updatedData = updatedProfile.toMap();

      if (updatedData.isEmpty) {
        throw Exception(
          "Invalid updatedProfile: The profile data cannot be empty.",
        );
      }

      await _databaseRef.child(profileId).update(updatedData);

      print("Profile updated successfully for profileId: $profileId");
    } catch (e) {
      print("Error updating profile with profileId '$profileId': $e");
      throw Exception("Failed to update profile: $e");
    }
  }

  Future<void> onDeleteProfile(String id) async {
    await _databaseRef.child(id).remove();
  }

  Future<List<Profile>> onGetAllProfiles() async {
    try {
      final snapshot = await _databaseRef.get();

      if (snapshot.value == null) {
        print("No profiles found in the database.");
        return [];
      }

      final profilesListData = List<Map<dynamic, dynamic>>.from(
        snapshot.value as List,
      );

      final profilesList =
          profilesListData.map((profileData) {
            final profileId = profileData['id']?.toString() ?? '';
            return Profile.fromMap(profileData, profileId);
          }).toList();

      print("Retrieved profiles: $profilesList");

      return profilesList;
    } catch (e) {
      print("Error retrieving profiles: $e");
      throw Exception("Cannot Retrieve Profile List");
    }
  }

  Future<Profile?> onGetProfile(String profileId) async {
    try {
      final snapshot = await _databaseRef.child(profileId).get();

      if (snapshot.value == null) {
        print("No profile found in the database for profileId: $profileId");
        return null;
      }

      if (snapshot.value is! Map<dynamic, dynamic>) {
        throw Exception("Unexpected data format for profileId: $profileId");
      }

      final profileData = Map<String, dynamic>.from(snapshot.value as Map);

      if (profileData.isEmpty) {
        print("Empty profile data for profileId: $profileId");
        return null;
      }

      return Profile.fromMap(profileData, profileId);
    } catch (e) {
      print("Error retrieving profile with profileId '$profileId': $e");
      throw Exception(
        "Cannot Retrieve Profile with ProfileId '$profileId': $e",
      );
    }
  }

  Future<void> onUpdateProfilePicUrl(String profileId, String imageUrl) async {
    try {
      await _databaseRef.child(profileId).update({'profilePicUrl': imageUrl});
      print("Profile image URL updated successfully in the database.");
    } catch (e) {
      print("Error updating profile image URL: $e");
      throw Exception("Failed to update profile image URL: $e");
    }
  }

  Future<void> onUpdateFavourite(String profileId, bool isFavourite) async {
    try {
      await _databaseRef.child(profileId).update({'isFavourite': isFavourite});
      print("Profile updated successfully in the database.");
    } catch (e) {
      print("Error updating profile: $e");
      throw Exception("Failed to update profile: $e");
    }
  }
}
