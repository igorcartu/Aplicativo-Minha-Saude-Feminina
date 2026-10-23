import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../theme/app_theme.dart';
import '../auth_erros.dart';
import 'main_nav.dart';
import 'cadastro_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  bool _obscure = true;
  bool _carregando = false;

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  void _mostrarMensagem(String texto, {bool erro = true}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(texto, style: GoogleFonts.poppins()),
      backgroundColor: erro ? Colors.red.shade400 : AppColors.primary,
      behavior: SnackBarBehavior.floating,
    ));
  }

  Future<void> _login() async {
    final email = _emailController.text.trim();
    final senha = _senhaController.text;
    if (email.isEmpty || senha.isEmpty) {
      _mostrarMensagem('Preencha o e-mail e a senha.');
      return;
    }
    setState(() => _carregando = true);
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: senha);
      if (!mounted) return;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const MainNav()));
    } catch (e) {
      _mostrarMensagem(mensagemErroAuth(e));
    } finally {
      if (mounted) setState(() => _carregando = false);
    }
  }

  Future<void> _esqueciSenha() async {
    final email = _emailController.text.trim();
    if (email.isEmpty) {
      _mostrarMensagem('Digite seu e-mail no campo acima primeiro.');
      return;
    }
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      _mostrarMensagem('Enviamos um link de redefinição para $email.', erro: false);
    } catch (e) {
      _mostrarMensagem(mensagemErroAuth(e));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 48),
              Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(color: AppColors.primaryLight, shape: BoxShape.circle),
                child: const Icon(Icons.favorite, color: AppColors.primary, size: 44),
              ),
              const SizedBox(height: 16),
              Text('Minha Saúde Feminina',
                  style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.primary)),
              const SizedBox(height: 6),
              Text('Acesse informações sobre sua saúde e bem-estar',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(fontSize: 13, color: AppColors.textGrey)),
              const SizedBox(height: 40),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Faça login com sua conta',
                    style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textDark)),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(hintText: 'E-mail', prefixIcon: Icon(Icons.email_outlined, color: AppColors.primary)),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _senhaController,
                obscureText: _obscure,
                onSubmitted: (_) => _login(),
                decoration: InputDecoration(
                  hintText: 'Senha',
                  prefixIcon: const Icon(Icons.lock_outline, color: AppColors.primary),
                  suffixIcon: IconButton(
                    icon: Icon(_obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined, color: AppColors.textGrey),
                    onPressed: () => setState(() => _obscure = !_obscure),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: _esqueciSenha,
                  child: Text('Esqueci a senha', style: GoogleFonts.poppins(fontSize: 13, color: AppColors.primary)),
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: _carregando ? null : _login,
                child: _carregando
                    ? const SizedBox(width: 22, height: 22, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                    : const Text('Faça login'),
              ),
              const SizedBox(height: 16),
              Row(children: [
                const Expanded(child: Divider(color: AppColors.border)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text('ou', style: GoogleFonts.poppins(fontSize: 13, color: AppColors.textGrey)),
                ),
                const Expanded(child: Divider(color: AppColors.border)),
              ]),
              const SizedBox(height: 16),
              OutlinedButton.icon(
                onPressed: () => _mostrarMensagem('Login com Google ainda não está disponível nesta versão.', erro: false),
                icon: const Icon(Icons.g_mobiledata, size: 24, color: AppColors.primary),
                label: Text('Login com Google', style: GoogleFonts.poppins(color: AppColors.textDark, fontWeight: FontWeight.w500)),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 52),
                  side: const BorderSide(color: AppColors.border),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('Não tem conta? ', style: GoogleFonts.poppins(fontSize: 13, color: AppColors.textGrey)),
                GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CadastroScreen())),
                  child: Text('Criar conta', style: GoogleFonts.poppins(fontSize: 13, color: AppColors.primary, fontWeight: FontWeight.w600)),
                ),
              ]),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
