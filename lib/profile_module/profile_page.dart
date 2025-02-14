import 'package:attandenceapp/appTheme/appColors.dart';
import 'package:attandenceapp/appTheme/appTextTheme.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: scaffoldColor,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: Text("Profile",
              style: mediumTextBold.copyWith(color: appBarTitleTextColor)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          child: Column(
            children: [
              // Profile Picture
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2.5,
                        offset: Offset(0, 1))
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: themeColor,
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Color(0xffD3D3D3), width: 2),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset("assets/images/profileImage.jpg",
                            height: MediaQuery.of(context).size.height / 12,
                            width: MediaQuery.of(context).size.width / 5.5,
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Michael Mitc",
                          style: mediumTextBold,
                        ),
                        Text(
                          "App Developer",
                          style: smallTextRegular,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // User Info
              Card(
                color: scaffoldColor,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.person, color: Colors.blue),
                      title: Text("John Doe"),
                      subtitle: Text("Employee ID: 12345"),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.business, color: Colors.blue),
                      title: Text("Department"),
                      subtitle: Text("Software Development"),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.email, color: Colors.blue),
                      title: Text("Email"),
                      subtitle: Text("john.doe@example.com"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Attendance Summary
              Card(
                color: scaffoldColor,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.check_circle, color: Colors.green),
                      title: Text("Total Present Days"),
                      trailing: Text("20"),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.cancel, color: Colors.red),
                      title: Text("Total Absent Days"),
                      trailing: Text("5"),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.pie_chart, color: Colors.blue),
                      title: Text("Attendance Percentage"),
                      trailing: Text("80%"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              Card(
                color: scaffoldColor,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.edit, color: Colors.green),
                      title: Text("Edit Profile"),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        size: 20,
                      ),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.settings, color: Colors.grey),
                      title: Text("Settings"),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        size: 20,
                      ),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.logout, color: Colors.red),
                      title: Text("Logout"),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
