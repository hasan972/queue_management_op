import 'package:flutter/material.dart';

const myDefaultPadding = 20.0;

const sizedBox = SizedBox(
  height: myDefaultPadding,
);
const kWidthSizedBox = SizedBox(
  width: myDefaultPadding,
);

const kHalfSizedBox = SizedBox(
  height: myDefaultPadding / 2,
);

const kHalfWidthSizedBox = SizedBox(
  width: myDefaultPadding / 2,
);

//validation for mobile
const String mobilePattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';

//validation for email
const String emailPattern =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

//validation for password
const String passwordPattern =
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>';




