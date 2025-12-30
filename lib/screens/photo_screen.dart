import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/phots_provider.dart';

class PhotosScreen extends StatefulWidget {
  const PhotosScreen({super.key});

  @override
  State<PhotosScreen> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() => context.read<PhotosProvider>().fetchPhotos());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Get api")),

      body: Consumer<PhotosProvider>(
        builder: (context, vm, _) {
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (vm.errorMessage != null) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    vm.errorMessage!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: vm.fetchPhotos,
                    child: const Text("Retry"),
                  ),
                ],
              ),
            );
          }

          if (vm.photos.isEmpty) {
            return const Center(child: Text("No posts found"));
          }

          return ListView.builder(
            itemCount: vm.photos.length,
            itemBuilder: (_, index) {
              final post = vm.photos[index];

              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  leading: CircleAvatar(child: Text(post.id.toString())),
                  title: Text(post.title),
                  subtitle: Text(post.body),
                ),
              );
            },
          );
        },
      ),

      floatingActionButton: Consumer<PhotosProvider>(
        builder: (context, vm, _) => FloatingActionButton(
          onPressed: vm.fetchPhotos,
          child: const Icon(Icons.refresh),
        ),
      ),
    );
  }
}
