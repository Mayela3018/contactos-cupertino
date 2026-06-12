import 'package:flutter/cupertino.dart';
import '../theme/app_theme.dart';
import 'menu_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usuarioCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  bool _isLoading = false;
  bool _obscure = true;

  void _login() async {
    if (_usuarioCtrl.text.isEmpty || _passwordCtrl.text.isEmpty) {
      _showError('Completa todos los campos');
      return;
    }
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(milliseconds: 800));
    setState(() => _isLoading = false);

    if (_usuarioCtrl.text == 'admin' && _passwordCtrl.text == '1234') {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (_) => const MenuScreen()),
        );
      }
    } else {
      _showError('Usuario o contraseña incorrectos\nUsa: admin / 1234');
    }
  }

  void _showError(String msg) {
    showCupertinoDialog(
      context: context,
      builder: (ctx) => CupertinoAlertDialog(
        title: const Text('Aviso'),
        content: Text(msg),
        actions: [
          CupertinoDialogAction(
            child: const Text('OK'),
            onPressed: () => Navigator.of(ctx).pop(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF5B21B6),
              Color(0xFF7C3AED),
              Color(0xFFEC4899),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              children: [
                const SizedBox(height: 50),
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0x66FFFFFF), width: 2),
                    color: const Color(0x26FFFFFF),
                  ),
                  child: const Icon(
                    CupertinoIcons.book_fill,
                    size: 46,
                    color: CupertinoColors.white,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Sistema de Alumnos',
                  style: TextStyle(
                    color: CupertinoColors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Ingresa tus credenciales para continuar',
                  style: TextStyle(color: Color(0xCCFFFFFF), fontSize: 14),
                ),
                const SizedBox(height: 40),

                Container(
                  decoration: BoxDecoration(
                    color: CupertinoColors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x337C3AED),
                        blurRadius: 24,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(28),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(width: 30, height: 2, color: AppTheme.pink),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'Iniciar Sesión',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: AppTheme.textPrimary,
                              ),
                            ),
                          ),
                          Container(width: 30, height: 2, color: AppTheme.cyan),
                        ],
                      ),
                      const SizedBox(height: 24),

                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Usuario',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: AppTheme.textSecondary)),
                      ),
                      const SizedBox(height: 6),
                      CupertinoTextField(
                        controller: _usuarioCtrl,
                        placeholder: 'admin',
                        prefix: const Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Icon(CupertinoIcons.person,
                              size: 20, color: AppTheme.primary),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 14),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppTheme.accent),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      const SizedBox(height: 16),

                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Contraseña',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: AppTheme.textSecondary)),
                      ),
                      const SizedBox(height: 6),
                      CupertinoTextField(
                        controller: _passwordCtrl,
                        placeholder: '••••••••',
                        obscureText: _obscure,
                        prefix: const Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Icon(CupertinoIcons.lock,
                              size: 20, color: AppTheme.primary),
                        ),
                        suffix: GestureDetector(
                          onTap: () => setState(() => _obscure = !_obscure),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Icon(
                              _obscure
                                  ? CupertinoIcons.eye_slash
                                  : CupertinoIcons.eye,
                              size: 20,
                              color: AppTheme.primary,
                            ),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 14),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppTheme.primary),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      const SizedBox(height: 24),

                      SizedBox(
                        width: double.infinity,
                        child: CupertinoButton(
                          color: AppTheme.primary,
                          borderRadius: BorderRadius.circular(14),
                          onPressed: _isLoading ? null : _login,
                          child: _isLoading
                              ? const CupertinoActivityIndicator(
                                  color: CupertinoColors.white)
                              : const Text(
                                  'INGRESAR',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1.5,
                                    color: CupertinoColors.white,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'v1.0.0 — Instituto Educativo',
                  style: TextStyle(color: Color(0x80FFFFFF), fontSize: 12),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usuarioCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }
}