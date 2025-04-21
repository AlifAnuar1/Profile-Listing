import 'package:flutter/material.dart';
import 'package:profile_listing/classes/profile_class.dart';
import 'package:profile_listing/repository/profile_dao.dart';
import 'package:profile_listing/utils/styles.dart';
import 'package:profile_listing/view/widget/loading_widget.dart';
import 'package:profile_listing/view/widget/profile_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProfileDao _profileDao = ProfileDao();

  List<Profile> _allProfileList = [];
  List<Profile> _filteredProfileList = [];
  bool _isLoading = true;

  String _selectedFilter = "All";
  String _searchText = "";

  @override
  void initState() {
    super.initState();
    _onGetProfileListing();
  }

  @override
  Widget build(BuildContext context) {
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
                        _applyFilter();
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
                  _filterContainer("All"),
                  SizedBox(width: 8.0),
                  _filterContainer("Favourite"),
                ],
              ),
            ),
            Expanded(
              child:
                  _isLoading
                      ? LoadingWidget()
                      : ProfileListWidget(profileList: _filteredProfileList),
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

  Widget _filterContainer(String filter) {
    bool isSelected = _selectedFilter == filter;

    return InkWell(
      onTap: () {
        setState(() {
          _selectedFilter = filter;
          _applyFilter();
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

  void _applyFilter() {
    List<Profile> filteredProfiles = List.from(_allProfileList);

    if (_selectedFilter == "Favourite") {
      filteredProfiles =
          filteredProfiles.where((profile) => profile.isFavourite).toList();
    }

    if (_searchText.isNotEmpty) {
      filteredProfiles =
          filteredProfiles.where((profile) {
            final query = _searchText.toLowerCase();
            return profile.firstName!.toLowerCase().contains(query) ||
                profile.lastName!.toLowerCase().contains(query) ||
                profile.email!.toLowerCase().contains(query);
          }).toList();
    }

    setState(() {
      _filteredProfileList = filteredProfiles;
    });
  }

  Future<void> _onGetProfileListing() async {
    try {
      List<Profile> profiles = await _profileDao.onGetAllProfiles();

      setState(() {
        _allProfileList = profiles;
        _filteredProfileList = profiles;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error Fetching Profile Listing: $e')),
      );
    }
  }
}
