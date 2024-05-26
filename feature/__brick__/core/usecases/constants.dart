import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:intl/intl.dart';
import '../api_client/api_client.dart';
import 'hive_utils.dart';
import 'keys.dart';
import 'dart:io';





///!  ------------------ Logics ------------------
//! ApiClient
// final ApiClient apiClient = ApiClient();



///!  ------------------ Utils ------------------
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
final DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
final DateFormat timeFormat = DateFormat('E, h:mm a');
final kToday = DateTime.now();
final Logger logger = Logger();



const String baseUrl = 'https://us-central1-sawwl-n-jawwb.cloudfunctions.net';
const String baseUrlApi = '$baseUrl/api';
// const String baseUrlApi = 'http://192.168.1.139:3007/api';


const String termsOfServiceUrl = 'https://www.sawwl-n-jawwb.com/terms-of-service/';
const String termsService = 'https://www.sawwl-n-jawwb.com/terms-of-service/';
const String privacyPolicy = 'https://www.sawwl-n-jawwb.com/privacy-policy/';
const String aboutUS = 'https://www.sawwl-n-jawwb.com/';
const int numLimitFriends = 16;
const int numLimitReports = 10;
const int numLimitAnswer = 10;
const int numLimitPost = 10;
