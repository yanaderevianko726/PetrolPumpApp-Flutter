import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'LoadService.dart';

Map<String,String> headers = {
  'Content-Type':'application/json',
};

class NetworkProvider {
  final BuildContext context;

  static const String DOMAIN = 'api.goldpayexchange.com';
  static const String loginLink = 'AddInvestmentInfo';
  static const String registerLink = 'RegisterMember';

  NetworkProvider(this.context);

  Future<dynamic> ajax(String link, Map<String, dynamic> params,
      {bool isProgress = false, bool isFullUrl = false}) async {
    if (isProgress && context != null) LoadService().showLoading(context);

    var url = Uri.https(DOMAIN, isFullUrl ? link : '/api/Members/' + link, {'q': '{http}'});
    final response = await http.post(url, headers: headers, body: jsonEncode(params),).timeout(Duration(minutes: 1));

    if (isProgress && context != null) LoadService().hideLoading(context);
    if (response.statusCode == 201 || response.statusCode == 200) {
      print('===== $link response ===== \n${response.body}');
      return jsonDecode(response.body);
    } else {
      print(link + ' failed ===> ${response.statusCode}');
      Exception(response.statusCode);
    }
  }
}