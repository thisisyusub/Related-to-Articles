import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

abstract class DynamicLinkService {
  Future<String?> get initialLink;
  Stream<PendingDynamicLinkData> get dynamicLinkStream;
}

class DynamicLinkServiceImpl implements DynamicLinkService {
  DynamicLinkServiceImpl({required this.dynamicLinks});

  final FirebaseDynamicLinks dynamicLinks;

  @override
  Future<String?> get initialLink async {
    try {
      final deepLink = await dynamicLinks.getInitialLink();
      return deepLink?.link.path;
    } catch (e) {
      return null;
    }
  }

  @override
  Stream<PendingDynamicLinkData> get dynamicLinkStream {
    return dynamicLinks.onLink;
  }
}
