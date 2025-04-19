import 'package:flutter/material.dart';
import 'package:profile_listing/utils/styles.dart';
import 'package:profile_listing/view/widget/profile_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                  Container(
                    height: 25.0,
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(
                      "All",
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Container(
                    height: 25.0,
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(
                      "Favourite",
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: ProfileListWidget(profileList: [])),
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
}
