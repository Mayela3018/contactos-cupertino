import 'package:flutter/cupertino.dart';
import '../theme/app_theme.dart';
import '../data/data.dart';

class RegistrarAlumnoScreen extends StatefulWidget {
  const RegistrarAlumnoScreen({super.key});

  @override
  State<RegistrarAlumnoScreen> createState() => _RegistrarAlumnoScreenState();
}

class _RegistrarAlumnoScreenState extends State<RegistrarAlumnoScreen> {
  final _nombreCtrl = TextEditingController();
  final _apellidoCtrl = TextEditingController();
  final _codigoCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _telefonoCtrl = TextEditingController();
  final _promedioCtrl = TextEditingController();

  final List<String> _carreras = [
    'Desarrollo de Software',
    'Redes y Comunicaciones',
    'Electrónica',
    'Mecatrónica',
    'Administración',
  ];

  final List<String> _ciclos = ['1ro', '2do', '3ro', '4to', '5to', '6to'];

  String _carrera = 'Desarrollo de Software';
  String _ciclo = '1ro';

  void _showPicker(List<String> items, String current, Function(String) onSelect) {
    int idx = items.indexOf(current);
    showCupertinoModalPopup(
      context: context,
      builder: (ctx) => Container(
        height: 250,
        color: CupertinoColors.systemBackground.resolveFrom(ctx),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoButton(
                  child: const Text('Cancelar'),
                  onPressed: () => Navigator.of(ctx).pop(),
                ),
                CupertinoButton(
                  child: const Text('Listo',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  onPressed: () {
                    onSelect(items[idx]);
                    Navigator.of(ctx).pop();
                  },
                ),
              ],
            ),
            Expanded(
              child: CupertinoPicker(
                itemExtent: 40,
                scrollController:
                    FixedExtentScrollController(initialItem: idx),
                onSelectedItemChanged: (i) => idx = i,
                children:
                    items.map((e) => Center(child: Text(e))).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _guardar() {
    if (_nombreCtrl.text.isEmpty ||
        _apellidoCtrl.text.isEmpty ||
        _codigoCtrl.text.isEmpty) {
      showCupertinoDialog(
        context: context,
        builder: (ctx) => CupertinoAlertDialog(
          title: const Text('Campos requeridos'),
          content: const Text('Nombre, apellido y código son obligatorios.'),
          actions: [
            CupertinoDialogAction(
              child: const Text('OK'),
              onPressed: () => Navigator.of(ctx).pop(),
            ),
          ],
        ),
      );
      return;
    }

    alumnosData.add({
      'id': alumnosData.length + 1,
      'nombre': _nombreCtrl.text.trim(),
      'apellido': _apellidoCtrl.text.trim(),
      'codigo': _codigoCtrl.text.trim(),
      'carrera': _carrera,
      'ciclo': _ciclo,
      'email': _emailCtrl.text.trim(),
      'telefono': _telefonoCtrl.text.trim(),
      'promedio': double.tryParse(_promedioCtrl.text) ?? 0.0,
    });

    showCupertinoDialog(
      context: context,
      builder: (ctx) => CupertinoAlertDialog(
        title: const Text('¡Éxito!'),
        content: Text('${_nombreCtrl.text} fue registrado.'),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(ctx).pop();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

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
                      'Registrar Alumno',
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
                  CupertinoListSection.insetGrouped(
                    header: const Text('DATOS PERSONALES'),
                    children: [
                      _campo('Nombre *', _nombreCtrl, 'Ej: María',
                          CupertinoIcons.person),
                      _campo('Apellido *', _apellidoCtrl, 'Ej: García',
                          CupertinoIcons.person_2),
                      _campo('Código *', _codigoCtrl, 'Ej: T20210001',
                          CupertinoIcons.barcode),
                      _campo('Email', _emailCtrl, 'correo@tecsup.edu.pe',
                          CupertinoIcons.mail,
                          tipo: TextInputType.emailAddress),
                      _campo('Teléfono', _telefonoCtrl, '987-654-321',
                          CupertinoIcons.phone,
                          tipo: TextInputType.phone),
                      _campo('Promedio', _promedioCtrl, 'Ej: 15.5',
                          CupertinoIcons.chart_bar,
                          tipo: const TextInputType.numberWithOptions(
                              decimal: true)),
                    ],
                  ),
                  CupertinoListSection.insetGrouped(
                    header: const Text('DATOS ACADÉMICOS'),
                    children: [
                      CupertinoListTile(
                        leading: const Icon(CupertinoIcons.book,
                            color: AppTheme.primary),
                        title: const Text('Carrera'),
                        subtitle: Text(_carrera,
                            style: const TextStyle(
                                color: AppTheme.textSecondary)),
                        trailing: const CupertinoListTileChevron(),
                        onTap: () => _showPicker(_carreras, _carrera,
                            (v) => setState(() => _carrera = v)),
                      ),
                      CupertinoListTile(
                        leading: const Icon(CupertinoIcons.calendar,
                            color: AppTheme.primary),
                        title: const Text('Ciclo'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(_ciclo,
                                style: const TextStyle(
                                    color: AppTheme.textSecondary)),
                            const SizedBox(width: 4),
                            const CupertinoListTileChevron(),
                          ],
                        ),
                        onTap: () => _showPicker(_ciclos, _ciclo,
                            (v) => setState(() => _ciclo = v)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: CupertinoButton(
                      color: AppTheme.primary,
                      borderRadius: BorderRadius.circular(12),
                      onPressed: _guardar,
                      child: const Text(
                        'Guardar Alumno',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: CupertinoColors.white,
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

  Widget _campo(String label, TextEditingController ctrl, String hint,
      IconData icon,
      {TextInputType tipo = TextInputType.text}) {
    return CupertinoListTile(
      leading: Icon(icon, color: AppTheme.primary, size: 20),
      title: Text(label),
      subtitle: CupertinoTextField(
        controller: ctrl,
        placeholder: hint,
        keyboardType: tipo,
        decoration: const BoxDecoration(),
        padding: const EdgeInsets.symmetric(vertical: 4),
        style: const TextStyle(fontSize: 14),
      ),
    );
  }

  @override
  void dispose() {
    _nombreCtrl.dispose();
    _apellidoCtrl.dispose();
    _codigoCtrl.dispose();
    _emailCtrl.dispose();
    _telefonoCtrl.dispose();
    _promedioCtrl.dispose();
    super.dispose();
  }
}