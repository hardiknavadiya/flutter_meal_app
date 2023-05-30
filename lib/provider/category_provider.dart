import 'package:flutter_application_3/dummy_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final categoryProvider = Provider((ref) {
  return dummyCategories;
});
