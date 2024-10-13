import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp/config/constants/colors.dart';

class Footer extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const Footer({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      
      height: 80,
      child: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent
          ),
        child: BottomNavigationBar(
          backgroundColor: Deelay.neutral900,
          selectedItemColor: Deelay.neutral100,
          selectedLabelStyle: TextStyle(
            height: 1.25,
            fontWeight: FontWeight.w700,
            fontSize: 12.0,
            color: Deelay.neutral100,
          ),
          unselectedLabelStyle: TextStyle(
            height: 1.25,
            fontWeight: FontWeight.normal,
            fontSize: 12.0,
            color: Deelay.neutral100,
          ),
        
          unselectedItemColor: Color(0xFFC6C5D0),
          currentIndex: currentIndex,
          onTap: onTap,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(bottom: 6),
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 22),
                decoration: currentIndex == 0 ? BoxDecoration(
                  color: Color(0xFF4A4458),
                  borderRadius: BorderRadius.circular(15.0),
                ) : null,
                child: SvgPicture.asset(
                  'assets/icons/Home.svg',
                    height: 20,
                    width: 20,
                    // ignore: deprecated_member_use
                    color: Color(0xFFC6C5D0)
                  ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(bottom: 6),
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 22),
                decoration: currentIndex == 1 ? BoxDecoration(
                  color: Color(0xFF4A4458),
                  borderRadius: BorderRadius.circular(15.0),
                ) : null,
                child: SvgPicture.asset('assets/icons/App_limits.svg',
                height: 20, 
                width: 20, 
                // ignore: deprecated_member_use
                color: Color(0xFFC6C5D0)
                )
              ),
              label: 'Apps',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(bottom: 6),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                decoration: currentIndex == 2 ? BoxDecoration(
                  color: Color(0xFF4A4458),
                  borderRadius: BorderRadius.circular(15.0),
                ) : null,
                child: SvgPicture.asset('assets/icons/Statistics.svg',
                height: 16, 
                width: 16, 
                // ignore: deprecated_member_use
                color: Color(0xFFC6C5D0)
                )
              ),
              label: 'Statistics',
            ),
          ],
        ),
      ),
    );
  }
}
