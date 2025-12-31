// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:provider_ecom/providers/photo_provider.dart';
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.deepPurple,
//         title: Text(
//           "Gallery",
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//         ),
//       ),
//       body: Consumer<PhotoProvider>(
//         builder: (context, provider, child) {
//           if (provider.isLoading) {
//             return Center(child: CircularProgressIndicator());
//           }
//           return GridView.builder(
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 3,
//               crossAxisSpacing: 5,
//               mainAxisSpacing: 5,
//             ),
//             itemCount: provider.photos.length,
//             itemBuilder: (context, index) {
//               final photo = provider.photos[index];
//               return GridTile(
//                 child: Image.network(photo.url, fit: BoxFit.cover),
//               );
//             },
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: context.read<PhotoProvider>().fetchPhotos,
//         child: Icon(Icons.refresh),
//       ),
//     );
//   }
// }
//
//
//
//
//

import 'package:flutter/material.dart';
import 'package:provider_ecom/screens/post_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {

    super.initState();
  fatchposts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: Text(
          "API RESPONSE",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 19,
          ),
        ),
      ),
    );
  }
}
