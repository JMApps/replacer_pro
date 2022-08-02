import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:replacer_pro/domain/state/provider/description_content_state.dart';
import 'package:replacer_pro/domain/state/provider/main_content_state.dart';
import 'package:replacer_pro/presentation/widgets/description_content_tile.dart';
import 'package:replacer_pro/presentation/widgets/input_drop_down_list.dart';
import 'package:replacer_pro/presentation/widgets/main_app_bar.dart';
import 'package:replacer_pro/presentation/widgets/main_content_buttons.dart';
import 'package:replacer_pro/presentation/widgets/main_content_text_input.dart';

class MainContentPage extends StatelessWidget {
  const MainContentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<MainContentState>().loadDropDownValue();
    context.read<DescriptionContentState>().loadValues();
    FocusScopeNode currentFocus = FocusScope.of(context);
    return GestureDetector(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: const PreferredSize(
          preferredSize: Size(double.maxFinite, 50),
          child: MainAppBar(),
        ),
        body: CupertinoScrollbar(
          child: ListView(
            children: [
              const InputDropDownList(),
              const MainContentTextInput(),
              const MainContentButtons(),
              const DescriptionContentTile(),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 16,
                ),
                child: SelectableText(
                    'Предварительный вид:\n\n${context.watch<MainContentState>().getDefaultContent}'),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
    );
  }
}
