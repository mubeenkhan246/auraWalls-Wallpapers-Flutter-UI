import 'package:flutter/material.dart';

import '../../core/models/aura_data.dart';

class CollectionsScreen extends StatelessWidget {
  const CollectionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.fromLTRB(
        20,
        MediaQuery.paddingOf(context).top + 20,
        20,
        120,
      ),
      itemCount: collections.length,
      itemBuilder: (context, index) {
        final item = collections[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: SizedBox(
            height: index == 0 ? 330 : 230,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(36),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(item.imageUrl, fit: BoxFit.cover),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withValues(alpha: .82),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 22,
                    right: 22,
                    bottom: 22,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(fontWeight: FontWeight.w900),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          item.subtitle,
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
