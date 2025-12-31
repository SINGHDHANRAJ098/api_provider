import 'package:provider_ecom/services/posts_api.dart';

void fatchposts() async {
  final posts = fatchMoadel();


  for( var post in await posts){
    print( "id ${post.id}");

  }
}