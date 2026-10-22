import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jump_app/widgets/background_image.dart';

void main() {
  Widget buildFrame(String imagePath) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(children: [BackgoundImage(floor: 10, imagePath: imagePath)]),
    );
  }

  testWidgets('updates the displayed asset when the image path changes', (
    tester,
  ) async {
    const axelPath = 'assets/images/key_frames_axel5.png';
    const lutzPath = 'assets/images/key_frames_lutz4.png';

    await tester.pumpWidget(buildFrame(axelPath));

    var image = tester.widget<Image>(find.byType(Image));
    expect(image.key, const ValueKey(axelPath));
    expect((image.image as AssetImage).assetName, axelPath);

    await tester.pumpWidget(buildFrame(lutzPath));
    await tester.pump();

    image = tester.widget<Image>(find.byType(Image));
    expect(image.key, const ValueKey(lutzPath));
    expect((image.image as AssetImage).assetName, lutzPath);
  });
}
