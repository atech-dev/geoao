import 'package:flutter/material.dart';
import 'package:geoao/geoao.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Geoao _geoao;
  ProvincesModel provincesModel;
  List<CountyModel> counties;
  CountyModel countyModel;

  @override
  void initState() {
    super.initState();
    _getProvinces();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [],
      ),
    );
  }

  void _getProvinces() async {
    provincesModel = await _geoao.getProvinces();

    setState(() {});
  }

  void _getCounties(int idProvince) async {
    counties = await _geoao.getCounties(idProvince);

    setState(() {});
  }

  void _getCountyById(int idCounty) async {
    countyModel = await _geoao.getCountyById(idCounty);

    setState(() {});
  }
}
