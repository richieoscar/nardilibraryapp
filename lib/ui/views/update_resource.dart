// import 'package:flutter/material.dart';
// import 'package:nardilibraryapp/constants/state.dart';
// import 'package:nardilibraryapp/model/auth/user_info.dart';
// import 'package:nardilibraryapp/resources/app_colors.dart';
// import 'package:nardilibraryapp/resources/app_style.dart';
// import 'package:nardilibraryapp/util/utils.dart';
// import 'package:nardilibraryapp/viewmodels/login_form_viewmodel.dart';
// import 'package:nardilibraryapp/viewmodels/search_result_viewmodel.dart';
// import 'package:nardilibraryapp/viewmodels/signup_viewmodel.dart';
// import 'package:nardilibraryapp/widgets/custom_app_bar.dart';
// import 'package:nardilibraryapp/widgets/custom_button.dart';
// import 'package:nardilibraryapp/widgets/custome_text_form_field.dart';
// import 'package:nardilibraryapp/widgets/password_text_field.dart';
// import 'package:nardilibraryapp/widgets/progressar.dart';
// import 'package:provider/provider.dart';

// import 'forgot_password_screen.dart';

// class AdminUpdateResource extends StatefulWidget {
//   static const route = '/adminupdateResource';
//   const AdminUpdateResource({Key? key}) : super(key: key);

//   @override
//   _AdminUpdateResourceState createState() => _AdminUpdateResourceState();
// }

// class _AdminUpdateResourceState extends State<AdminUpdateResource> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _authorController = TextEditingController();
//   final TextEditingController _publishedController = TextEditingController();
//   final TextEditingController _departmentController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
//   final TextEditingController _searchController = TextEditingController();

//   final _formKey = GlobalKey<FormState>();
//   String? _genderDropDownValue;
//   String? _stateDropDownValue;
//   bool isChecked = false;
//   bool notChecked = false;

//   @override
//   Widget build(BuildContext context) {
//     initControllers();
//     final viewmodel = Provider.of<LoginFormViewModel>(context);
//     return Scaffold(
//       appBar: CustomAppBAr(title: "Admin", icon: Icon(Icons.ac_unit)),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 search(),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 CustomTextFormField(
//                     headerTitle: "Resource Name",
//                     hintText: viewmodel.user!.firstName,
//                     controller: _nameController,
//                     inputType: TextInputType.text),
//                 const SizedBox(height: 10),
//                 CustomTextFormField(
//                     headerTitle: "Author",
//                     hintText: viewmodel.user!.surname ?? "",
//                     controller: _authorController,
//                     inputType: TextInputType.text),
//                 const SizedBox(height: 10),
//                 CustomTextFormField(
//                   headerTitle: "Published",
//                   hintText: viewmodel.user!.userName ?? "",
//                   controller: _publishedController,
//                   inputType: TextInputType.text,
//                 ),
//                 const SizedBox(height: 10),
//                 CustomButton(
//                     label: "SAVE", onclick: () => _save(), color: Colors.green),
//                 const SizedBox(height: 42),
//                 ProgressBar(context.watch<LoginFormViewModel>().isVisible),
//                 const SizedBox(height: 20),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void initControllers() {
//     final viewmodel = Provider.of<LoginFormViewModel>(context);

//     viewmodel.user!.firstName != null
//         ? _firstnameController.text = viewmodel.user!.firstName
//         : null;
//     viewmodel.user!.surname != null
//         ? _lastnameController.text = viewmodel.user!.surname
//         : null;
//     viewmodel.user!.userName != null
//         ? _usernameController.text = viewmodel.user!.userName
//         : null;
//     viewmodel.user!.email != null
//         ? _emailController.text = viewmodel.user!.email
//         : null;
//     viewmodel.user!.phone != null
//         ? _phoneNumberController.text = viewmodel.user!.phone
//         : null;
//     viewmodel.user!.firstName != null
//         ? _genderController.text = viewmodel.user!.gender
//         : null;
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _nameController.dispose();
//     _authorController.dispose();
//     _publishedController.dispose();
//     _descriptionController.dispose();
//   }

//   Widget search(BuildContext context) {
//     return Expanded(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10),
//         child: Container(
//           width: double.infinity,
//           height: 50,
//           decoration: BoxDecoration(
//             color: AppColors.mediumLightGrey,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Row(
//             children: [
//               Expanded(
//                 child: TextField(
//                   controller: _searchController,
//                   textInputAction: TextInputAction.search,
//                   cursorColor: AppColors.backgroundColor,
//                   decoration: InputDecoration(
//                     suffixIcon: IconButton(
//                       onPressed: () {
//                         String query = _searchController.text;
//                         query.isEmpty
//                             ? AppUtils.showSnackBar(
//                                 context, "Search field empty")
//                             : context
//                                 .read<SearchResultViewmodel>()
//                                 .findResource(context, query);
//                       },
//                       icon: Icon(Icons.search_rounded,
//                           color: AppColors.searcIconColor),
//                     ),
//                     border: InputBorder.none,

//                     contentPadding:
//                         EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                     hintText: "Search Books",
//                     // label:  Padding(
//                     //   padding: EdgeInsets.all(8.0),
//                     //   child:  Text("Search Books", style: AppStyle.mediumText,),
//                     // ),
//                   ),
//                 ),
//               ),
//               // Padding(
//               //   padding: const EdgeInsets.all(8.0),
//               //   child: Expanded(child: Icon(Icons.search_rounded, color: AppColors.searcIconColor)),
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _save() {
//     if (_formKey.currentState!.validate()) {
//       context.read<LoginFormViewModel>().isVisible = true;
//       UserInfo info = UserInfo(
//           _usernameController.text.trim(),
//           context.read<LoginFormViewModel>().user!.password,
//           _addressController.text.trim(),
//           _commencementController.text.trim(),
//           _departmentController.text.trim(),
//           _designationController.text.trim(),
//           _dobController.text.trim(),
//           _emailController.text.trim(),
//           _firstnameController.text.trim(),
//           context.read<LoginFormViewModel>().user!.folio,
//           _genderController.text.trim(),
//           _institutionController.text.trim(),
//           _otherNameController.text.trim(),
//           _phoneNumberController.text.trim(),
//           int.parse(_roleController.text.trim()),
//           _stateController.text.trim(),
//           _lastnameController.text.trim());
//       context.read<LoginFormViewModel>().updateUser(info, context);
//     }
//   }

//   Widget _genderDropDown(
//       String title, List<String> genders, String? dropDownValue) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//           child: Text(title, style: AppStyle.smallBoldText),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Container(
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: AppColors.faintColor),
//               child: DropdownButton<String>(
//                 isExpanded: true,
//                 hint: Text("Select"),
//                 value: dropDownValue,
//                 icon: const Align(
//                     alignment: Alignment.centerRight,
//                     child: Icon(
//                       Icons.arrow_drop_down_rounded,
//                     )),
//                 iconSize: 24,
//                 elevation: 16,
//                 style: TextStyle(color: AppColors.nardBlack),
//                 onChanged: (value) {
//                   _genderDropDownValue = value!;
//                   setState(() {
//                     _genderDropDownValue;
//                     print(_genderDropDownValue);
//                   });
//                 },
//                 items: genders.map((value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10),
//                       child: Text(value),
//                     ),
//                   );
//                 }).toList(),
//               )),
//         ),
//       ],
//     );
//   }

//   Widget _stateDropDown(
//       String title, List<String> states, String? dropDownValue) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//           child: Text(title, style: AppStyle.smallBoldText),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Container(
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: AppColors.faintColor),
//               child: DropdownButton<String>(
//                 isExpanded: true,
//                 hint: Text("Select"),
//                 value: dropDownValue,
//                 icon: const Align(
//                     alignment: Alignment.centerRight,
//                     child: Icon(
//                       Icons.arrow_drop_down_rounded,
//                     )),
//                 iconSize: 24,
//                 elevation: 16,
//                 style: TextStyle(color: AppColors.nardBlack),
//                 onChanged: (value) {
//                   _stateDropDownValue = value!;
//                   setState(() {
//                     _stateDropDownValue;
//                     print(_stateDropDownValue);
//                   });
//                 },
//                 items: states.map((value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10),
//                       child: Text(value),
//                     ),
//                   );
//                 }).toList(),
//               )),
//         ),
//       ],
//     );
//   }
// }
