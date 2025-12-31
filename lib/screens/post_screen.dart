import 'package:provider_ecom/services/posts_api.dart';

void fatchposts() async {
  final posts = await fatchMoadel();


  for( var post in posts){
    print("id: ${post.id}");
    print("userId: ${post.userId}");
    print("title: ${post.title}");
    print("About: ${post.body}");

  }
}