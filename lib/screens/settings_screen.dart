import 'package:flutter_neon_template/constants.dart';
import 'package:flutter_neon_template/main.dart';
import 'package:flutter_neon_template/service/user_service.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neon_template/widgets/custom_list_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: ListView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              children: [
                ...List.generate(
                  customListTiles.length,
                  (index) {
                    final tile = customListTiles[index];
                    return tile.title == "Logout"
                        ? Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                backgroundColor: Colors.redAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () async {
                                await logoutUser();
                                // ignore: use_build_context_synchronously
                                GoRouter.of(context).go('/');
                              },
                              icon: Icon(
                                tile.icon,
                                color: Colors.white,
                              ),
                              label: Text(
                                tile.title,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
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
                                onTap: () {
                                  // Handle other list tile actions
                                  print('${tile.title} tapped');
                                },
                              ),
                            ),
                          );
                  },
                ),
              ],
            ),
          ),
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
