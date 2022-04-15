import 'package:bidu_clone/src/blocs/home_bloc.dart';
import 'package:bidu_clone/src/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomeNavBar extends StatelessWidget {
  const HomeNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        stream: Provider.of<HomeBloc>(context).navBarStream,
        builder: (context, snapshot) {
          int selectedIndex = snapshot.data ?? 0;

          Widget _button(String assets,
              {required int index, required VoidCallback onPressed}) {
            const _selectedColor = Color(0xffE812A4);
            return IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              iconSize: 24,
              padding: const EdgeInsets.only(top: 20),
              icon: SvgPicture.asset(
                assets,
                color: selectedIndex == index ? _selectedColor : null,
                width: 24,
                height: 24,
              ),
              onPressed: () {
                Provider.of<HomeBloc>(context, listen: false).changePage(index);
                onPressed.call();
              },
            );
          }

          return BottomAppBar(
              shape: const CircularNotchedRectangle(),
              child: Padding(
                padding: EdgeInsets.only(right: Screen.width * 80 / 375),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _button('assets/icons/nav_bidu.svg',
                        index: 0, onPressed: () {}),
                    _button('assets/icons/nav_shop.svg',
                        index: 1, onPressed: () {}),
                    _button('assets/icons/nav_heart.svg',
                        index: 2, onPressed: () {}),
                    _button('assets/icons/nav_compass.svg',
                        index: 3, onPressed: () {}),
                    _button('assets/icons/nav_account.svg',
                        index: 4, onPressed: () {}),
                  ],
                ),
              ));
        });
  }
}
