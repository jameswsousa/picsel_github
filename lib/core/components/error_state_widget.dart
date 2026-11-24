import 'package:flutter/material.dart';
import 'package:picsel_github/core/components/default_button.dart';
import 'package:picsel_github/core/errors/failures.dart';
import 'package:picsel_github/core/theme/colors.dart';
import 'package:picsel_github/core/theme/typography.dart';

/// Mostra o erro de uma busca que falhou e um botão para tentar de novo.
class ErrorStateWidget extends StatelessWidget {
  final Failure failure;
  final VoidCallback onRetry;

  const ErrorStateWidget({required this.failure, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              failure.title,
              textAlign: TextAlign.center,
              style: h1.copyWith(color: AppColors.primary),
            ),
            const SizedBox(height: 12),
            Text(
              failure.message,
              textAlign: TextAlign.center,
              style: h2.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryShade2),
            ),
            const SizedBox(height: 32),
            DefaultButton(
              label: 'Tentar novamente',
              invertColors: true,
              onPressed: onRetry,
            ),
          ],
        ),
      ),
    );
  }
}
