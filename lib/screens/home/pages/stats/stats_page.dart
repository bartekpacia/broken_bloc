import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_strange_behavior/remote/repositories/user_repository.dart';
import 'package:bloc_strange_behavior/screens/home/pages/stats/bloc/bloc.dart';
import 'package:bloc_strange_behavior/widgets/loading_indicator.dart';

/// First page from the left on the HomeScreen. Displays welcome message to the user
/// and provides some information on latest achievements.
class StatsPage extends StatefulWidget {
  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<StatsPageBloc>(
      create: (context) =>
          StatsPageBloc(userRepository: UserRepository.instance)..add(StatsPageShowed()),
      child: BlocBuilder<StatsPageBloc, StatsPageState>(builder: (context, state) {
        if (state is StatsPageSuccess) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Text(
                    "Welcome, ${state.text}!",
                  ),
                ),
              ],
            ),
          );
        }
        if (state is StatsPageFailure) {
          return Text(state.message);
        }

        if (state is StatsPageLoading) {
          return LoadingIndicator();
        } else
          return Text("an error occurred");
      }),
    );
  }
}
