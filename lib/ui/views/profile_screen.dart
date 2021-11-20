import 'package:flutter/material.dart';
import 'package:nardilibraryapp/model/Books.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';
import 'package:nardilibraryapp/resources/app_style.dart';
import 'package:nardilibraryapp/widgets/custom_home_section.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.faintColor,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 120,
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      
                     
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 30,),
                            Text(
                              "Oscar Anyiam",
                              style: AppStyle.whiteBoldText,
                            ),
                            SizedBox(height: 8,),
                            Text("Medical Doctor",style:AppStyle.profileText),
                             SizedBox(height: 8,),
                            Text("User ID 9082QW22",style:AppStyle.profileText),
                          ],
                        ),
                      
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/profile.png"),
                      )
                    ],
                  ),
                ),
              ),
             ProfileMenu(title: "View Full Profile", icon: Icons.person),
             ProfileMenu(title: "Edit Profile", icon: Icons.edit),
             ProfileMenu(title: "Change Password", icon: Icons.lock),
             
             SizedBox(height: 10,),
             ProfileMenu(title: "Share to Friends", icon: Icons.share_outlined),
             ProfileMenu(title: "About Us", icon: Icons.face_sharp),
              SizedBox(height: 10,),
            // HomeSection(sectionTitle: "Published Books (${BookTest.getbooks().length})", books:BookTest.getbooks(), seeMore: (){})

            ],
          ),
        ));
  }
}

class ProfileMenu extends StatelessWidget {
  String title;
  IconData icon;
  ProfileMenu({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: AppStyle.mediumText,),
              Icon(icon)
            ],
          ), 
        ),
      ),
    );
  }
}
