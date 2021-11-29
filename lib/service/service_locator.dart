import 'package:get_it/get_it.dart';
import 'package:nardilibraryapp/ui/views/verify_email_screen.dart';
import 'package:nardilibraryapp/viewmodels/book_detail_viewmodel.dart';

import 'package:nardilibraryapp/viewmodels/forgot_password_viewmodel.dart';
import 'package:nardilibraryapp/viewmodels/homepage_viemodel.dart';
import 'package:nardilibraryapp/viewmodels/login_form_viewmodel.dart';
import 'package:nardilibraryapp/viewmodels/nardaccess_viewmodel.dart';
import 'package:nardilibraryapp/viewmodels/signup_viewmodel.dart';
import 'package:nardilibraryapp/viewmodels/verify_email_viewmodel.dart';

GetIt serviceLocator = GetIt.I;
// We register all app dependencies here with the service locator
void setUpServiceLocator() {
  serviceLocator
      .registerFactory<LoginFormViewModel>(() => LoginFormViewModel());
  serviceLocator.registerFactory<SignUpViewmodel>(() => SignUpViewmodel());
  serviceLocator
      .registerFactory<BookDetailViewmodel>(() => BookDetailViewmodel());
  serviceLocator.registerFactory<ForgotPasswordViewmodel>(
      () => ForgotPasswordViewmodel());
  serviceLocator.registerFactory<HomePageViewmodel>(() => HomePageViewmodel());
  serviceLocator.registerFactory<NardViewmodel>(() => NardViewmodel());
  serviceLocator
      .registerFactory<VerifyEmailViewmodel>(() => VerifyEmailViewmodel());
}
