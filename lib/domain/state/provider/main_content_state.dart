import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:replacer_pro/domain/constants.dart';

class MainContentState extends ChangeNotifier {

  var mainAddedContent = Hive.box(Constants.keyMainAddedContent);

  final _mainContentInputTextController = TextEditingController();

  TextEditingController get getMainContentInputTextController => _mainContentInputTextController;

  String _defaultContent = '';

  String get getDefaultContent => _defaultContent;

  String _dropDownValue = 'Обычный текст';

  String get getDropDownValue => _dropDownValue;

  final List<String> varTwoCoded = ['а', 'б', 'в', 'г', 'д', 'е', 'ё', 'ж', 'з', 'и', 'й', 'к', 'л', 'м', 'н', 'о', 'п', 'р', 'с', 'т', 'у', 'ф', 'х', 'ц', 'ч', 'ш', 'щ', 'ъ', 'ы', 'ь', 'э', 'ю', 'я'];
  final List<String> varTwoDeCoded = ['а', 'б', 'в', 'г', 'g', 'е', 'ё', 'ж', 'з', 'u', 'ũ', 'k', 'л', 'м', 'н', 'о', 'n', 'p', 'с', 'm', 'y', 'ф', 'х', 'ц', 'ч', 'ш', 'щ', 'ъ', 'ы', 'ь', 'э', 'ю', 'я'];

  final List<String> varThreeCoded = ['а', 'б', 'в', 'г', 'д', 'е', 'ё', 'ж', 'з', 'и', 'й', 'к', 'л', 'м', 'н', 'о', 'п', 'р', 'с', 'т', 'у', 'ф', 'х', 'ц', 'ч', 'ш', 'щ', 'ъ', 'ы', 'ь', 'э', 'ю', 'я'];
  final List<String> varThreeDeCoded = ['ã', 'ɓ', 'Ᏸ', 'г', 'ğ', 'ę', 'ē', 'ӝ', 'ჳ', 'u', 'ũ', 'ќ', 'л', 'ḿ', 'ӈ', 'ó', 'ń', 'ҏ', 'ċ', 'm', 'ẏ', 'ჶ', 'ᶍ', 'ų', 'ӵ', 'ω', 'ખ', '৮', 'ӹ', '৮', 'ӭ', 'ю', 'я'];

  final List<String> varFourCoded = ['а', 'о', 'с', 'х', 'р', 'у', 'е', 'р'];
  final List<String> varFourDeCoded = ['a', 'o', 'c', 'x', 'p', 'y', 'e', 'p'];

  changeDropDownValue(String newValue) {
    _dropDownValue = newValue;
    mainAddedContent.put(Constants.keyDropDownValue, _dropDownValue);
    notifyListeners();
  }

  getCurrentMainContent(String mainContent) {
    _defaultContent = mainContent;
    notifyListeners();
  }

  replaceVarTwoText() {
    Map<String, String> map = Map.fromIterables(varTwoCoded, varTwoDeCoded);
    _defaultContent = map.entries.fold(_defaultContent, (previousValue, element) => previousValue.replaceAll(element.key, element.value));
    notifyListeners();
  }

  replaceVarThreeText() {
    Map<String, String> map = Map.fromIterables(varThreeCoded, varThreeDeCoded);
    _defaultContent = map.entries.fold(_defaultContent, (previousValue, element) => previousValue.replaceAll(element.key, element.value));
    notifyListeners();
  }

  replaceVarFourText() {
    Map<String, String> map = Map.fromIterables(varFourCoded, varFourDeCoded);
    _defaultContent = map.entries.fold(_defaultContent, (previousValue, element) => previousValue.replaceAll(element.key, element.value));
    notifyListeners();
  }

  loadDropDownValue() {
    _dropDownValue = mainAddedContent.get(Constants.keyDropDownValue, defaultValue: 'Обычный текст');
  }

  @override
  void dispose() {
    _mainContentInputTextController.dispose();
    super.dispose();
  }
}