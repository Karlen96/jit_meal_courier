import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'app_fonts.dart';

final base = ThemeData.light();

final lightTheme = base.copyWith(
  shadowColor: AppColors.yellow,
  colorScheme: base.colorScheme.copyWith(
    primary: AppColors.white,
    onPrimary: AppColors.darkBlue,
  ),
  tabBarTheme: TabBarTheme(
    unselectedLabelStyle: base.primaryTextTheme.button!.copyWith(
      color: AppColors.white,
    ),
    labelStyle: const TextStyle(
      color: AppColors.darkBlue,
      fontFamily: FontFamily.Roboto,
      fontWeight: FontWeight.normal,
      fontSize: 16,
      height: 1,
    ),
    indicator: BoxDecoration(
      borderRadius: BorderRadius.circular(13),
      color: AppColors.white,
    ),
    indicatorSize: TabBarIndicatorSize.tab,
    labelColor: AppColors.darkBlue,
    unselectedLabelColor: AppColors.white,
    labelPadding: const EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 5,
    ),
  ),
  primaryColor: AppColors.yellow,
  // shadowColor: Colors.grey[300],
  scaffoldBackgroundColor: AppColors.backgroundColor,
  dividerColor: AppColors.backgroundColor2,
  dividerTheme: base.dividerTheme.copyWith(
    space: 1,
    color: AppColors.backgroundColor2,
  ),
  primaryIconTheme: base.primaryIconTheme.copyWith(color: AppColors.darkBlue),
  iconTheme: base.iconTheme.copyWith(color: AppColors.darkBlue),
  appBarTheme: base.appBarTheme.copyWith(
    color: AppColors.white,
    centerTitle: true,
    elevation: 2,
    iconTheme: const IconThemeData(
      color: AppColors.darkBlue,
    ),
    titleTextStyle: base.primaryTextTheme.headline6!.copyWith(
      fontFamily: FontFamily.Roboto,
      color: AppColors.darkBlue,
      fontWeight: FontWeight.w700,
      fontSize: 20,
      letterSpacing: -.4,
      height: 1.1,
    ),
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    toolbarTextStyle: base.textTheme
        .copyWith(
          bodyText1: base.textTheme.bodyText1!.copyWith(
            fontFamily: FontFamily.Roboto,
            color: AppColors.darkBlue,
            fontWeight: FontWeight.normal,
          ),
          headline6: base.textTheme.headline6!.copyWith(
            fontFamily: FontFamily.Roboto,
            color: AppColors.darkBlue,
            fontWeight: FontWeight.w700,
          ),
          headline3: base.textTheme.headline3!.copyWith(
            fontFamily: FontFamily.Roboto,
            color: AppColors.darkBlue,
            fontWeight: FontWeight.w700,
          ),
          headline4: base.textTheme.headline4!.copyWith(
            fontFamily: FontFamily.Roboto,
            color: AppColors.darkBlue,
            fontWeight: FontWeight.w500,
          ),
        )
        .bodyText2,
  ),
  bottomNavigationBarTheme: base.bottomNavigationBarTheme.copyWith(
    backgroundColor: AppColors.white,
    elevation: 0,
  ),
  chipTheme: base.chipTheme.copyWith(
    backgroundColor: Colors.transparent,
    labelPadding: const EdgeInsets.symmetric(horizontal: 20),
    labelStyle: const TextStyle(
      color: AppColors.darkBlue,
      fontWeight: FontWeight.w500,
      fontFamily: FontFamily.Roboto,
    ),
    selectedColor: AppColors.darkBlue,
    secondaryLabelStyle: const TextStyle(
      color: AppColors.darkBlue,
      fontWeight: FontWeight.w500,
      fontFamily: FontFamily.Roboto,
    ),
    secondarySelectedColor: Colors.transparent,
  ),
  sliderTheme: base.sliderTheme.copyWith(
    activeTrackColor: AppColors.red,
    inactiveTrackColor: AppColors.darkBlue70,
    overlayColor: Colors.transparent,
    thumbColor: AppColors.red,
    thumbShape: SliderComponentShape.noOverlay,
    valueIndicatorColor: AppColors.red,
  ),
  textSelectionTheme: base.textSelectionTheme.copyWith(
    cursorColor: AppColors.yellow,
    selectionHandleColor: AppColors.yellow,
  ),
  cupertinoOverrideTheme: const CupertinoThemeData(
    primaryColor: AppColors.yellow,
  ),
  drawerTheme: const DrawerThemeData(
    elevation: 0,
  ),
  brightness: Brightness.light,
  inputDecorationTheme: base.inputDecorationTheme.copyWith(
    errorStyle: base.primaryTextTheme.bodyText1!.copyWith(
      color: AppColors.red,
      fontFamily: FontFamily.Roboto,
    ),
    hintStyle: base.primaryTextTheme.bodyText1!.copyWith(
      color: AppColors.darkBlue.withOpacity(0.4),
      fontFamily: FontFamily.Roboto,
    ),
    helperStyle: base.primaryTextTheme.bodyText1!.copyWith(
      color: AppColors.darkBlue.withOpacity(0.4),
      fontFamily: FontFamily.Roboto,
    ),
    fillColor: AppColors.white,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(
        color: AppColors.backgroundColor1,
      ),
    ),
    errorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(
        color: AppColors.red,
      ),
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(
        color: AppColors.red,
      ),
    ),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(
        color: AppColors.backgroundColor1,
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(
        color: AppColors.yellow,
      ),
    ),
    filled: true,
    labelStyle: TextStyle(
      color: AppColors.darkBlue70,
      fontFamily: FontFamily.Roboto,
      fontWeight: FontWeight.normal,
      fontSize: 16,
      letterSpacing: -.32,
      height: 1.25,
    ),
  ),
  buttonTheme: base.buttonTheme.copyWith(
    textTheme: ButtonTextTheme.primary,
    buttonColor: AppColors.white,
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
      ),
      textStyle: MaterialStateProperty.resolveWith(
        (states) {
          return states.contains(MaterialState.disabled)
              ? TextStyle(
                  color: AppColors.yellow.withOpacity(0.5),
                  fontFamily: FontFamily.Roboto,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  height: 1.14,
                  letterSpacing: 0.0025,
                )
              : const TextStyle(
                  color: AppColors.yellow,
                  fontFamily: FontFamily.Roboto,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  height: 1.14,
                  letterSpacing: 0.0025,
                );
        },
      ),
      shape: MaterialStateProperty.resolveWith((state) {
        return const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        );
      }),
      foregroundColor: MaterialStateProperty.resolveWith((states) {
        return states.contains(MaterialState.disabled)
            ? AppColors.yellow.withOpacity(0.4)
            : AppColors.yellow;
      }),
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          return states.contains(MaterialState.disabled)
              ? AppColors.backgroundColor1.withOpacity(0.4)
              : AppColors.backgroundColor1;
        },
      ),
      overlayColor: MaterialStateProperty.all(
        AppColors.backgroundColor2.withOpacity(.5),
      ),
    ),
  ),
  tooltipTheme: TooltipThemeData(
    preferBelow: false,
    decoration: BoxDecoration(
      color: AppColors.yellow,
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shadowColor: MaterialStateProperty.all(AppColors.green),
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 10,
        ),
      ),
      overlayColor:
          MaterialStateProperty.all(AppColors.darkBlue70.withOpacity(.5)),
      elevation: MaterialStateProperty.all(0),
      textStyle: MaterialStateProperty.resolveWith(
        (states) {
          return const TextStyle(
            color: Colors.white,
            fontFamily: FontFamily.Roboto,
            fontWeight: FontWeight.w700,
            fontSize: 14,
            height: 1.14,
          );
        },
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
      ),
      foregroundColor: MaterialStateProperty.all(AppColors.white),
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          return states.contains(MaterialState.disabled)
              ? AppColors.green.withOpacity(0.5)
              : AppColors.green;
        },
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      minimumSize: const Size(88, 36),
      padding: const EdgeInsets.all(16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
      textStyle: const TextStyle(
        fontFamily: FontFamily.Roboto,
        fontWeight: FontWeight.w500,
      ),
    ).copyWith(
      side: MaterialStateProperty.resolveWith<BorderSide>(
        (states) {
          if (states.contains(MaterialState.pressed)) {
            return const BorderSide(color: AppColors.red);
          }
          return const BorderSide();
        },
      ),
    ),
  ),
  toggleableActiveColor: AppColors.red,
  textTheme: base.primaryTextTheme.copyWith(
    headline1: base.primaryTextTheme.headline1!.copyWith(
      color: AppColors.darkBlue,
      fontFamily: FontFamily.Roboto,
      fontWeight: FontWeight.w700,
      fontSize: 60,
      height: 1.17,
      letterSpacing: -0.005,
    ),
    headline2: base.primaryTextTheme.headline2!.copyWith(
      color: AppColors.darkBlue,
      fontFamily: FontFamily.Roboto,
      fontWeight: FontWeight.w700,
      fontSize: 48,
      height: 1.7,
    ),
    headline3: base.primaryTextTheme.headline3!.copyWith(
      color: AppColors.darkBlue,
      fontFamily: FontFamily.Roboto,
      fontWeight: FontWeight.w700,
      fontSize: 34,
      letterSpacing: 0.0025,
      height: 1.172,
    ),
    headline4: base.primaryTextTheme.headline4!.copyWith(
      color: AppColors.darkBlue,
      fontFamily: FontFamily.Roboto,
      fontWeight: FontWeight.w700,
      fontSize: 24,
      letterSpacing: 0.0025,
      height: 1.7,
    ),
    headline5: base.primaryTextTheme.headline5!.copyWith(
      fontFamily: FontFamily.Roboto,
      color: AppColors.darkBlue,
      fontWeight: FontWeight.w700,
      fontSize: 20,
      height: 1.15,
    ),
    headline6: base.primaryTextTheme.headline6!.copyWith(
      fontFamily: FontFamily.Roboto,
      color: AppColors.darkBlue,
      fontWeight: FontWeight.w700,
      fontSize: 18,
      letterSpacing: 0.0015,
      height: 1.17,
    ),
    subtitle1: base.primaryTextTheme.subtitle1!.copyWith(
      color: AppColors.darkBlue,
      fontFamily: FontFamily.Roboto,
      fontWeight: FontWeight.w700,
      fontSize: 16,
      height: 1.19,
      letterSpacing: 0.0015,
    ),
    subtitle2: base.primaryTextTheme.subtitle2!.copyWith(
      color: AppColors.darkBlue,
      fontFamily: FontFamily.Roboto,
      fontWeight: FontWeight.w700,
      fontSize: 14,
      height: 1.14,
    ),
    bodyText1: base.primaryTextTheme.bodyText1!.copyWith(
      color: AppColors.darkBlue,
      fontFamily: FontFamily.Roboto,
      fontWeight: FontWeight.w600,
      fontSize: 12,
      height: 1.17,
    ),
    bodyText2: base.primaryTextTheme.bodyText2!.copyWith(
      color: AppColors.darkBlue,
      fontFamily: FontFamily.Roboto,
      fontWeight: FontWeight.normal,
      fontSize: 10,
      height: 1.2,
    ),
    caption: const TextStyle(
      color: AppColors.darkBlue,
      fontFamily: FontFamily.Roboto,
      fontWeight: FontWeight.normal,
      fontSize: 8,
      height: 1.125,
      letterSpacing: 0.0004,
    ),
    overline: const TextStyle(
      color: AppColors.darkBlue,
      fontFamily: FontFamily.Roboto,
      fontWeight: FontWeight.normal,
      fontSize: 8,
      height: 1.125,
      letterSpacing: 0.0001,
    ),
    button: const TextStyle(
      color: Colors.white,
      fontFamily: FontFamily.Roboto,
      fontWeight: FontWeight.w700,
      fontSize: 14,
      height: 1.14,
    ),
  ),
);
