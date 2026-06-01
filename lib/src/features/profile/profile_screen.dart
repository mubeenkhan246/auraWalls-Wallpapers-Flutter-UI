import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';
import '../../core/widgets/glass.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.fromLTRB(
        20,
        MediaQuery.paddingOf(context).top + 20,
        20,
        120,
      ),
      children: [
        Glass(
          radius: 36,
          padding: const EdgeInsets.all(22),
          child: Row(
            children: [
              Container(
                width: 84,
                height: 84,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [AuraColors.electricPurple, AuraColors.neonBlue],
                  ),
                ),
                child: const Icon(Icons.person_rounded, size: 42),
              ),
              const SizedBox(width: 18),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Aura Studio',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        color: AuraColors.electricPurple.withValues(alpha: .25),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Premium Vision',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: const [
            Expanded(
              child: _Metric(value: '128', label: 'Downloads'),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _Metric(value: '42', label: 'Favorites'),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Glass(
          radius: 30,
          child: Column(
            children: const [
              _Setting(icon: Icons.dark_mode_rounded, label: 'Adaptive theme'),
              _Setting(
                icon: Icons.motion_photos_on_rounded,
                label: 'Motion depth',
              ),
              _Setting(
                icon: Icons.hdr_auto_rounded,
                label: 'AI recommendations',
              ),
              _Setting(
                icon: Icons.cloud_download_rounded,
                label: 'Ultra quality',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Metric extends StatelessWidget {
  const _Metric({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Glass(
      radius: 28,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w900),
          ),
          Text(label, style: const TextStyle(color: Colors.white60)),
        ],
      ),
    );
  }
}

class _Setting extends StatelessWidget {
  const _Setting({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: AuraColors.neonBlue),
      title: Text(label, style: const TextStyle(fontWeight: FontWeight.w700)),
      trailing: Switch(value: true, onChanged: (_) {}),
    );
  }
}
