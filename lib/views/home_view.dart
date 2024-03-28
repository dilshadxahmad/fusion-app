import 'package:flutter/material.dart';
import 'package:fusion_app/controllers/home/home_view_controller.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeViewController>().getComments();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView.builder(
          itemCount: context.watch<HomeViewController>().comments.length,
          itemBuilder: (context, index) {
            return Container(
              height: 30,
              width: 30,
              color: Colors.red,
            );
          },
        ),
      ),
    );
  }
}
