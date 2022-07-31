import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:replacer_pro/domain/constants.dart';

class MainContentState with ChangeNotifier {

  var mainAddedContent = Hive.box(Constants.keyMainAddedContent);

  final _mainContentInputTextController = TextEditingController();

  TextEditingController get getMainContentInputTextController => _mainContentInputTextController;

  String _defaultValue = '';

  String get getDefaultValue => _defaultValue;

  String _dropDownValue = 'Обычный текст';

  String get getDropDownValue => _dropDownValue;

  final List<String> varTwoCoded = ['а', 'б', 'в', 'г', 'д', 'е', 'ё', 'ж', 'з', 'и', 'й', 'к', 'л', 'м', 'н', 'о', 'п', 'р', 'с', 'т', 'у', 'ф', 'х', 'ц', 'ч', 'ш', 'щ', 'ъ', 'ы', 'ь', 'э', 'ю', 'я'];
  final List<String> varTwoDeCoded = ['а', 'б', 'в', 'г', 'g', 'е', 'ё', 'ж', 'з', 'u', 'ũ', 'k', 'л', 'м', 'н', 'о', 'n', 'p', 'с', 'm', 'y', 'ф', 'х', 'ц', 'ч', 'ш', 'щ', 'ъ', 'ы', 'ь', 'э', 'ю', 'я'];

  final List<String> varThreeCoded = ['а', 'б', 'в', 'г', 'д', 'е', 'ё', 'ж', 'з', 'и', 'й', 'к', 'л', 'м', 'н', 'о', 'п', 'р', 'с', 'т', 'у', 'ф', 'х', 'ц', 'ч', 'ш', 'щ', 'ъ', 'ы', 'ь', 'э', 'ю', 'я'];
  final List<String> varThreeDeCoded = ['ã', 'ɓ', 'Ᏸ', 'г', 'ğ', 'ę', 'ē', 'ӝ', 'ჳ', 'u', 'ũ', 'ќ', 'л', 'ḿ', 'ӈ', 'ó', 'ń', 'ҏ', 'ċ', 'm', 'ẏ', 'ჶ', 'ᶍ', 'ų', 'ӵ', 'ω', 'ખ', '৮', 'ӹ', '৮', 'ӭ', 'ю', 'я'];

  final List<String> varFourCoded = ['а', 'о', 'с', 'х', 'р', 'у',];
  final List<String> varFourDeCoded = ['a', 'o', 'c', 'x', 'p', 'y'];


  getCurrentText() {
    _defaultValue = _mainContentInputTextController.text;
    notifyListeners();
  }

  changeDropDownValue(String newValue) {
    _dropDownValue = newValue;
    mainAddedContent.put(Constants.keyDropDownValue, _dropDownValue);
    notifyListeners();
  }

  replaceVarTwoText() {
    _defaultValue = _mainContentInputTextController.text;
    Map<String, String> map = Map.fromIterables(varTwoCoded, varTwoDeCoded);
    _defaultValue = map.entries.fold(_defaultValue, (previousValue, element) => previousValue.replaceAll(element.key, element.value));
    notifyListeners();
  }

  replaceVarThreeText() {
    _defaultValue = _mainContentInputTextController.text;
    Map<String, String> map = Map.fromIterables(varThreeCoded, varThreeDeCoded);
    _defaultValue = map.entries.fold(_defaultValue, (previousValue, element) => previousValue.replaceAll(element.key, element.value));
    notifyListeners();
  }

  replaceVarFourText() {
    _defaultValue = _mainContentInputTextController.text;
    Map<String, String> map = Map.fromIterables(varFourCoded, varFourDeCoded);
    _defaultValue = map.entries.fold(_defaultValue, (previousValue, element) => previousValue.replaceAll(element.key, element.value));
    notifyListeners();
  }

  loadDropDownValue() {
    _dropDownValue = mainAddedContent.get(Constants.keyDropDownValue, defaultValue: 'Обычный текст');
  }
}