import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jump_app/providers/locale_text.dart';
import 'package:jump_app/widgets/numeric_value_editor.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('accepts comma input and closes with the displayed precision', (
    tester,
  ) async {
    double? selectedValue;

    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => LocaleText(language: 'Fr'),
        child: MaterialApp(
          home: Builder(
            builder: (context) => TextButton(
              onPressed: () async {
                selectedValue = await showNumericValueEditor(
                  context,
                  value: 300,
                  min: 200,
                  max: 460,
                  precision: 0,
                );
              },
              child: const Text('Edit'),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Edit'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextFormField), '333,7');
    await tester.tap(find.text('Appliquer'));
    await tester.pumpAndSettle();

    expect(selectedValue, 334);
    expect(tester.takeException(), isNull);
  });

  testWidgets('rejects an entry outside the displayed range', (tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => LocaleText(language: 'Fr'),
        child: MaterialApp(
          home: Builder(
            builder: (context) => TextButton(
              onPressed: () => showNumericValueEditor(
                context,
                value: 300,
                min: 200,
                max: 460,
                precision: 0,
              ),
              child: const Text('Edit'),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Edit'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextFormField), '500');
    await tester.tap(find.text('Appliquer'));
    await tester.pump();

    expect(
      find.text('La valeur est hors de l\'intervalle permis.'),
      findsOneWidget,
    );
    expect(find.byType(AlertDialog), findsOneWidget);
  });
}
