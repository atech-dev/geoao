import 'package:flutter_test/flutter_test.dart';

import 'package:geoao/geoao.dart';

void main() {
  test('test provinces and counties assets', () async {
    TestWidgetsFlutterBinding.ensureInitialized();

    final geoao = Geoao();
    expect((await geoao.getCounties(1))[0].countyName, 'Belas');
    // expect(calculator.addOne(2), 3);
    // expect(calculator.addOne(-7), -6);
    // expect(calculator.addOne(0), 1);
  });
}
