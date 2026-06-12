import 'package:flutter/cupertino.dart';
import '../theme/app_theme.dart';
import '../models/alumno.dart';
import '../data/data.dart';

class DetalleAlumnoScreen extends StatelessWidget {
  final Alumno alumno;
  const DetalleAlumnoScreen({super.key, required this.alumno});

  void _eliminar(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (ctx) => CupertinoAlertDialog(
        title: const Text('Eliminar Alumno'),
        content: Text('¿Seguro que deseas eliminar a ${alumno.nombreCompleto}?'),
        actions: [
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              alumnosData.removeWhere((a) => a['id'] == alumno.id);
              Navigator.of(ctx).pop();
              Navigator.of(context).pop();
            },
            child: const Text('Eliminar'),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            child: const Text('Cancelar'),
            onPressed: () => Navigator.of(ctx).pop(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, String> detalles = {
      'Código': alumno.codigo,
      'Ciclo': alumno.ciclo,
      'Email': alumno.email,
      'Teléfono': alumno.telefono,
      'Promedio': alumno.promedio.toStringAsFixed(1),
    };

    final Map<String, IconData> iconos = {
      'Código': CupertinoIcons.barcode,
      'Ciclo': CupertinoIcons.calendar,
      'Email': CupertinoIcons.mail,
      'Teléfono': CupertinoIcons.phone,
      'Promedio': CupertinoIcons.chart_bar,
    };

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
                        Text('Lista',
                            style: TextStyle(
                                color: CupertinoColors.white, fontSize: 16)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Text(
                      alumno.nombre,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: CupertinoColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _eliminar(context),
                    child: const Icon(CupertinoIcons.trash,
                        color: CupertinoColors.white, size: 20),
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFF7C3AED), Color(0xFFEC4899)],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x407C3AED),
                          blurRadius: 16,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0x33FFFFFF),
                          ),
                          child: Center(
                            child: Text(
                              alumno.nombre[0].toUpperCase(),
                              style: const TextStyle(
                                color: CupertinoColors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          alumno.nombreCompleto,
                          style: const TextStyle(
                            color: CupertinoColors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0x33FFFFFF),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            alumno.carrera,
                            style: const TextStyle(
                              color: CupertinoColors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  CupertinoListSection.insetGrouped(
                    header: const Text('INFORMACIÓN ACADÉMICA'),
                    children: detalles.entries
                        .map((e) => CupertinoListTile(
                              leading: Icon(iconos[e.key]!,
                                  color: AppTheme.primary),
                              title: Text(e.key),
                              trailing: Text(e.value,
                                  style: const TextStyle(
                                      color: AppTheme.textSecondary)),
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: CupertinoButton(
                      color: const Color(0xFFFFEBEB),
                      borderRadius: BorderRadius.circular(12),
                      onPressed: () => _eliminar(context),
                      child: const Text(
                        'Eliminar Alumno',
                        style: TextStyle(
                          color: AppTheme.danger,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}