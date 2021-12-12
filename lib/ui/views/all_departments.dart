import 'package:flutter/material.dart';
import 'package:nardilibraryapp/model/bookresource/department.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';
import 'package:nardilibraryapp/resources/app_style.dart';
import 'package:nardilibraryapp/util/logger.dart';
import 'package:nardilibraryapp/viewmodels/departments_viewmodel.dart';
import 'package:nardilibraryapp/widgets/custom_app_bar.dart';
import 'package:nardilibraryapp/widgets/progressar.dart';
import 'package:provider/provider.dart';

import 'department_book.dart';

class AllDepartments extends StatefulWidget {
  static const route = 'departments';

  @override
  State<StatefulWidget> createState() => _AllDepartmentState();
}

class _AllDepartmentState extends State<AllDepartments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBAr(
        title: 'Departments',
        icon: Icon(
          Icons.ac_unit,
          color: AppColors.white,
        ),
      ),
      body: context.watch<AllDepartmentsViewmodel>().isLoading
          ? ProgressBar(context.watch<AllDepartmentsViewmodel>().isLoading)
          : ListView.builder(
              itemCount: context.read<AllDepartmentsViewmodel>().lenght,
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    int id = context
                    
                        .read<AllDepartmentsViewmodel>()
                        .departments[index]
                        .id;
                        String title = context
                    
                        .read<AllDepartmentsViewmodel>()
                        .departments[index]
                        .name;
                  

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => DepartmentBooks(
                                  departmentId: id,
                                  departmentName: title
                                )));
                    AppLogger logger = AppLogger();
                    logger.logInfo(id.toString());
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        shape: BoxShape.rectangle,
                      ),
                      child: Card(
                        elevation: 1,
                        color: AppColors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Text(
                            context
                                .read<AllDepartmentsViewmodel>()
                                .departments[index]
                                .name,
                            style: AppStyle.mediumText,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
    );
  }
}
