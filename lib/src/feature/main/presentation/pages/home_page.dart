import 'dart:developer';

import 'package:app_architecture_fl_22/src/feature/main/presentation/widgets/home_top_item_widget.dart';
import 'package:app_architecture_fl_22/src/feature/main/view_model/main_vm.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  MainVM mainVM = MainVM();

  @override
  void initState() {
    mainVM.getAllPosts().then((value) {
      setState(() {});
    });
    log("initState");
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    log("build");
    return Scaffold(
      body: mainVM.isLoading ?ListView.builder(
        itemCount: mainVM.posts.length,
        itemBuilder: (_, index){
          return HomeTopItemWidget(title: mainVM.posts[index].title.toString(), sub: mainVM.posts[index].body.toString());
        },
      ):const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
