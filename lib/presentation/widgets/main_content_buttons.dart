import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:replacer_pro/domain/state/provider/description_content_state.dart';
import 'package:replacer_pro/domain/state/provider/main_content_state.dart';

class MainContentButtons extends StatelessWidget {
  const MainContentButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(width: 16),
            Flexible(
              flex: 1,
              child: SizedBox(
                width: double.maxFinite,
                child: MaterialButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.5),
                  ),
                  child: const Text(
                    'Вставить',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    FlutterClipboard.paste().then((value) {
                      context.read<MainContentState>().getMainContentInputTextController.text = value;
                      context.read<MainContentState>().getCurrentText();
                    },
                    );
                  },
                ),
              ),
            ),
            const SizedBox(width: 8),
            Flexible(
              flex: 1,
              child: SizedBox(
                width: double.maxFinite,
                child: MaterialButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.5),
                  ),
                  child: const Text(
                    'Скопировать',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    switch (context.read<MainContentState>().getDropDownValue) {
                      case 'Обычный текст':
                        context.read<MainContentState>().getCurrentText();
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
                    if (context.read<MainContentState>().getDefaultValue.isNotEmpty) {
                      if (context.read<DescriptionContentState>().getIsDescription) {
                        if (context.read<DescriptionContentState>().getDescriptionValue.isNotEmpty) {
                          FlutterClipboard.copy('${context.read<MainContentState>().getDefaultValue}\n\n'
                              '${context.read<DescriptionContentState>().getDescriptionValue}');
                        }
                      } else {
                        FlutterClipboard.copy(context.read<MainContentState>().getDefaultValue);
                      }
                    } else {

                    }
                  },
                ),
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
        Row(
          children: [
            const SizedBox(width: 16),
            Flexible(
              flex: 1,
              child: SizedBox(
                width: double.maxFinite,
                child: MaterialButton(
                  color: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.5),
                  ),
                  child: const Text(
                    'Очистить',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    context.read<MainContentState>().getCurrentText();
                    if (context.read<MainContentState>().getDefaultValue.isNotEmpty) {
                      context.read<MainContentState>().getMainContentInputTextController.clear();
                    }
                  },
                ),
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ],
    );
  }
}
