import 'package:flutter/material.dart';

Widget buildSettingsItem(String txt, Function? startchange) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        enableFeedback: false,
        onTap: () => startchange != null ? startchange() : null,
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Text(
              txt,
            ),
          ),
        ),
      ),
      Divider(
        color: Colors.grey,
        thickness: 0.3,
      ),
    ],
  );
}
