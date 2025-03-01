import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _foodItemsList = prefs.getStringList('ff_foodItemsList')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _foodItemsList;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<dynamic> _foodItemsList = [];
  List<dynamic> get foodItemsList => _foodItemsList;
  set foodItemsList(List<dynamic> value) {
    _foodItemsList = value;
    prefs.setStringList(
        'ff_foodItemsList', value.map((x) => jsonEncode(x)).toList());
  }

  void addToFoodItemsList(dynamic value) {
    foodItemsList.add(value);
    prefs.setStringList(
        'ff_foodItemsList', _foodItemsList.map((x) => jsonEncode(x)).toList());
  }

  void removeFromFoodItemsList(dynamic value) {
    foodItemsList.remove(value);
    prefs.setStringList(
        'ff_foodItemsList', _foodItemsList.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromFoodItemsList(int index) {
    foodItemsList.removeAt(index);
    prefs.setStringList(
        'ff_foodItemsList', _foodItemsList.map((x) => jsonEncode(x)).toList());
  }

  void updateFoodItemsListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    foodItemsList[index] = updateFn(_foodItemsList[index]);
    prefs.setStringList(
        'ff_foodItemsList', _foodItemsList.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInFoodItemsList(int index, dynamic value) {
    foodItemsList.insert(index, value);
    prefs.setStringList(
        'ff_foodItemsList', _foodItemsList.map((x) => jsonEncode(x)).toList());
  }

  String _foodName = '';
  String get foodName => _foodName;
  set foodName(String value) {
    _foodName = value;
  }

  double _quantity = 0.0;
  double get quantity => _quantity;
  set quantity(double value) {
    _quantity = value;
  }

  String _dietspec = '';
  String get dietspec => _dietspec;
  set dietspec(String value) {
    _dietspec = value;
  }

  DateTime? _dateperish = DateTime.fromMillisecondsSinceEpoch(1740164400000);
  DateTime? get dateperish => _dateperish;
  set dateperish(DateTime? value) {
    _dateperish = value;
  }

  String _addinfo = '';
  String get addinfo => _addinfo;
  set addinfo(String value) {
    _addinfo = value;
  }

  String _restname = '';
  String get restname => _restname;
  set restname(String value) {
    _restname = value;
  }

  String _username = '';
  String get username => _username;
  set username(String value) {
    _username = value;
  }

  String _email = '';
  String get email => _email;
  set email(String value) {
    _email = value;
  }

  String _pass = '';
  String get pass => _pass;
  set pass(String value) {
    _pass = value;
  }

  String _confirmPass = '';
  String get confirmPass => _confirmPass;
  set confirmPass(String value) {
    _confirmPass = value;
  }

  String _address = '';
  String get address => _address;
  set address(String value) {
    _address = value;
  }

  String _tagline = '';
  String get tagline => _tagline;
  set tagline(String value) {
    _tagline = value;
  }

  String _role = '';
  String get role => _role;
  set role(String value) {
    _role = value;
  }

  DateTime? _createdAt = DateTime.fromMillisecondsSinceEpoch(1740164460000);
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? value) {
    _createdAt = value;
  }

  String _description = '';
  String get description => _description;
  set description(String value) {
    _description = value;
  }

  List<String> _image1 = [];
  List<String> get image1 => _image1;
  set image1(List<String> value) {
    _image1 = value;
  }

  void addToImage1(String value) {
    image1.add(value);
  }

  void removeFromImage1(String value) {
    image1.remove(value);
  }

  void removeAtIndexFromImage1(int index) {
    image1.removeAt(index);
  }

  void updateImage1AtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    image1[index] = updateFn(_image1[index]);
  }

  void insertAtIndexInImage1(int index, String value) {
    image1.insert(index, value);
  }

  int _phone = 0;
  int get phone => _phone;
  set phone(int value) {
    _phone = value;
  }

  String _radioState = '';
  String get radioState => _radioState;
  set radioState(String value) {
    _radioState = value;
  }

  String _ngoname = '';
  String get ngoname => _ngoname;
  set ngoname(String value) {
    _ngoname = value;
  }

  String _licenseNumber = '';
  String get licenseNumber => _licenseNumber;
  set licenseNumber(String value) {
    _licenseNumber = value;
  }

  String _desc = '';
  String get desc => _desc;
  set desc(String value) {
    _desc = value;
  }

  int _people = 0;
  int get people => _people;
  set people(int value) {
    _people = value;
  }

  String _postedBy = '';
  String get postedBy => _postedBy;
  set postedBy(String value) {
    _postedBy = value;
  }

  int _postIdCount = 0;
  int get postIdCount => _postIdCount;
  set postIdCount(int value) {
    _postIdCount = value;
  }

  String _postId = '';
  String get postId => _postId;
  set postId(String value) {
    _postId = value;
  }

  /// username of the rest/ngo that is not logged in
  String _username2 = '';
  String get username2 => _username2;
  set username2(String value) {
    _username2 = value;
  }

  List<double> _listqty = [];
  List<double> get listqty => _listqty;
  set listqty(List<double> value) {
    _listqty = value;
  }

  void addToListqty(double value) {
    listqty.add(value);
  }

  void removeFromListqty(double value) {
    listqty.remove(value);
  }

  void removeAtIndexFromListqty(int index) {
    listqty.removeAt(index);
  }

  void updateListqtyAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    listqty[index] = updateFn(_listqty[index]);
  }

  void insertAtIndexInListqty(int index, double value) {
    listqty.insert(index, value);
  }

  List<String> _listdates = [];
  List<String> get listdates => _listdates;
  set listdates(List<String> value) {
    _listdates = value;
  }

  void addToListdates(String value) {
    listdates.add(value);
  }

  void removeFromListdates(String value) {
    listdates.remove(value);
  }

  void removeAtIndexFromListdates(int index) {
    listdates.removeAt(index);
  }

  void updateListdatesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    listdates[index] = updateFn(_listdates[index]);
  }

  void insertAtIndexInListdates(int index, String value) {
    listdates.insert(index, value);
  }

  bool _isTimeUp = false;
  bool get isTimeUp => _isTimeUp;
  set isTimeUp(bool value) {
    _isTimeUp = value;
  }

  List<int> _listpostnum = [];
  List<int> get listpostnum => _listpostnum;
  set listpostnum(List<int> value) {
    _listpostnum = value;
  }

  void addToListpostnum(int value) {
    listpostnum.add(value);
  }

  void removeFromListpostnum(int value) {
    listpostnum.remove(value);
  }

  void removeAtIndexFromListpostnum(int index) {
    listpostnum.removeAt(index);
  }

  void updateListpostnumAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    listpostnum[index] = updateFn(_listpostnum[index]);
  }

  void insertAtIndexInListpostnum(int index, int value) {
    listpostnum.insert(index, value);
  }

  String _activityicon = '';
  String get activityicon => _activityicon;
  set activityicon(String value) {
    _activityicon = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
