import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rest_api_demo/data/endpoints/endpoints.dart';
import 'package:rest_api_demo/data/network_calls/dio_client.dart';
import 'package:rest_api_demo/data/network_calls/http_client.dart';
import 'package:rest_api_demo/data/storage/shared_prefrences_helper.dart';
import 'data/extension/extension_string.dart';
import 'data/service/locator.dart';
//import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  String appName = "Demo Testing";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appName.isNotNullorEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  _btnClick();
                },
                child: const Text("Submit"))
          ],
        ),
      ),
    );
  }

  _btnClick() async {



    /* var response = await HttpClient().makePostCall(
      apiName: EndPoints.loginWithNumber,
      data: jsonEncode({
    "CountryCode": "91",
    "MobileNumber": "9019269318",
    "IsIos":"0",
    "FirebaseToken":""
})
); */

var response = await DioClient().makePostCall(apiName: EndPoints.loginWithNumber,
parameters: {
    "CountryCode": "91",
    "MobileNumber": "9019269318",
    "IsIos":"0",
    "FirebaseToken":""
});
    
if (response.statusCode==200) {
      //getIt.get<SharedPreferenceHelper>().setUserToken(userToken: jsonDecode(response.body)["token"]);
    }
   // print(response);
  } 
}
