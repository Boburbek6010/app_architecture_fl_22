import 'package:app_architecture_fl_22/src/core/service/network_service.dart';
import 'package:app_architecture_fl_22/src/data/entity/post_model.dart';
import 'package:app_architecture_fl_22/src/data/repository/app_repository.dart';

class AppRepositoryImplementation implements AppRepository{

  @override
  Future<List<PostModel>?> getPosts() async{
    List<PostModel>list = [];
    String? str = await NetworkService.GET(NetworkService.apiPosts, NetworkService.emptyParams());
    if(str != null){
      list = postModelFromJson(str);
      return list;
    }else{
      return null;
    }
  }

}