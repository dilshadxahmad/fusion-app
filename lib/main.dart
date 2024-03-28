import 'package:flutter/material.dart';
import 'package:fusion_app/controllers/home/home_view_controller.dart';
import 'package:fusion_app/views/home_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewController>(
      create: (context) => HomeViewController(),
      child: ResponsiveSizer(builder: (context, orientation, screenType) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeView(),
        );
      }),
    );
  }
}
