import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:replacer_pro/domain/state/provider/description_content_state.dart';
import 'package:replacer_pro/domain/state/provider/main_content_state.dart';

class MainContentButtons extends StatelessWidget {
  const MainContentButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton.icon(
          label: const Text(
            'Вставить',
            style: TextStyle(color: Colors.grey),
          ),
          icon: const Icon(
            CupertinoIcons.add_circled,
            color: Colors.grey,
          ),
          onPressed: () {
            FlutterClipboard.paste().then(
              (value) {
                context.read<MainContentState>().getCurrentMainContent(value);
                context.read<MainContentState>().getMainContentInputTextController.text = value;
              },
            );
          },
        ),
        TextButton.icon(
          label: const Text(
            'Применить',
            style: TextStyle(color: Colors.teal),
          ),
          icon: const Icon(
            CupertinoIcons.arrow_right_arrow_left_circle,
            color: Colors.teal,
          ),
          onPressed: () {
            switch (context.read<MainContentState>().getDropDownValue) {
              case 'Обычный текст':
                // check
                context.read<MainContentState>().getDefaultContent;
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
            if (context.read<MainContentState>().getDefaultContent.isNotEmpty &&
                context.read<MainContentState>().getDefaultContent != null) {
              if (context.read<DescriptionContentState>().getIsDescription &&
              context.read<DescriptionContentState>().getDescriptionValue.isNotEmpty) {
                FlutterClipboard.copy('${context.read<MainContentState>().getDefaultContent}\n\n'
                    '${context.read<DescriptionContentState>().getDescriptionValue}');
              } else {
                FlutterClipboard.copy(context.read<MainContentState>().getDefaultContent);
              }
            }
          },
        ),
        TextButton.icon(
          label: const Text(
            'Очистить',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
          icon: const Icon(
            CupertinoIcons.clear_circled,
            color: Colors.red,
          ),
          onPressed: () {
            if (context.read<MainContentState>().getDefaultContent.isNotEmpty) {
              context.read<MainContentState>().getMainContentInputTextController.clear();
              context.read<MainContentState>().getCurrentMainContent('');
            }
          },
        ),
      ],
    );
  }
}
