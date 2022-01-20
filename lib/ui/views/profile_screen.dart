import 'package:flutter/material.dart';
import 'package:nardilibraryapp/model/Books.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';
import 'package:nardilibraryapp/resources/app_style.dart';
import 'package:nardilibraryapp/service/storage/storage_service_impl.dart';
import 'package:nardilibraryapp/ui/views/forgot_password_screen.dart';
import 'package:nardilibraryapp/ui/views/update_profile.dart';
import 'package:nardilibraryapp/ui/views/view_profile.dart';
import 'package:nardilibraryapp/viewmodels/login_form_viewmodel.dart';
import 'package:nardilibraryapp/viewmodels/view_profile_viewmodel.dart';
import 'package:nardilibraryapp/widgets/custom_home_section.dart';
import 'package:nardilibraryapp/widgets/progressar.dart';
import 'package:provider/provider.dart';

import 'nard_access.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var viewmodel = Provider.of<LoginFormViewModel>(context);
    return Scaffold(
        backgroundColor: AppColors.faintColor,
        body: SafeArea(
          child: viewmodel.isGetUser
              ? ProgressBar(viewmodel.isGetUser)
              : Column(
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
                                const SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  "Account",
                                  style: AppStyle.whiteBoldText,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                    "User ID ${viewmodel.id ?? viewmodel.user!.id}",
                                    style: AppStyle.profileText),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                    "Logged In:  ${viewmodel.username ?? viewmodel.user!.userName}",
                                    style: AppStyle.profileText),
                              ],
                            ),
                            const CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage("assets/profile.png"),
                            )
                          ],
                        ),
                      ),
                    ),
                    ProfileMenu(
                        title: "View Full Profile",
                        icon: Icons.person,
                        onpressed: () {
                          String? email =
                              viewmodel.email ?? viewmodel.user!.email;

                          print(email);

                          if (email != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ViewProfile(email: email),
                              ),
                            );
                          }
                        }),
                    ProfileMenu(
                        title: "Edit Profile",
                        icon: Icons.edit,
                        onpressed: () {
                          Navigator.pushNamed(context, UpdateProfile.route);
                        }),
                    ProfileMenu(
                      title: "Change Password",
                      icon: Icons.lock,
                      onpressed: () {
                        Navigator.pushNamed(context, ForgotPassword.routeName);
                      },
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    // ProfileMenu(
                    //     title: "Share to Friends", icon: Icons.share_outlined),
                    ProfileMenu(
                      title: "Log Out",
                      icon: Icons.logout,
                      onpressed: () {
                        StorageServiceImpl service =
                            StorageServiceImpl.instance;
                        service.clear();
                        Navigator.popAndPushNamed(
                            context, NardAccess.routeName);
                      },
                      color: Colors.red,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //
                    //
                    // HomeSection(sectionTitle: "Published Books (${BookTest.getbooks().length})", books:BookTest.getbooks(), seeMore: (){}),
                  ],
                ),
        ));
  }
}

class ProfileMenu extends StatelessWidget {
  String title;
  IconData icon;
  Color? color;
  VoidCallback? onpressed;
  ProfileMenu(
      {required this.title,
      required this.icon,
      this.onpressed,
      this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: AppStyle.mediumText,
                ),
                Icon(
                  icon,
                  color: color,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
