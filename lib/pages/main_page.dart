import 'package:assessment/pages/desktop/desktop_body.dart';
import 'package:assessment/pages/mobile/mobile_and_tab_body.dart';
import 'package:assessment/responsive/responsive.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        mobile: MyMobileAndTabBody(),
        tablet: MyMobileAndTabBody(),
        desktop: MyDesktopBody(),
      ),
    );
  }
}
