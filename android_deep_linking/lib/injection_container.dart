import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dynamic_link_notifier.dart';
import 'dynamic_link_service.dart';

final firebaseDynamicLinksProvider = Provider<FirebaseDynamicLinks>(
  (ref) => FirebaseDynamicLinks.instance,
);

final dynamicLinkServiceProvider = Provider<DynamicLinkService>(
  (ref) => DynamicLinkServiceImpl(
    dynamicLinks: ref.watch(firebaseDynamicLinksProvider),
  ),
);

final dynamicLinkNotifierProvider =
    StateNotifierProvider<DynamicLinkNotifier, String?>(
  (ref) => DynamicLinkNotifier(
    dynamicLinkService: ref.watch(dynamicLinkServiceProvider),
  ),
);
