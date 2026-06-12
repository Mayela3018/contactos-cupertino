import 'package:flutter/cupertino.dart';
import '../theme/app_theme.dart';
import '../data/data.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  final Set<int> _expandidos = {};

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
                      'Preguntas Frecuentes',
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

            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppTheme.accent,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Row(
                children: [
                  Icon(CupertinoIcons.lightbulb_fill,
                      color: AppTheme.primary, size: 26),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Toca una pregunta para ver la respuesta',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppTheme.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: faqData.length,
                itemBuilder: (ctx, i) {
                  final faq = faqData[i];
                  final expanded = _expandidos.contains(i);
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: CupertinoColors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: expanded
                            ? AppTheme.primary
                            : const Color(0xFFE8E4FF),
                        width: expanded ? 1.5 : 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () => setState(() => expanded
                              ? _expandidos.remove(i)
                              : _expandidos.add(i)),
                          child: Container(
                            color: CupertinoColors.transparent,
                            padding: const EdgeInsets.all(14),
                            child: Row(
                              children: [
                                Container(
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppTheme.primary.withOpacity(0.1),
                                  ),
                                  child: Center(
                                    child: Text('${i + 1}',
                                        style: const TextStyle(
                                          color: AppTheme.primary,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        )),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(faq['pregunta']!,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppTheme.textPrimary,
                                      )),
                                ),
                                Icon(
                                  expanded
                                      ? CupertinoIcons.chevron_up
                                      : CupertinoIcons.chevron_down,
                                  size: 16,
                                  color: AppTheme.primary,
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (expanded) ...[
                          Container(height: 1, color: AppTheme.accent),
                          Padding(
                            padding: const EdgeInsets.all(14),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                    CupertinoIcons.checkmark_circle_fill,
                                    color: AppTheme.success,
                                    size: 18),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(faq['respuesta']!,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: AppTheme.textSecondary,
                                        height: 1.5,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
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