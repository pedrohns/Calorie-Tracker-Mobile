import 'dart:convert';
import 'package:crypto/crypto.dart';

const String baseUrl = "https://api.nal.usda.gov";
const String calorieTrackKey = "mJ95rJNrQsMQD5ue58RqIUrOS5a6MYGzBlVRKkVt";

String _hash() {
  const String input = '$calorieTrackKey';
  return md5.convert(utf8.encode(input)).toString();
}

class Http {
  static const Map<String, String> headers = {
    "Content-Type": "application/json"
  };

  static String url(String url) =>
      // '$baseUrl$url?&api_key=$publicKey&hash=${_hash()}';
      '$baseUrl$url?&api_key=$calorieTrackKey';
}
