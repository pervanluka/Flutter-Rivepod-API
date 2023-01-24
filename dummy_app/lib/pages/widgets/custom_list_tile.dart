import 'package:dummy_app/pages/user_detail_page.dart';
import 'package:dummy_app/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../models/user_model.dart';

class CustomListTile extends ConsumerWidget {
  const CustomListTile({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UserModel user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userChangeProvider = ref.watch(userProvider);
    return Card(
      elevation: 1,
      child: Slidable(
        endActionPane: ActionPane(motion: const ScrollMotion(), children: [
          SlidableAction(
            backgroundColor: Colors.red,
            icon: Icons.delete,
            label: 'Delete',
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(5), bottomRight: Radius.circular(5)),
            onPressed: (context) => userChangeProvider.deleteUserRequested(user.id!),
          )
        ]),
        child: GestureDetector(
          onTap: (() => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserDetailPage(user: user),
              ))),
          child: ListTile(
            leading: ClipOval(
                child: Image.asset(
              'assets/avatar.png',
              width: 50,
              height: 60,
              fit: BoxFit.cover,
            )),
            title: Text(user.name ?? ''),
            subtitle: Text(user.email ?? ''),
          ),
        ),
      ),
    );
  }
}
