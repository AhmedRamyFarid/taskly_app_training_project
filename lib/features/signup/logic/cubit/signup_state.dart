part of 'signup_cubit.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState.initial() = Initial;
  const factory SignUpState.loading() = Loading;
  const factory SignUpState.success(AuthResponse data) = Success;
  const factory SignUpState.error({required String error}) = Error;
}
