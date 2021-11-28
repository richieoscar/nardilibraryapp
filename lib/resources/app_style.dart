import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';

class AppStyle {
  static TextStyle headline1 = GoogleFonts.montserrat(
      textStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          fontSize: 24,
          color: AppColors.headLineColor));

  static TextStyle smallText = GoogleFonts.montserrat(
      textStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontSize: 12,
          color: AppColors.headLineColor));

  static TextStyle mediumText = GoogleFonts.montserrat(
      textStyle: TextStyle(
          fontWeight: FontWeight.w300,
          fontStyle: FontStyle.normal,
          fontSize: 14,
          color: AppColors.nardBlack));
  static TextStyle smallBoldText = GoogleFonts.montserrat(
      textStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
          fontSize: 12,
          color: AppColors.pasejicBlack));

  static TextStyle mediumBoldText = GoogleFonts.montserrat(
      textStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
          fontSize: 18,
          color: AppColors.nardBlack));

   static TextStyle sectionTitleText = GoogleFonts.montserrat(
      textStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          fontSize: 16,
          color: AppColors.nardBlack));

  static TextStyle blueText = GoogleFonts.montserrat(
      textStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          fontSize: 14,
          color: AppColors.primaryBlue));

  static TextStyle buttonText = GoogleFonts.montserrat(
      textStyle: TextStyle(fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: 16,
      color: AppColors.white)
      );

  static TextStyle boldButtonText(Color color) {
    return GoogleFonts.montserrat(
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        fontSize: 18,
        color: color);
  }

  static TextStyle whiteBoldText = GoogleFonts.montserrat(
      textStyle: TextStyle(fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: 18,
      color: AppColors.white)
      );
      static TextStyle whiteText = GoogleFonts.montserrat(
      textStyle: TextStyle(fontWeight: FontWeight.w300,
      fontStyle: FontStyle.normal,
      fontSize: 16,
      color: AppColors.white)
      );
      static TextStyle blackBoldText = GoogleFonts.montserrat(
      textStyle: TextStyle(fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: 18,
      color: AppColors.nardBlack)
      );

  static TextStyle appBarText = GoogleFonts.montserrat(
      textStyle: TextStyle(
        fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: 18,
      color: AppColors.pasejicBlack
      )
      );
      static TextStyle verSmallText = GoogleFonts.montserrat(
      textStyle: TextStyle(
        fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 12,
      color: AppColors.lightDark
      )
      );

      static TextStyle yelloSmalText = GoogleFonts.montserrat(
      textStyle: TextStyle(
        fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: 14,
      color: AppColors.nardOrange
      )
      );
       static TextStyle userNameText = GoogleFonts.montserrat(
      textStyle: TextStyle(
        fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: 15,
      color: AppColors.lightDark
      )
      );

      static TextStyle bookDetailText = GoogleFonts.montserrat(
      textStyle: TextStyle(
        fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: 12,
      color: AppColors.white
      )
      );
      static TextStyle bookDetailBoldText = GoogleFonts.montserrat(
      textStyle: TextStyle(
        fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: 14,
      color: AppColors.white
      )
      );
       static TextStyle bookDetailBodyText = GoogleFonts.montserrat(
      textStyle: TextStyle(
        fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: 12,
      color: AppColors.detailBody,
      letterSpacing: 1.0
      )
      );

      static TextStyle profileText = GoogleFonts.montserrat(
      textStyle: TextStyle(
        fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 12,
      color: AppColors.white
      )
      );

}
