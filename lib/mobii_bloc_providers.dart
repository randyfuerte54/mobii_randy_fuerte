import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobii_randy_fuerte/user/view_model/repositories/user_repository.dart';
import 'package:mobii_randy_fuerte/user/view_model/repositories/user_repository_impl.dart';
import 'package:mobii_randy_fuerte/user/view/blocs/user_bloc.dart';

class MobiiBlocProviders {
  static MobiiBlocProviders instance = MobiiBlocProviders();

  List<RepositoryProvider> get repositoryProvider {
    return <RepositoryProvider>[
      RepositoryProvider<UserRepository>(
        create: (context) => UserRepositoryImpl(),
      ),
    ];
  }

  List<BlocProvider> get blocProviders {
    return [
      BlocProvider<UserBloc>(
        create: (context) => UserBloc(
          userRepository: RepositoryProvider.of<UserRepository>(context),
        ),
      ),
    ];
  }
}
