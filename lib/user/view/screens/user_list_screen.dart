import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobii_randy_fuerte/user/view_model/repositories/user_repository.dart';
import 'package:mobii_randy_fuerte/user/view/blocs/common_state.dart';
import 'package:mobii_randy_fuerte/user/view/blocs/user_bloc.dart';
import 'package:mobii_randy_fuerte/user/view/screens/user_detail_screen.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  late final UserBloc userBloc;
  late final UserRepository userRepository;

  @override
  void initState() {
    userBloc = BlocProvider.of<UserBloc>(context);
    userBloc.add(const GetUserListEvent());
    userRepository = RepositoryProvider.of<UserRepository>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isAndroidPlatform = defaultTargetPlatform == TargetPlatform.android;
    return Scaffold(
      body: SafeArea(
        top: isAndroidPlatform,
        bottom: isAndroidPlatform,
        child: BlocConsumer<UserBloc, UserState>(
          bloc: userBloc,
          listener: _listener,
          builder: (context, state) {
            if (state is GetUserListState) {
              return Center(
                child: _buildSuccessState(context, state),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  void _listener(
    BuildContext context,
    UserState state,
  ) {
    if (state is ErrorState) {
      showDialog(
        context: context,
        builder: (_) => const AlertDialog(
          title: Text('Oops!'),
          content: Text('Something went wrong! Please try again.'),
        ),
      );
    }
  }

  Widget _buildSuccessState(
    BuildContext context,
    GetUserListState state,
  ) {
    final user = state.response;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        itemCount: state.response.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 10,
            shadowColor: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: CachedNetworkImage(
                    imageUrl: user[index].imgUrl,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                  ),
                ),
                title: Text(user[index].name),
                selected: true,
                onTap: () {
                  userRepository.selectedUser = user[index];
                  Navigator.pushNamed(context, UserDetailScreen.routeName);
                },
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(height: 10),
      ),
    );
  }
}
