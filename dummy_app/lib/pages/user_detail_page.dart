import 'package:dummy_app/models/user_model.dart';
import 'package:flutter/material.dart';

class UserDetailPage extends StatelessWidget {
  const UserDetailPage({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              buildImage('assets/avatar.png'),
              const SizedBox(
                height: 10,
              ),
              buildName(user),
              const SizedBox(
                height: 30,
              ),
              buildInfo(user),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfo(UserModel user) => Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.email,
                color: Colors.grey,
                size: 32,
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                user.email!,
                style: TextStyle(color: Colors.grey.shade800),
              )
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.location_city,
                color: Colors.grey,
                size: 32,
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                user.address!.city!,
                style: TextStyle(color: Colors.grey.shade800),
              )
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.web,
                color: Colors.grey,
                size: 32,
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                user.website!,
                style: const TextStyle(color: Colors.blue),
              ),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.phone,
                color: Colors.grey,
                size: 32,
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                user.phone!,
                style: TextStyle(color: Colors.grey.shade800),
              ),
            ],
          )
        ],
      );

  Widget buildImage(String imgPath) => ClipOval(
        child: Image.asset(
          imgPath,
          fit: BoxFit.cover,
          height: 128,
          width: 128,
        ),
      );

  Widget buildName(UserModel user) => Column(
        children: [
          Text(
            user.name!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            user.username!,
            style: const TextStyle(
              color: Colors.grey,
              //fontSize: 23,
            ),
          )
        ],
      );
}
