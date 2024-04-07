import 'package:url_launcher/url_launcher.dart';

Future<void> location() async {
  if (await launchUrl(Uri.parse('11.282583,76.245389'))) {
    throw "Try Again";
  }
}
