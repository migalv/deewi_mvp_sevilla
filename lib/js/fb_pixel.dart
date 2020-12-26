//ignore_for_file: non_constant_identifier_names

@JS()
library facebook_pixel_events;

import 'package:js/js.dart';

@JS('fbq')
external void logFBPixelEvents(
    String eventType, String eventName, FBParams params);

@JS()
@anonymous
class FBParams {
  // external List<String> get content_ids;
  external String get content_name;
  external String get content_type;
  external String get currency;
  external double get value;

  external factory FBParams({
    // List<String> content_ids,
    String content_name,
    String content_type,
    String currency,
    double value,
  });
}
