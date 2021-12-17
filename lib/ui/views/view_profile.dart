import 'package:flutter/material.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';
import 'package:nardilibraryapp/resources/app_style.dart';
import 'package:nardilibraryapp/viewmodels/view_profile_viewmodel.dart';
import 'package:nardilibraryapp/widgets/custom_app_bar.dart';
import 'package:nardilibraryapp/widgets/progressar.dart';
import 'package:provider/provider.dart';

class ViewProfile extends StatefulWidget {
  static const route = '/viewprofile';
  final String? email;
  const ViewProfile({this.email});

  @override
  State<StatefulWidget> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  @override
  void initState() {
    super.initState();
    context.read<ViewProfileViewmodel>().getUser(widget.email!, context);
  }

  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<ViewProfileViewmodel>(context);
    return Scaffold(
      appBar: CustomAppBAr(title: "Profile", icon: Icon(Icons.ac_unit)),
      body: SafeArea(
        child: viewmodel.isLoading
            ? ProgressBar(viewmodel.isLoading)
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/profile.png"),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                          "${viewmodel.user!.firstName} ${viewmodel.user!.surname}",
                          style: AppStyle.headline1),
                    ),
                    Text("Username:  ${viewmodel.user!.userName}" ?? "Not Set",
                        style: AppStyle.mediumText),
                         const SizedBox(
                      height: 8,
                    ),
                         Text("UserID:  ${viewmodel.user!.id.toString()}" ?? "Not Set",
                        style: AppStyle.mediumText),
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppColors.nardOrange),
                        ),
                        child: Center(
                            child: Text(viewmodel.user!.profiled ? "Online":"Offline",
                                style: AppStyle.smallGreenText)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ProfileItem(
                      icon: const Icon(Icons.school),
                      title: viewmodel.user!.institution ?? "Not Set",
                    ),
                    ProfileItem(
                        icon: const Icon(Icons.email),
                        title: viewmodel.user!.email ?? "Not Set"),
                    ProfileItem(
                        icon: const Icon(Icons.phone),
                        title: viewmodel.user!.phone ?? "Not Set"),
                    ProfileItem(
                        icon: const Icon(Icons.ac_unit),
                        title: viewmodel.user!.department ?? "Not Set"),
                    ProfileItem(
                        icon: const Icon(Icons.calendar_today),
                        title: viewmodel.user!.dob ?? "Not Set"),
                    ProfileItem(
                        icon: const Icon(Icons.home),
                        title: viewmodel.user!.address ?? "Not"),
                    ProfileItem(
                        icon: const Icon(Icons.date_range),
                        title: viewmodel.user!.commencementYear ?? 'Not Set'),
                    ProfileItem(
                        icon: const Icon(Icons.pin_drop),
                        title: viewmodel.user!.state),
                    ProfileItem(
                        icon: const Icon(Icons.code),
                        title: viewmodel.user!.folio)
                  ],
                ),
              ),
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  final Icon? icon;
  final String? title;
  const ProfileItem({required this.icon,  this.title ="Not Set"});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: icon!,
          ),
          Text(title!, style: AppStyle.mediumText)
        ],
      ),
    );
  }
}
