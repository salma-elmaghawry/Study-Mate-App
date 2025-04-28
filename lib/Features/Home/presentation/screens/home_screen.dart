import 'package:flutter/material.dart';
import 'package:study_mate/Core/widgets/custom_appBar.dart';
import 'package:study_mate/Features/Home/presentation/widgets/home_body.dart';
import 'package:study_mate/config/cache/cache_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? userName;

  @override
  void initState() {
    super.initState();
    _fetchUserName();
  }

  Future<void> _fetchUserName() async {
    final name = await CacheHelper.getString(key: 'userName');
    setState(() {
      userName = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: CustomAppbar(
              ifIneedUserIcon: true,
              name: userName != null ? "Hi, $userName!" : "Hello!",
            ),
          ),
          body: const HomeBody(),
        ),
      ),
    );
  }
}