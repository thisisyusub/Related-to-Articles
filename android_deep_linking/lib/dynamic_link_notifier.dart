import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dynamic_link_service.dart';

class DynamicLinkNotifier extends StateNotifier<String?> {
  DynamicLinkNotifier({
    required this.dynamicLinkService,
  }) : super(null) {
    _streamSubscription = dynamicLinkService.dynamicLinkStream.listen(
      (event) {
        state = event.link.path;
      },
    );
  }

  final DynamicLinkService dynamicLinkService;
  StreamSubscription? _streamSubscription;

  Future<void> getInitialLink() async {
    final path = await dynamicLinkService.initialLink;
    state = path;
  }

  void clear() => state = null;

  @override
  void dispose() {
    _streamSubscription?.cancel();
    _streamSubscription = null;
    super.dispose();
  }
}
