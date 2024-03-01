import 'dart:developer';

import 'package:app_architecture_fl_22/src/data/entity/post_model.dart';
import 'package:app_architecture_fl_22/src/data/repository/app_repository_implementation.dart';
import 'package:flutter/cupertino.dart';

class MainVM with ChangeNotifier{
  List<PostModel> posts = [];
  bool isLoading = false;
  AppRepositoryImplementation appRepositoryImplementation = AppRepositoryImplementation();


  Future<void>getAllPosts()async{
    isLoading = false;
    posts = await appRepositoryImplementation.getPosts() ?? [];
    isLoading = true;
  }

  MainVM(){
    log("message");
    getAllPosts();
  }

}