import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_2/bloc/user_bloc.dart';
import 'package:movies_2/bloc/user_event.dart';
import 'package:movies_2/bloc/user_state.dart';
import 'package:movies_2/model/user_model.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final UserBloc _userBloc = UserBloc();
  @override
  void initState() {
    _userBloc.add(GetUserListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _build(),
    );
  }

  Widget _build() {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: BlocProvider(
          create: (context) => _userBloc,
          child: BlocBuilder<UserBloc, UserStates>(
            builder: (context, state) {
              if (state is UserError) {
                return Center(
                  child: Text(state.error!),
                );
              } else {
                if (state is UserInitialState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (state is UserLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (state is UserLoaded) {
                      return ListView.builder(
                        itemCount: state.userList.length,
                        itemBuilder: (context, index) {
                          UserModel userModel = state.userList[index];
                          return ListTile(
                            title: Text(userModel.title.toString()),
                            subtitle: Text(userModel.id.toString()),
                            trailing: Text(userModel.userId.toString()),
                          );
                        },
                      );
                    } else {
                      return Container();
                    }
                  }
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
