import 'package:flutter/material.dart';
import 'package:toyproject/ui/pages/customer_page/account_closure_page.dart';
import 'package:toyproject/ui/pages/customer_page/customer_page.dart';
import 'package:toyproject/ui/pages/customer_page/notice_detail_page.dart';
import 'package:toyproject/ui/pages/customer_page/notice_page.dart';
import 'package:toyproject/ui/pages/reservation_page/find_address_page.dart';
import 'package:toyproject/ui/pages/service_detail_page/applience_page.dart';
import 'package:toyproject/ui/pages/service_detail_page/movement_page.dart';
import 'package:toyproject/ui/pages/splash_page/splash_page.dart';
import '../../ui/pages/join_page/join_page.dart';
import '../../ui/pages/service_detail_page/housekeeper_page.dart';
import '../../ui/pages/service_detail_page/office_page.dart';
import '../../ui/pages/start_page/start_page.dart';
import 'package:toyproject/ui/pages/reservation_page/choice_address_page.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_page.dart';


class Move {
  static String MainPage = "/main";
  static String LoginPage = "/login";
  static String JoinSuccessPage = "/join/success";
  static String CategoryListPage = "/category/list";
  static String FindLoginIdPage = "/find/loginid";
  static String FindLoginIdSuccessPage = "/find/loginid/success";
  static String FindPasswordPage = "/find/password";
  static String FindPasswordNewSetPage = "/find/password/set";
  static String CardSavePage = "/card/save";
  static String PayMainPage = "/card";
  //Jeong
  static String StartPage = "/start";
  static String SplashPage = "/splash";
  static String JoinPage = "/join";


  // KWON
  static String ReservationPage = "/reservation";
  static String ChoiceAddressPage = '/choice-address';
  static String FindAddressPage = '/find-address';
  static String HouseKeeperPage = '/housekeeper';
  static String OfficePage = '/office';
  static String MovementPage = '/movement';
  static String AppliencePage = '/applience';
  static String CustomerPage = '/customer';
  static String NoticePage = '/notice';
  static String NoticeDetailPage = '/notice-detail';
  static String AccountClosurePage = '/account-closure-page';
}

Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    //JEONG
    Move.SplashPage: (context) => SplashPage(),
    Move.StartPage: (context) => StartPage(),
    Move.JoinPage: (context) => JoinPage(),
    // KWON
    Move.ChoiceAddressPage: (context) => ChoiceAddressPage(),
    Move.ReservationPage: (context) => ReservationPage(),
    Move.ChoiceAddressPage: (context) => ChoiceAddressPage(),
    Move.FindAddressPage: (context) => FindAddressPage(),
    Move.HouseKeeperPage: (context) => HouseKeeperPage(),
    Move.OfficePage: (context) => OfficePage(),
    Move.MovementPage: (context) => MovementPage(),
    Move.AppliencePage: (context) => AppliencePage(),
    Move.CustomerPage: (context) => CustomerPage(),
    Move.NoticePage: (context) => NoticePage(),
    Move.NoticeDetailPage: (context) => NoticeDetailPage(),
    Move.AccountClosurePage: (context) => AccountClosurePage(),

    // Move.MainPage: (context) => MainPage(),
    // Move.LoginPage: (context) => LoginPage(),
    // Move.JoinPage: (context) => JoinPage(),
    // Move.JoinSuccessPage: (context) => JoinSuccessPage(),
    // Move.CategoryDetailPage: (context) => const CategoryDetailPage(),
    // Move.FindLoginIdPage: (context) => FindLoginIdPage(),
    // Move.FindLoginIdSuccessPage: (context) => const FindLoginIdSuccessPage(),
    // Move.FindPasswordPage: (context) => FindPasswordPage(),
    // Move.FindPasswordNewSetPage: (context) => FindPasswordNewSetPage(),
    // Move.CardSavePage: (context) => PayCardSavePage(),
    // Move.PayMainPage: (context) => const PayMainPage(),
  };
}