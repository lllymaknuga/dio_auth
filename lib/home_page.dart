import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../bloc/navigation/navigation_cubit.dart';
import '../bloc/navigation/navigation_state.dart';
import '../screens/AdvertisingScreen.dart';
import '../screens/ChatScreen.dart';
import '../screens/GoogleMapsScreen.dart';
import 'settings_screen/view/SettingsScreen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  Widget buildIconButton(
      Widget icon, String? txt, Function? tapHandler, Color? select) {
    print(1);
    print(tapHandler);
    print(1);
    return InkWell(
      onTap: () => tapHandler!() ?? null,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(
              height: 2,
            ),
            if (txt != null)
              Text(
                txt,
                style: TextStyle(
                  fontFamily: 'TTNorms',
                  fontWeight: FontWeight.bold,
                  color: select,
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<NavigationCubit, NavigationState>(
                builder: (context, state) {
                  if (state is GoogleState) {
                    return GoogleMapsScreen();
                  } else if (state is AdversingState) {
                    return AdvertisingScreen();
                  } else if (state is ChatState) {
                    return ChatScreen();
                  } else if (state is SettingsState) {
                    return SettingsScreen();
                  }
                  return GoogleMapsScreen();
                },
              ),
            ),
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.09,
              child: Column(
                children: [
                  Divider(
                    height: 1,
                    color: Colors.grey,
                    thickness: 2,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  BlocBuilder<NavigationCubit, NavigationState>(
                      buildWhen: (last, now) =>
                          last.runtimeType != now.runtimeType,
                      builder: (context, state) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildIconButton(
                              SvgPicture.asset('assets/icons/home.svg'),
                              'Карта',
                              () => context
                                  .read<NavigationCubit>()
                                  .showGoogleMapScreen(),
                              (state is GoogleState)
                                  ? Colors.blue
                                  : Colors.black,
                            ),
                            buildIconButton(
                              SvgPicture.asset('assets/icons/advertising.svg'),
                              'Реклама',
                              () => context
                                  .read<NavigationCubit>()
                                  .showAdversingScreen(),
                              (state is AdversingState)
                                  ? Colors.blue
                                  : Colors.black,
                            ),
                            buildIconButton(
                              Container(
                                padding: EdgeInsets.all(0),
                                height: 45,
                                width: 45,
                                child: FloatingActionButton(
                                  onPressed: () {},
                                  child: Icon(Icons.add),
                                ),
                              ),
                              null,
                              (BuildContext ctx) {
                                showBottomSheet(
                                  context: ctx,
                                  builder: (_) {
                                    return Container();
                                  },
                                );
                              },
                              null,
                            ),
                            buildIconButton(
                              SvgPicture.asset('assets/icons/chat.svg'),
                              'Чат',
                              () => context
                                  .read<NavigationCubit>()
                                  .showChatScreen(),
                              (state is ChatState) ? Colors.blue : Colors.black,
                            ),
                            buildIconButton(
                              SvgPicture.asset('assets/icons/settings.svg'),
                              'Настройки',
                              () => context
                                  .read<NavigationCubit>()
                                  .showSettingsgScreen(),
                              (state is SettingsState)
                                  ? Colors.blue
                                  : Colors.black,
                            ),
                          ],
                        );
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
