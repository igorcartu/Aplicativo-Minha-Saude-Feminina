import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class DetalheArtigoScreen extends StatefulWidget {
  final String titulo;
  const DetalheArtigoScreen({super.key, required this.titulo});

  @override
  State<DetalheArtigoScreen> createState() => _DetalheArtigoScreenState();
}

class _DetalheArtigoScreenState extends State<DetalheArtigoScreen> {
  bool _favoritado = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220,
            pinned: true,
            backgroundColor: AppColors.white,
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: const BoxDecoration(color: AppColors.white, shape: BoxShape.circle),
                child: const Icon(Icons.arrow_back, color: AppColors.textDark),
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () => setState(() => _favoritado = !_favoritado),
                child: Container(
                  margin: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(color: AppColors.white, shape: BoxShape.circle),
                  child: Icon(_favoritado ? Icons.favorite : Icons.favorite_outline, color: AppColors.primary),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.primary, AppColors.primaryDark],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Center(child: Icon(Icons.health_and_safety, size: 80, color: Colors.white54)),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(color: AppColors.primaryLight, borderRadius: BorderRadius.circular(8)),
                    child: Text('Gestação', style: GoogleFonts.poppins(fontSize: 12, color: AppColors.primary, fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(height: 12),
                  Text(widget.titulo,
                      style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w700, color: AppColors.textDark)),
                  const SizedBox(height: 8),
                  Text('Atualizado em 18/03/2026',
                      style: GoogleFonts.poppins(fontSize: 12, color: AppColors.textGrey)),
                  const SizedBox(height: 20),
                  Text(
                    'O pré-natal é um conjunto de cuidados médicos, nutricionais e emocionais fundamentais para garantir a saúde da mãe e do bebê durante a gravidez.\n\n'
                    'Durante as consultas, o médico ou obstetra acompanha o desenvolvimento do bebê, monitora a saúde da gestante e oferece orientações sobre alimentação, atividade física, vacinação e preparação para o parto.\n\n'
                    'Sinais de alerta:\n'
                    '• Sangramento vaginal\n'
                    '• Dores abdominais intensas\n'
                    '• Inchaço repentino nas mãos e rosto\n'
                    '• Diminuição dos movimentos do bebê\n'
                    '• Febre acima de 38°C\n\n'
                    'Lembre-se: o acompanhamento pré-natal regular é essencial para uma gravidez saudável e um parto seguro. Não falte às consultas agendadas!',
                    style: GoogleFonts.poppins(fontSize: 14, color: AppColors.textDark, height: 1.7),
                  ),
                  const SizedBox(height: 28),
                  ElevatedButton.icon(
                    onPressed: () => setState(() => _favoritado = !_favoritado),
                    icon: Icon(_favoritado ? Icons.favorite : Icons.favorite_outline),
                    label: Text(_favoritado ? 'Salvo nos favoritos' : 'Adicionar aos favoritos'),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
