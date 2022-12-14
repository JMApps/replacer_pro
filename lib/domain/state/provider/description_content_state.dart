import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:replacer_pro/domain/constants.dart';

class DescriptionContentState extends ChangeNotifier {

  var mainAddedContent = Hive.box(Constants.keyMainAddedContent);

  final _descContentInputTextController = TextEditingController();

  TextEditingController get getDescContentInputTextController => _descContentInputTextController;

  String _descriptionValue = '';

  String get getDescriptionValue => _descriptionValue;

  bool _isDescription = false;

  bool get getIsDescription => _isDescription;

  changeSwitchDescription(bool state) {
    _isDescription = state;
    mainAddedContent.put(Constants.keySwitchDescriptionContent, state);
    notifyListeners();
  }

  getDescriptionContent(String value) {
    _descriptionValue = value;
    mainAddedContent.put(Constants.keyDescriptionContent, _descriptionValue);
    notifyListeners();
  }

  loadValues() {
    _isDescription = mainAddedContent.get(Constants.keySwitchDescriptionContent, defaultValue: false);
    _descriptionValue = mainAddedContent.get(Constants.keyDescriptionContent, defaultValue: '');
    _descContentInputTextController.text = _descriptionValue;
    _descContentInputTextController.selection = TextSelection.fromPosition(TextPosition(offset: _descContentInputTextController.text.length));
  }

  @override
  void dispose() {
    mainAddedContent.put(Constants.keyDescriptionContent, _descriptionValue);
    _descContentInputTextController.dispose();
    super.dispose();
  }
}