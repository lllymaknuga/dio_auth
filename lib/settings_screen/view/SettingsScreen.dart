import 'package:antigai/settings_screen/widgets/settings_item.dart';
import 'package:antigai/settings_screen/widgets/sound_accompaniment_panel_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../bloc/sounds_accompanation/sound_accompanation_cubit.dart';
import '../../bloc/sounds_accompanation/sound_accompanation_state.dart';
import '../../bloc/settings_show_bottom_sheet/show_bottom_sheet_cubit.dart';
import '../../bloc/settings_show_bottom_sheet/show_bottom_sheet_state.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  Widget _buildContentSettingItem(state, context) {
    ///Создаётся контент для страницы настроек
    if (state is RegistrationState) {
      return Padding(
        padding: EdgeInsets.only(
          left: 15,
          bottom: MediaQuery.of(context).viewInsets.bottom != 0
              ? MediaQuery.of(context).viewInsets.bottom
              : 0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text('Регистрация'),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(9)),
                border: Border.all(
                  width: 6,
                  color: Color.fromRGBO(25, 25, 25, 1),
                ),
                color: Color.fromRGBO(49, 49, 49, 1),
              ),
              child: TextField(),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Никто не будет ваш номер. \nРегистрация нужна, чтобы блокировать тех, \nкто ставит ложные камеры и флужит в чате.',
            ),
            SizedBox(
              height: 20,
            ),
            Text('Отображаемое имя в чате:'),
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(9)),
                border: Border.all(
                  width: 6,
                  color: Color.fromRGBO(25, 25, 25, 1),
                ),
                color: Color.fromRGBO(49, 49, 49, 1),
              ),
              child: TextField(),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      );
    } else if (state is FeedbackState) {
      return Padding(
        padding: EdgeInsets.only(
          left: 15,
          bottom: MediaQuery.of(context).viewInsets.bottom != 0
              ? MediaQuery.of(context).viewInsets.bottom
              : 0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Отправить пожелания администрации'),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, top: 10),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  border: Border.all(
                    width: 4,
                    color: Color.fromRGBO(25, 25, 25, 1),
                  ),
                  boxShadow: [],
                  color: Color.fromRGBO(49, 49, 49, 1),
                ),
                child: Padding(
                  padding: EdgeInsets.only(),
                  child: TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(49, 49, 49, 1),
                          ),
                        ),
                        contentPadding: EdgeInsets.only(
                          top: 15,
                          left: 15,
                        ),
                        suffixStyle: TextStyle(
                          color: Colors.white,
                        ),
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        hintText: 'Сообщение',
                        hintStyle: TextStyle(
                          color: Colors.white,
                        )),
                    maxLines: 9,
                    minLines: 7,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 30, right: 30),
              height: 50,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Отправить',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      );
    } else if (state is SoundAccompanimentState) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Text('Настройки звуковых сообщений'),
          ),
          SizedBox(
            height: 20,
          ),
          BlocProvider(
            create: (_) => SoundAccompanimentCubit(),
            child:
                BlocBuilder<SoundAccompanimentCubit, SoundsAccompanationState>(
                    builder: (context, state) {
              /// Панель с выбором звукового сопровождения
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                      color: Color.fromRGBO(33, 33, 33, 1),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildSoundUItem(
                          state,
                          SvgPicture.asset('assets/icons/sounds_mute.svg'),
                          () => context
                              .read<SoundAccompanimentCubit>()
                              .changeMute(),
                          (state is MuteState)
                              ? Color.fromRGBO(49, 49, 49, 1)
                              : Color.fromRGBO(33, 33, 33, 1),
                        ),
                        buildSoundUItem(
                          state,
                          SvgPicture.asset('assets/icons/sounds_vibration.svg'),
                          () => context
                              .read<SoundAccompanimentCubit>()
                              .changeVibration(),
                          (state is VibrationState)
                              ? Color.fromRGBO(49, 49, 49, 1)
                              : Color.fromRGBO(33, 33, 33, 1),
                        ),
                        buildSoundUItem(
                          state,
                          SvgPicture.asset('assets/icons/sounds_sound.svg'),
                          () => context
                              .read<SoundAccompanimentCubit>()
                              .changeSound(),
                          (state is SoundState)
                              ? Color.fromRGBO(49, 49, 49, 1)
                              : Color.fromRGBO(33, 33, 33, 1),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  if (state is SoundState)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Text('Все звуки включены'),
                    ),
                  if (state is VibrationState)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Text(
                          'Включены уведомления о камерах и \nдорожных событиях'),
                    ),
                  if (state is MuteState)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Text('Выключены все звуки'),
                    ),
                ],
              );
              ;
            }),
          ),
          SizedBox(
            height: 30,
          )
        ],
      );
    } else {
      return Container();
    } /*else if (state is DisableAdsState) {
      return Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'Убрать навсегда рекламу и получить          \nстатус премиум-аккаунта и безмерную \nблагодарность от администрации за \nпомощь в развитии сервиса.'),
            SizedBox(
              height: 15,
            ),
            Text(
                'Мы оплачиваем работу сотрудников: \n •   модерация чата\n •   модерация меток\n •   платные смс-сообщения и т.д.\n и ваша оплата помогает нам быть лучше.'),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.only(left: 30, right: 30),
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Оплатить 500 ₽',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      );
    }*/
  }

  void _startChangeSettings(BuildContext ctx, ShowBottomSheetState state) {
    showModalBottomSheet(
        isDismissible: false,
        isScrollControlled: true,
        context: ctx,
        builder: (_) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromRGBO(18, 18, 18, 1),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(15),
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    _buildContentSettingItem(state, ctx),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ShowBottomSheetCubit(),
      child: BlocConsumer<ShowBottomSheetCubit, ShowBottomSheetState>(
        listener: (context, state) {
          _startChangeSettings(context, state);
        },
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Container(
                  color: Colors.black,
                ),
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 20),
                child: Text(
                  'Настройки',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'TTNorms',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                child: buildSettingsItem(
                  'Регистрация',
                  () => context
                      .read<ShowBottomSheetCubit>()
                      .showBottomSheetRegistration(),
                ),
              ),
              // buildSettingsItem(
              //   'Отключить рекламу',
              //   () => context
              //       .read<ShowBottomSheetCubit>()
              //       .showBottomSheetDisableAds(),
              // ),
              buildSettingsItem(
                'Обратная связь',
                () => context
                    .read<ShowBottomSheetCubit>()
                    .showBottomSheetFeedback(),
              ),
              buildSettingsItem(
                'Звуковое сопровождение',
                () => context
                    .read<ShowBottomSheetCubit>()
                    .showBottomSheetSoundAccompant(),
              ),
            ],
          );
        },
      ),
    );
  }
}
