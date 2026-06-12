import 'package:flutter/cupertino.dart';
import '../theme/app_theme.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppTheme.background,
      child: SafeArea(
        child: Column(
          children: [
            // Navbar manual
            Container(
              width: double.infinity,
              color: AppTheme.primary,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Row(
                      children: [
                        Icon(CupertinoIcons.back,
                            color: CupertinoColors.white, size: 20),
                        SizedBox(width: 4),
                        Text('Menú',
                            style: TextStyle(
                                color: CupertinoColors.white, fontSize: 16)),
                      ],
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      'Mi Perfil',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: CupertinoColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 60),
                ],
              ),
            ),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Center(
                    child: Column(
                      children: [
                        Container(
                          width: 90,
                          height: 90,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [Color(0xFF7C3AED), Color(0xFFEC4899)],
                            ),
                          ),
                          child: const Icon(CupertinoIcons.person_fill,
                              size: 46, color: CupertinoColors.white),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Administrador del Sistema',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold,
                              color: AppTheme.textPrimary),
                        ),
                        const SizedBox(height: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppTheme.accent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text('Administrador',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: AppTheme.primary,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  CupertinoListSection.insetGrouped(
                    header: const Text('INFORMACIÓN DE CUENTA'),
                    children: [
                      CupertinoListTile(
                        leading: const Icon(CupertinoIcons.person,
                            color: AppTheme.primary),
                        title: const Text('Usuario'),
                        trailing: const Text('admin',
                            style:
                                TextStyle(color: AppTheme.textSecondary)),
                      ),
                      CupertinoListTile(
                        leading: const Icon(CupertinoIcons.mail,
                            color: AppTheme.primary),
                        title: const Text('Email'),
                        trailing: const Text('admin@tecsup.edu.pe',
                            style: TextStyle(
                                color: AppTheme.textSecondary,
                                fontSize: 12)),
                      ),
                      CupertinoListTile(
                        leading: const Icon(CupertinoIcons.phone,
                            color: AppTheme.primary),
                        title: const Text('Teléfono'),
                        trailing: const Text('01-123-4567',
                            style:
                                TextStyle(color: AppTheme.textSecondary)),
                      ),
                    ],
                  ),
                  CupertinoListSection.insetGrouped(
                    header: const Text('INSTITUCIÓN'),
                    children: [
                      CupertinoListTile(
                        leading: const Icon(CupertinoIcons.building_2_fill,
                            color: AppTheme.primary),
                        title: const Text('Centro'),
                        subtitle: const Text('Instituto Educativo Tecsup'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}