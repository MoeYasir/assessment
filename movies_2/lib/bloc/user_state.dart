import 'package:equatable/equatable.dart';
import 'package:movies_2/model/user_model.dart';

abstract class UserStates extends Equatable {
  const UserStates();
  @override
  List<Object> get props => [];
}

class UserInitialState extends UserStates {}

class UserLoading extends UserStates {
  const UserLoading();
}

class UserLoaded extends UserStates {
  final List<UserModel> userList;
  const UserLoaded({required this.userList});
}

class UserError extends UserStates {
  final String? error;
  const UserError({required this.error});
}
