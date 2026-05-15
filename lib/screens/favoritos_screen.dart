import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import 'detalhe_artigo_screen.dart';

class FavoritosScreen extends StatelessWidget {
  const FavoritosScreen({super.key});

  static const _artigos = [
    {'titulo': 'Cuidados no Pré-Natal', 'desc': 'Resumo: Guia completo para gestantes que desejam acompanhar e cuidar de sua saúde durante a gravidez.', 'categoria': 'Gestação'},
    {'titulo': 'Métodos Contraceptivos', 'desc': 'Conheça os principais métodos contraceptivos disponíveis e como escolher o mais adequado para você.', 'categoria': 'Saúde Sexual'},
    {'titulo': 'Sintomas da Menopausa', 'desc': 'Entenda os sinais de alerta: Reconheça os principais sintomas e saiba como lidar com essa fase da vida.', 'categoria': 'Bem-estar'},
    {'titulo': 'Câncer de Mama', 'desc': 'Prevenção e diagnóstico precoce: tudo o que você precisa saber sobre o câncer de mama.', 'categoria': 'Prevenção'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('Favoritos'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(color: AppColors.primaryLight, shape: BoxShape.circle),
            child: const Icon(Icons.favorite_outline, color: AppColors.primary, size: 20),
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: _artigos.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, i) {
          final art = _artigos[i];
          return GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(
                builder: (_) => DetalheArtigoScreen(titulo: art['titulo']!))),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.cardBg,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                children: [
                  Container(
                    width: 90,
                    height: 100,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.15),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
                    ),
                    child: const Icon(Icons.health_and_safety_outlined, color: AppColors.primary, size: 36),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(color: AppColors.primaryLight, borderRadius: BorderRadius.circular(6)),
                            child: Text(art['categoria']!, style: GoogleFonts.poppins(fontSize: 10, color: AppColors.primary, fontWeight: FontWeight.w500)),
                          ),
                          const SizedBox(height: 6),
                          Text(art['titulo']!, style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textDark)),
                          const SizedBox(height: 4),
                          Text(art['desc']!, style: GoogleFonts.poppins(fontSize: 11, color: AppColors.textGrey), maxLines: 2, overflow: TextOverflow.ellipsis),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: Icon(Icons.arrow_forward_ios, size: 14, color: AppColors.textGrey),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
