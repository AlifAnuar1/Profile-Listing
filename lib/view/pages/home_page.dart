import 'package:flutter/material.dart';
import 'package:profile_listing/classes/profile_class.dart';
import 'package:profile_listing/provider/profile_provider.dart';
import 'package:profile_listing/utils/styles.dart';
import 'package:profile_listing/view/widget/loading_widget.dart';
import 'package:profile_listing/view/widget/profile_list_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedFilter = "All";
  String _searchText = "";

  @override
  void initState() {
    super.initState();
    Provider.of<ProfileProvider>(context, listen: false).onGetAllProfiles();
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("My Contact")),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8),
              child: Column(
                children: [
                  TextField(
                    onChanged: (query) {
                      setState(() {
                        _searchText = query;
                        _applyFilter(profileProvider.profiles);
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Search contact",
                      suffixIcon: IconButton(
                        icon: Image.asset('assets/images/icon_search.png'),
                        onPressed: () {},
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(48.0),
                        borderSide: BorderSide(color: AppColors.border),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),

              child: Row(
                children: [
                  _filterContainer("All", profileProvider),
                  SizedBox(width: 8.0),
                  _filterContainer("Favourite", profileProvider),
                ],
              ),
            ),
            Expanded(
              child:
                  profileProvider.profiles.isEmpty
                      ? LoadingWidget()
                      : ProfileListWidget(
                        profileList: _applyFilter(profileProvider.profiles),
                        onDeleteProfile: (Profile profile) {
                          profileProvider.onDeleteProfile(profile.id!);
                        },
                        onRefresh: () {
                          profileProvider.onGetAllProfiles();
                        },
                      ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Image Button Pressed!');
        },
        backgroundColor: Colors.transparent,
        elevation: 0,
        shape: CircleBorder(),
        child: Image.asset('assets/images/btn_add.png', width: 66, height: 66),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  // ----------------------  Widgets ----------------------

  Widget _filterContainer(String filter, ProfileProvider profileProvider) {
    bool isSelected = _selectedFilter == filter;

    return InkWell(
      onTap: () {
        setState(() {
          _selectedFilter = filter;
          _applyFilter(profileProvider.profiles);
        });
      },
      child: Container(
        height: 25.0,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.background,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Center(
          child: Text(
            filter,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  // -----------------------  Logics ----------------------

  List<Profile> _applyFilter(List<Profile> profiles) {
    List<Profile> filteredProfiles = List.from(profiles);

    if (_selectedFilter == "Favourite") {
      filteredProfiles = filteredProfiles.where((p) => p.isFavourite).toList();
    }

    if (_searchText.isNotEmpty) {
      final query = _searchText.toLowerCase();
      filteredProfiles =
          filteredProfiles
              .where(
                (p) =>
                    p.firstName!.toLowerCase().contains(query) ||
                    p.lastName!.toLowerCase().contains(query) ||
                    p.email!.toLowerCase().contains(query),
              )
              .toList();
    }

    return filteredProfiles;
  }

  // ------------------------------------------------------
}
