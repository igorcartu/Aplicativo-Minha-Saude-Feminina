import 'package:firebase_auth/firebase_auth.dart';

/// Traduz os códigos de erro do Firebase Auth para mensagens em português.
String mensagemErroAuth(Object erro) {
  if (erro is FirebaseAuthException) {
    switch (erro.code) {
      case 'invalid-email':
        return 'E-mail inválido.';
      case 'user-disabled':
        return 'Esta conta foi desativada.';
      case 'user-not-found':
      case 'wrong-password':
      case 'invalid-credential':
        return 'E-mail ou senha incorretos.';
      case 'email-already-in-use':
        return 'Já existe uma conta com este e-mail.';
      case 'weak-password':
        return 'A senha precisa ter pelo menos 6 caracteres.';
      case 'too-many-requests':
        return 'Muitas tentativas. Aguarde um pouco e tente de novo.';
      case 'network-request-failed':
        return 'Sem conexão com a internet.';
      case 'operation-not-allowed':
        return 'Login por e-mail não está ativado no Firebase.';
      default:
        return 'Erro: ${erro.message ?? erro.code}';
    }
  }
  return 'Erro inesperado. Tente novamente.';
}
