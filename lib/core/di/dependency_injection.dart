import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:taskly_app/core/networking/api_service.dart';
import 'package:taskly_app/core/networking/dio_factory.dart';
import 'package:taskly_app/features/login/data/repos/login_repo.dart';
import 'package:taskly_app/features/login/logic/cubit/login_cubit.dart';
import 'package:taskly_app/features/signup/data/repos/signup_repo.dart';
import 'package:taskly_app/features/signup/logic/cubit/signup_cubit.dart';



final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // signup
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));
}
