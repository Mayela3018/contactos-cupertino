import 'package:flutter/cupertino.dart';
import '../theme/app_theme.dart';
import '../models/alumno.dart';
import '../data/data.dart';
import 'detalle_alumno_screen.dart';

class ListaAlumnosScreen extends StatefulWidget {
  const ListaAlumnosScreen({super.key});

  @override
  State<ListaAlumnosScreen> createState() => _ListaAlumnosScreenState();
}

class _ListaAlumnosScreenState extends State<ListaAlumnosScreen> {
  String _busqueda = '';

  List<Alumno> get _filtrados {
    final todos = getAlumnos();
    if (_busqueda.isEmpty) return todos;
    return todos
        .where((a) =>
            a.nombreCompleto.toLowerCase().contains(_busqueda.toLowerCase()) ||
            a.codigo.toLowerCase().contains(_busqueda.toLowerCase()) ||
            a.carrera.toLowerCase().contains(_busqueda.toLowerCase()))
        .toList();
  }

  Color _colorPromedio(double p) {
    if (p >= 17) return AppTheme.cyan;
    if (p >= 13) return AppTheme.primaryLight;
    return AppTheme.danger;
  }

  @override
  Widget build(BuildContext context) {
    final alumnos = _filtrados;
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
                      'Lista de Alumnos',
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

            Padding(
              padding: const EdgeInsets.all(12),
              child: CupertinoSearchTextField(
                placeholder: 'Buscar alumno, código o carrera...',
                onChanged: (v) => setState(() => _busqueda = v),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${alumnos.length} alumno(s)',
                  style: const TextStyle(
                      fontSize: 13, color: AppTheme.textSecondary),
                ),
              ),
            ),
            Expanded(
              child: alumnos.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(CupertinoIcons.person_3,
                              size: 60, color: AppTheme.textSecondary),
                          SizedBox(height: 12),
                          Text('No se encontraron alumnos',
                              style:
                                  TextStyle(color: AppTheme.textSecondary)),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: alumnos.length,
                      itemBuilder: (ctx, i) {
                        final a = alumnos[i];
                        return GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            CupertinoPageRoute(
                              builder: (_) => DetalleAlumnoScreen(alumno: a),
                            ),
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              color: CupertinoColors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x0F000000),
                                  blurRadius: 8,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.all(14),
                            child: Row(
                              children: [
                                Container(
                                  width: 46,
                                  height: 46,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF7C3AED),
                                        Color(0xFFEC4899),
                                      ],
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      a.nombre[0].toUpperCase(),
                                      style: const TextStyle(
                                        color: CupertinoColors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(a.nombreCompleto,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: AppTheme.textPrimary,
                                          )),
                                      Text(a.codigo,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: AppTheme.textSecondary,
                                          )),
                                      Text(a.carrera,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: AppTheme.textSecondary,
                                          )),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: _colorPromedio(a.promedio)
                                            .withOpacity(0.15),
                                        borderRadius:
                                            BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        a.promedio.toStringAsFixed(1),
                                        style: TextStyle(
                                          color: _colorPromedio(a.promedio),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text('Ciclo ${a.ciclo}',
                                        style: const TextStyle(
                                          fontSize: 11,
                                          color: AppTheme.textSecondary,
                                        )),
                                  ],
                                ),
                                const SizedBox(width: 6),
                                const Icon(CupertinoIcons.chevron_right,
                                    color: AppTheme.textSecondary, size: 16),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}