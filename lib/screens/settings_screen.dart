import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neon_template/widgets/custom_list_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: ListView(
        children: List.generate(
          customListTiles.length,
          (index) {
            final tile = customListTiles[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Card(
                elevation: 4,
                shadowColor: colorScheme.shadow,
                child: ListTile(
                  leading: Icon(
                    tile.icon,
                    color: colorScheme.primary,
                  ),
                  title: Text(
                    tile.title,
                    style: TextStyle(
                      color: colorScheme.onSurface,
                    ),
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: colorScheme.primary,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

List<CustomListTile> customListTiles = [
  CustomListTile(
    icon: PhosphorIcons.info(),
    title: "About",
  ),
  CustomListTile(
    icon: PhosphorIcons.mapPin(),
    title: "Location",
  ),
  CustomListTile(
    title: "Notifications",
    icon: PhosphorIcons.bell(),
  ),
  CustomListTile(
    title: "Logout",
    icon: PhosphorIcons.signOut(),
  ),
];
