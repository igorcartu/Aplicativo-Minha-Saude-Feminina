import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../theme/app_theme.dart';
import '../auth_erros.dart';
import 'main_nav.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmarController = TextEditingController();
  bool _obscure = true;
  bool _carregando = false;

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    _confirmarController.dispose();
    super.dispose();
  }

  void _erro(String texto) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(texto, style: GoogleFonts.poppins()),
      backgroundColor: Colors.red.shade400,
      behavior: SnackBarBehavior.floating,
    ));
  }

  Future<void> _cadastrar() async {
    final nome = _nomeController.text.trim();
    final email = _emailController.text.trim();
    final senha = _senhaController.text;

    if (nome.isEmpty || email.isEmpty || senha.isEmpty) {
      _erro('Preencha todos os campos.');
      return;
    }
    if (senha != _confirmarController.text) {
      _erro('As senhas não são iguais.');
      return;
    }

    setState(() => _carregando = true);
    try {
      final cred = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: senha);
      await cred.user?.updateDisplayName(nome);
      await cred.user?.reload();
      if (!mounted) return;
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const MainNav()), (_) => false);
    } catch (e) {
      _erro(mensagemErroAuth(e));
    } finally {
      if (mounted) setState(() => _carregando = false);
    }
  }

  Widget _campo(String label, TextEditingController c, IconData icone, {bool senha = false, TextInputType? tipo}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w500, color: AppColors.textDark)),
        const SizedBox(height: 6),
        TextField(
          controller: c,
          obscureText: senha && _obscure,
          keyboardType: tipo,
          decoration: InputDecoration(
            hintText: label,
            prefixIcon: Icon(icone, color: AppColors.primary),
            suffixIcon: senha
                ? IconButton(
                    icon: Icon(_obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined, color: AppColors.textGrey),
                    onPressed: () => setState(() => _obscure = !_obscure),
                  )
                : null,
          ),
        ),
        const SizedBox(height: 14),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('Criar conta'),
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _campo('Nome', _nomeController, Icons.person_outline),
              _campo('E-mail', _emailController, Icons.email_outlined, tipo: TextInputType.emailAddress),
              _campo('Senha', _senhaController, Icons.lock_outline, senha: true),
              _campo('Confirmar senha', _confirmarController, Icons.lock_outline, senha: true),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: _carregando ? null : _cadastrar,
                child: _carregando
                    ? const SizedBox(width: 22, height: 22, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                    : const Text('Criar conta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
