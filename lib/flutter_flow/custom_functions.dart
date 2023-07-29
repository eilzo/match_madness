import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String? languageToUnicodeFlag(
  String language1,
  String language2,
) {
  String toEmoji(String country) => country.replaceAllMapped(RegExp(r'[A-Z]'),
      (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));

// Country codes: https://apps.timwhitlock.info/emoji/tables/iso3166
  getFlag(language) {
    switch (language.toLowerCase()) {
      case 'english':
        return toEmoji('GB');
      case 'french':
        return toEmoji('FR');
      case 'german':
        return toEmoji('DE');
      case 'spanish':
        return toEmoji('ES');
      case 'russian':
        return toEmoji('RU');
      case 'italian':
        return toEmoji('IT');
      case 'czech':
        return toEmoji('CZ');
      default:
        return toEmoji('GB');
    }
  }

  return getFlag(language1) + ' - ' + getFlag(language2);
}
