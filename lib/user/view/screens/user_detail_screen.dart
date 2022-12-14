import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobii_randy_fuerte/user/view_model/repositories/user_repository.dart';

class UserDetailScreen extends StatefulWidget {
  const UserDetailScreen({Key? key}) : super(key: key);

  static const String routeName = '/user-detail';

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  late final UserRepository userRepository;
  @override
  void initState() {
    userRepository = RepositoryProvider.of<UserRepository>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isAndroidPlatform = defaultTargetPlatform == TargetPlatform.android;
    final user = userRepository.selectedUser;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        top: isAndroidPlatform,
        bottom: isAndroidPlatform,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: CachedNetworkImage(
                  height: 200,
                  imageUrl: user.imgUrl,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                ),
              ),
              const SizedBox(height: 20),
              Text('Name : ${user.name}'),
            ],
          ),
        ),
      ),
    );
  }
}
