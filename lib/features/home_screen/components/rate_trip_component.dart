import 'package:fl_score_bar/fl_score_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/colors.dart';
import '../../../../widgets/image_widget.dart';
import '../bloc/home_bloc.dart';

class RateTripComponent extends StatelessWidget {
  const RateTripComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          height: 60.h,
          child: Stack(
            children: [
              // Steps
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 52.h,
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
                        "Mohamed Abdullah",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        width: 65.w,
                        padding: const EdgeInsets.all(8.0),
                        child: IconScoreBar(
                          scoreIcon: Icons.star,
                          iconColor: Colors.white,
                          score: 5,
                          maxScore: 5,
                          readOnly: false,
                          onChanged: (value) {
                            print('IconScoreBar updated value -> $value');
                          },
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      // Pickup
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Row(
                          children: [
                            Text(
                              "Pickup Time",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text(
                                "${state.pickupTime!.hour}:${state.pickupTime!.minute} ${state.pickupTime!.hour > 11 ? "PM" : "AM"}"),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      // Delivery
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Row(
                          children: [
                            Text(
                              "Delivery Time",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text(
                                "${state.delivertime!.hour}:${state.delivertime!.minute} ${state.delivertime!.hour > 11 ? "PM" : "AM"}"),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 15.w,
                          ),
                          Text(
                            "Total",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 15.w,
                          ),
                          Expanded(
                            child: Text(
                              "\$30.00",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                          Container(
                            width: 40.w,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadiusDirectional.only(
                                  topStart: Radius.circular(50),
                                  bottomStart: Radius.circular(50)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Submit",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(Icons.arrow_forward),
                              ],
                            ),
                          )
                        ],
                      ),
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
