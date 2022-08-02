import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:replacer_pro/domain/state/provider/description_content_state.dart';
import 'package:replacer_pro/domain/state/provider/main_content_state.dart';
import 'package:replacer_pro/domain/theme/app_theme.dart';

class MainContentButtons extends StatelessWidget {
  const MainContentButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton.icon(
          label: Text(
            'Вставить',
            style: TextStyle(color: myColor.pasteButtonColor),
          ),
          icon: Icon(
            CupertinoIcons.add_circled,
            color: myColor.pasteButtonColor,
          ),
          onPressed: () {
            FlutterClipboard.paste().then(
              (value) {
                context.read<MainContentState>().getCurrentMainContent(value);
                context.read<MainContentState>().getMainContentInputTextController.text = value;
                if (value.isNotEmpty) {
                  _showSnackMessage(context, myColor.pasteButtonColor, 'Вставлено из буфера обмена');
                }
              },
            );
          },
          style: TextButton.styleFrom(
            primary: myColor.pasteButtonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(color: myColor.pasteButtonColor),
            ),
          ),
        ),
        TextButton.icon(
          label: Text(
            'Применить',
            style: TextStyle(color: myColor.changeButtonColor),
          ),
          icon: Icon(
            CupertinoIcons.arrow_right_arrow_left_circle,
            color: myColor.changeButtonColor,
          ),
          onPressed: () {
            context.read<MainContentState>().getCurrentMainContent(context.read<MainContentState>().getMainContentInputTextController.text);
            switch (context.read<MainContentState>().getDropDownValue) {
              case 'Обычный текст':
                // check
                context.read<MainContentState>().getMainContentInputTextController.text;
                break;
              case 'nользоваmельсkuũ':
                context.read<MainContentState>().replaceVarTwoText();
                break;
              case 'ńóл৮ჳóᏰãmęл৮ċќuũ':
                context.read<MainContentState>().replaceVarThreeText();
                break;
              case 'Текст невидимка':
                context.read<MainContentState>().replaceVarFourText();
                break;
              default:
                'Обычный текст';
            }
            if (context.read<MainContentState>().getMainContentInputTextController.text.isNotEmpty &&
                context.read<MainContentState>().getMainContentInputTextController.text != null) {
              if (context.read<DescriptionContentState>().getIsDescription &&
                  context.read<DescriptionContentState>().getDescriptionValue.isNotEmpty) {
                FlutterClipboard.copy(
                    '${context.read<MainContentState>().getDefaultContent}\n\n'
                    '${context.read<DescriptionContentState>().getDescriptionValue}');
                _showSnackMessage(context, myColor.changeButtonColor, 'Преобразовано и скопировано');
              } else {
                FlutterClipboard.copy(
                    context.read<MainContentState>().getDefaultContent);
                _showSnackMessage(context, myColor.changeButtonColor, 'Преобразовано и скопировано');
              }
            }
          },
          style: TextButton.styleFrom(
            primary: myColor.changeButtonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(color: myColor.changeButtonColor),
            ),
          ),
        ),
        TextButton.icon(
          label: Text(
            'Очистить',
            style: TextStyle(
              color: myColor.clearButtonColor,
            ),
          ),
          icon: Icon(
            CupertinoIcons.clear_circled,
            color: myColor.clearButtonColor,
          ),
          onPressed: () {
            if (context.read<MainContentState>().getDefaultContent.isNotEmpty) {
              context.read<MainContentState>().getMainContentInputTextController.clear();
              context.read<MainContentState>().getCurrentMainContent('');
              _showSnackMessage(context, myColor.clearButtonColor, 'Очищено');
            }
          },
          style: TextButton.styleFrom(
            primary: myColor.clearButtonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(color: myColor.clearButtonColor),
            ),
          ),
        ),
      ],
    );
  }

  _showSnackMessage(BuildContext context, Color color, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: color,
        content: Text(
          message,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        duration: const Duration(milliseconds: 250),
      ),
    );
  }
}
