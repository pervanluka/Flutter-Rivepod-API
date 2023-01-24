import 'package:dummy_app/models/user_model.dart';
import 'package:dummy_app/pages/widgets/custom_list_tile.dart';
import 'package:dummy_app/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userListProvider = ref.watch(userProvider);
    final userList = userListProvider.getUsersRequested();
    return Scaffold(
        appBar: AppBar(title: const Text("Riverpod Dio exemple")),
        body: FutureBuilder<List<UserModel>>(
        future: userList,
        builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          final error = snapshot.error;
          print(error.toString());
          return const Center(
            child: Text(
              "Something went wrong",
            ),
          );
        } else if (snapshot.hasData) {
          if (snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No data'),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              final user = snapshot.data![index];
              return CustomListTile(user: user);
            },
          );
        }
        return Container();
        },
      ));
  }
}


