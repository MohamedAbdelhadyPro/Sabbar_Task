import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/colors.dart';
import '../../../../widgets/image_widget.dart';
import '../bloc/home_bloc.dart';

class BottomSheetComponent extends StatelessWidget {
  const BottomSheetComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          height: 42.h,
          child: Stack(
            children: [
              // Steps
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 34.h,
                  decoration: BoxDecoration(
                      color: secondColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Mohamed Abdelhady",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        height: 12.h,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10.w,
                            ),
                            stepsLines(),
                            SizedBox(width: 12),
                            stepsTitles()
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

              // Photo
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: ImageWidget("",
                        height: 110,
                        width: 110,
                        color: Colors.white,
                        radius: 100),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }

  Widget stepsLines() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 6,
                width: 6,
                decoration: BoxDecoration(
                    color: state.packageIndexStep! >= 1
                        ? Colors.black
                        : Colors.white,
                    borderRadius: BorderRadius.circular(50)),
              ),
              Expanded(
                  child: Container(
                      width: 1,
                      color: state.packageIndexStep! >= 2
                          ? Colors.black
                          : Colors.white)),
              Container(
                height: 6,
                width: 6,
                decoration: BoxDecoration(
                    color: state.packageIndexStep! >= 2
                        ? Colors.black
                        : Colors.white,
                    borderRadius: BorderRadius.circular(50)),
              ),
              Expanded(
                  child: Container(
                      width: 1,
                      color: state.packageIndexStep! >= 3
                          ? Colors.black
                          : Colors.white)),
              Container(
                height: 6,
                width: 6,
                decoration: BoxDecoration(
                    color: state.packageIndexStep! >= 3
                        ? Colors.black
                        : Colors.white,
                    borderRadius: BorderRadius.circular(50)),
              ),
              Expanded(
                  child: Container(
                      width: 1,
                      color: state.packageIndexStep! >= 4
                          ? Colors.black
                          : Colors.white)),
              Container(
                height: 6,
                width: 6,
                decoration: BoxDecoration(
                    color: state.packageIndexStep! >= 4
                        ? Colors.black
                        : Colors.white,
                    borderRadius: BorderRadius.circular(50)),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget stepsTitles() {
    final style = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
    );
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("On the way",
                  style: style.copyWith(
                      color: state.packageIndexStep! >= 1
                          ? Colors.black
                          : Colors.white)),
              Text("Picked up delivery",
                  style: style.copyWith(
                      color: state.packageIndexStep! >= 2
                          ? Colors.black
                          : Colors.white)),
              Text("Near delivery destination",
                  style: style.copyWith(
                      color: state.packageIndexStep! >= 3
                          ? Colors.black
                          : Colors.white)),
              Text("Delivered package",
                  style: style.copyWith(
                      color: state.packageIndexStep! >= 4
                          ? Colors.black
                          : Colors.white)),
            ],
          ),
        );
      },
    );
  }
}
