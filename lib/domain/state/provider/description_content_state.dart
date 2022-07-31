import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:replacer_pro/domain/constants.dart';

class DescriptionContentState with ChangeNotifier {

  var mainAddedContent = Hive.box(Constants.keyMainAddedContent);

  final _descriptionContentInputTextController = TextEditingController();

  TextEditingController get getDescriptionContentInputTextController => _descriptionContentInputTextController;

  bool _isDescription = true;

  bool get getIsDescription => _isDescription;

  String _descriptionValue = '';

  String get getDescriptionValue => _descriptionValue;

  changeSwitchDescription(bool state) {
    _isDescription = state;
    mainAddedContent.put(Constants.keySwitchDescriptionContent, state);
    notifyListeners();
  }

  getDescriptionContent() {
    _descriptionValue = _descriptionContentInputTextController.text;
    mainAddedContent.put(Constants.keyDescriptionContent, _descriptionValue);
    notifyListeners();
  }

  loadValues() {
    _isDescription = mainAddedContent.get(Constants.keySwitchDescriptionContent, defaultValue: true);
    _descriptionValue = mainAddedContent.get(Constants.keyDescriptionContent, defaultValue: '');
    _descriptionContentInputTextController.text = _descriptionValue;
  }
}