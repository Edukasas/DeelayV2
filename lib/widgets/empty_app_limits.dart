import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp/config/constants/colors.dart';

class EmptyAppLimits extends StatelessWidget {


const EmptyAppLimits({super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: Column(
        children:[
          SizedBox(
            height: 70.0,
            width: 70.0,
            // ignore: deprecated_member_use
            child: SvgPicture.asset('assets/icons/Idle_empty.svg',height: 64.17,width: 49.58, color: Deelay.neutral000)
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 40.0),
            child: Text(
              style: TextStyle(
                color: Deelay.neutral000,
                fontSize: 16,
                fontWeight: FontWeight.w700
              ),
              'No app limits created.'
            ),
          ),
          SizedBox(
            width: 247.0,
            child: Text(
              style: TextStyle(
                color: Deelay.pink,
                fontSize: 15,
                height: 1.1,
                fontWeight: FontWeight.w400
              ),
              textAlign: TextAlign.center,
              'App limits enable you to use specific apps, block them for a set period, and then resume using them.'
            ),
          ),
        ],
      ),
    );
  }
}