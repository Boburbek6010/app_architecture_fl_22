import 'package:app_architecture_fl_22/src/data/entity/post_model.dart';

abstract class AppRepository{

  Future<List<PostModel>?>getPosts();


}