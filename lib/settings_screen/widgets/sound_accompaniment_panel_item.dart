import 'package:flutter/material.dart';

///Создаётся элемент из панели для звукового сопровождения

Widget buildSoundUItem(state, icon, Function? function, color) {
  return InkWell(
    onTap: () => function != null ? function() : null,
    child: Container(
      height: 40,
      width: 110,
      child: Padding(padding: EdgeInsets.all(10), child: icon),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
    ),
  );
}
