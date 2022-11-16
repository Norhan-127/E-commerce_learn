import 'package:e_commerce/utilities/routes.dart';
import 'package:e_commerce/views/pages/landingPage.dart';
import 'package:flutter/cupertino.dart';

Route<dynamic> onGenerate(RouteSettings settings){
  switch(settings.name){
    case AppRoutes.landingPageRoute:
    default:
      return CupertinoPageRoute(builder: (_)=>const LandingPage());
  }
}