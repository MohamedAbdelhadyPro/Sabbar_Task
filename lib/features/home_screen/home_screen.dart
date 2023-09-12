import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/home_bloc.dart';
import 'components/bottom_sheet_component.dart';
import 'components/map_component.dart';
import 'components/rate_trip_component.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Stack(
          children: [
            // Map
            MapComponent(),

            // Rate Trip after finish
            if (state.packageIndexStep == 4) RateTripComponent(),

            // Bottom Sheet Content
            if (state.packageIndexStep! < 4) BottomSheetComponent()
          ],
        );
      },
    ));
  }
}
