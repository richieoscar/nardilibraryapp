import 'package:flutter/material.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';
import 'package:nardilibraryapp/ui/views/add_department.dart';
import 'package:nardilibraryapp/ui/views/add_resource.dart';
import 'package:nardilibraryapp/ui/views/admin_dashboard_screen.dart';
import 'package:nardilibraryapp/ui/views/admin_functions.dart';
import 'package:nardilibraryapp/ui/views/admin_sign_up.dart';
import 'package:nardilibraryapp/ui/views/admin_update_user.dart';
import 'package:nardilibraryapp/ui/views/all_departments.dart';
import 'package:nardilibraryapp/ui/views/all_featured_releases.dart';
import 'package:nardilibraryapp/ui/views/book_shelf_screen.dart';
import 'package:nardilibraryapp/ui/views/create_new_password.dart';
import 'package:nardilibraryapp/ui/views/delete_resource.dart';
import 'package:nardilibraryapp/ui/views/delete_user_screen.dart';
import 'package:nardilibraryapp/ui/views/update_profile.dart';
import 'package:nardilibraryapp/ui/views/user_dashboard_screen.dart';
import 'package:nardilibraryapp/ui/views/department_book.dart';
import 'package:nardilibraryapp/ui/views/details_screen.dart';
import 'package:nardilibraryapp/ui/views/finish_registration.dart';
import 'package:nardilibraryapp/ui/views/forgot_password_screen.dart';
import 'package:nardilibraryapp/ui/views/home_page.dart';
import 'package:nardilibraryapp/ui/views/nard_access.dart';
import 'package:nardilibraryapp/ui/views/password_reset_complete.dart';
import 'package:nardilibraryapp/ui/views/splash_screen.dart';
import 'package:nardilibraryapp/ui/views/verify_email_screen.dart';
import 'package:nardilibraryapp/ui/views/view_profile.dart';
import 'package:nardilibraryapp/viewmodels/all_featured_viewmodel.dart';
import 'package:nardilibraryapp/viewmodels/book_detail_viewmodel.dart';
import 'package:nardilibraryapp/viewmodels/createnew_password_viewmodel.dart';
import 'package:nardilibraryapp/viewmodels/delete_user_viemodel.dart';
import 'package:nardilibraryapp/viewmodels/department_books_viewmodel.dart';
import 'package:nardilibraryapp/viewmodels/departments_viewmodel.dart';
import 'package:nardilibraryapp/viewmodels/finish_registration_viewmodel.dart';
import 'package:nardilibraryapp/viewmodels/forgot_password_viewmodel.dart';
import 'package:nardilibraryapp/viewmodels/homepage_viemodel.dart';
import 'package:nardilibraryapp/viewmodels/login_form_viewmodel.dart';
import 'package:nardilibraryapp/viewmodels/nardaccess_viewmodel.dart';
import 'package:nardilibraryapp/viewmodels/search_result_viewmodel.dart';
import 'package:nardilibraryapp/viewmodels/signup_viewmodel.dart';
import 'package:nardilibraryapp/viewmodels/verify_email_viewmodel.dart';
import 'package:nardilibraryapp/viewmodels/view_profile_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();


  runApp(
    MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => NardViewmodel()),
      ChangeNotifierProvider(create: (_) => LoginFormViewModel()),
      ChangeNotifierProvider(create: (_) => ForgotPasswordViewmodel()),
      ChangeNotifierProvider(create: (_) => CreateNewPasswordViewmodel()),
      ChangeNotifierProvider(create: (_) => VerifyEmailViewmodel()),
       ChangeNotifierProvider(create: (_) => SignUpViewmodel()),
        ChangeNotifierProvider(create: (_) => HomePageViewmodel()),
        ChangeNotifierProvider(create: (_) => FinishRegistrationViewmodel()),
         ChangeNotifierProvider(create: (_) => AllDepartmentsViewmodel()),
          ChangeNotifierProvider(create: (_) => AllFeaturedViewmodel()),
           ChangeNotifierProvider(create: (_) => DepartmentBooksViewmodel()),
            ChangeNotifierProvider(create: (_) => SearchResultViewmodel()),
             ChangeNotifierProvider(create: (_) => BookDetailViewmodel()),
              ChangeNotifierProvider(create: (_) =>DeleteUserViewmodel()),
               ChangeNotifierProvider(create: (_) =>ViewProfileViewmodel()),
      
      ],
    child: Home(),

    // Home(),
  ));
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "NardLibraryApp",
  // home: AddResource(),
      theme: ThemeData.light().copyWith(
        primaryColor: AppColors.nardDark,
        buttonTheme: ButtonThemeData(
          buttonColor: AppColors.backgroundColor
        )
      ),
  initialRoute: Splash.routeName,
      routes: {
        Splash.routeName: (_) => const Splash(),
        NardAccess.routeName: (_) => const NardAccess(),
        ForgotPassword.routeName: (_) => ForgotPassword(),
        VerifyEmail.route: (_) => const VerifyEmail(),
        CreateNewPassword.routeName: (_) => CreateNewPassword(),
        FinishRegistration.routeName: (_) => const FinishRegistration(),
        PasswordResetComplete.routeName: (_)=> const PasswordResetComplete(),
        HomePage.routeName: (_) => const HomePage(),
        BookDetails.routeName: (_) => const BookDetails(),
        BookShelf.routeName: (_)=> const BookShelf(),
        UserDashboard.routeName : (_) => UserDashboard(),
        AdminDashboard.routeName:(_) => AdminDashboard(),
        AllDepartments.route :(_) => AllDepartments(),
        DepartmentBooks.route :(_) => DepartmentBooks(),
        AllFeaturedRelease.route:(_)=>  AllFeaturedRelease(),
        AddResource.route:(_)=> AddResource(),
        AdminSignUp.route: (_)=> AdminSignUp(),
        DeleteUser.routeName:(_)=> DeleteUser(),
        ViewProfile.route:(_)=> ViewProfile(),
        UpdateProfile.route:(_)=> UpdateProfile(),
        AdminUpdateUserProfile.route:(_)=> AdminUpdateUserProfile(),
        DeleteUser.routeName:(_) => DeleteResource(),
        AddDepartment.routeName:(_)=>AddDepartment(),
        DeleteResource.routeName:(_)=> DeleteResource()

      },
    );
  }
}
