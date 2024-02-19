import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:trans_media_store/src/constants/design/paddings.dart';
import 'package:trans_media_store/src/services/connection/connection_state_provider.dart';

class ConnectionMsgWrapper extends StatelessWidget {
  const ConnectionMsgWrapper({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        child,
        SizedBox(
          width: double.infinity,
          child: Consumer(
            builder: (context, ref, child) {
              final connectionStream = ref.watch(connectionStateProvider);
              return connectionStream.when(
                data: (data) => switch (data) {
                  InternetConnectionStatus.connected => const SizedBox.shrink(),
                  _ => Material(
                      color: Colors.red,
                      child: Padding(
                        padding: vertical10 + horizontal12,
                        child: const Row(
                          children: [
                            Icon(
                              Icons.info_outline,
                              color: Colors.white,
                            ),
                            SizedBox(width: 6),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    "You're not connected to the internet. App is currently running on Offline mode!",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                },
                error: (error, stackTrace) => const SizedBox.shrink(),
                loading: () => const SizedBox.shrink(),
              );
            },
          ),
        ),
      ],
    );
  }
}
