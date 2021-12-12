import 'package:flutter/material.dart';
import 'package:nardilibraryapp/constants/state.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';
import 'package:nardilibraryapp/resources/app_style.dart';
import 'package:nardilibraryapp/ui/views/add_resource.dart';
import 'package:nardilibraryapp/ui/views/admin_sign_up.dart';
import 'package:nardilibraryapp/ui/views/delete_user_screen.dart';
import 'package:nardilibraryapp/widgets/admin_options.dart';
import 'package:nardilibraryapp/widgets/custom_app_bar.dart';

class AdminFunction extends StatelessWidget {
  const AdminFunction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: false,
        title: Text(
          "Admin",
          style: AppStyle.appBarText,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //User ations
                SizedBox(
                  height: 25,
                ),
                Text("Users", style: AppStyle.headline2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: AdminOptions(
                        title: "Add User",
                        iconData: Icons.person,
                        backgroundColor: Colors.blue,
                        onpressed: () {
                          Navigator.pushNamed(context, AdminSignUp.route);
                        },
                      ),
                    ),
                    Expanded(
                      child: AdminOptions(
                        title: "Delete User",
                        iconData: Icons.delete,
                        backgroundColor: Colors.red,
                        onpressed: (){
                           Navigator.pushNamed(context, DeleteUser.routeName);
                        },
                      ),
                    ),
                    Expanded(
                        child: AdminOptions(
                      title: "Update User",
                      iconData: Icons.update,
                      backgroundColor: Colors.yellow,
                    )),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                //Resource action
                Text("Resources", style: AppStyle.headline2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: AdminOptions(
                        title: "Add Resource",
                        iconData: Icons.bookmark_add_rounded,
                        backgroundColor: Colors.purple,
                      ),
                    ),
                    Expanded(
                      child: AdminOptions(
                        title: "Delete Resource",
                        iconData: Icons.delete_rounded,
                        backgroundColor: Colors.red[300],
                      ),
                    ),
                    Expanded(
                      child: AdminOptions(
                          title: "Update Resource",
                          iconData: Icons.system_update,
                          backgroundColor: Colors.yellow[300]),
                    ),
                  ],
                ),
                //Department
                SizedBox(
                  height: 25,
                ),
                Text("Department", style: AppStyle.headline2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: AdminOptions(
                        title: "Add Department",
                        iconData: Icons.school,
                        backgroundColor: AppColors.backgroundColor,
                      ),
                    ),
                    Expanded(
                      child: AdminOptions(
                          title: "Add Unit",
                          iconData: Icons.ad_units,
                          backgroundColor: AppColors.backgroundColor),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
