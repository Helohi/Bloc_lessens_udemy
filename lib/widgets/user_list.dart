import 'package:bloc_test/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case UserEmptyState:
            return const Center(
                child: Text(
              'No data recieved. Please Load it.',
              style: TextStyle(fontSize: 20),
            ));
          case UserLoadingState:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case UserLoadedState:
            state as UserLoadedState;
            return ListView.builder(
              itemCount: state.loadedUser.length,
              itemBuilder: (context, index) => Container(
                color: index % 2 == 0 ? Colors.white : Colors.blue[50],
                child: ListTile(
                  leading: Text(
                    'ID: ${state.loadedUser[index].id}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Column(
                    children: [
                      Text(
                        state.loadedUser[index].name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: [
                          Text(
                            'Email: ${state.loadedUser[index].email}',
                            style: const TextStyle(fontStyle: FontStyle.italic),
                          ),
                          Text(
                            'Phone: ${state.loadedUser[index].phone}',
                            style: const TextStyle(fontStyle: FontStyle.italic),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          case UserErrorState:
            return const Center(
              child: Text(
                'Error fetching Users',
                style: TextStyle(fontSize: 20),
              ),
            );
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
