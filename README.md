# Minha Saúde Feminina

> App mobile de saúde feminina desenvolvido em Flutter, com foco em bem-estar, informação e autocuidado.

---

## Sobre o Projeto

O **Minha Saúde Feminina** é um aplicativo mobile criado para centralizar informações de saúde feminina de forma acessível, organizada e acolhedora. O app oferece conteúdos por categoria, sistema de favoritos, lembretes de consultas e muito mais.

---

## Funcionalidades

- **Login** — autenticação por e-mail/senha e Google
- **Home** — categorias de saúde e artigos em destaque
- **Favoritos** — salve e acesse seus artigos preferidos
- **Lembretes** — crie lembretes de consultas e medicamentos com data e hora
- **Perfil** — edite seus dados pessoais
- **Dicas Úteis** — dicas de saúde e bem-estar
- **Suporte** — canal de atendimento ao usuário

---

## Categorias disponíveis

- Adolescência e Puberdade
- Saúde Mental
- Saúde Sexual e Reprodutiva
- Gestação e Pós-Parto
- Menopausa
- Prevenção de Doenças

---

## Tecnologias utilizadas

| Tecnologia | Versão |
|---|---|
| Flutter | 3.41.9 |
| Dart | SDK ≥ 3.0.0 |
| Google Fonts | 6.x |
| Material Design 3 | — |

---

## Design System

| Token | Valor |
|---|---|
| Rosa Principal | `#D4537E` |
| Rosa Claro | `#FBEAF0` |
| Rosa Escuro | `#993556` |
| Fundo | `#FFFFFF` |
| Texto Principal | `#333333` |
| Texto Secundário | `#888888` |
| Fonte | Poppins (Google Fonts) |

---

## Estrutura do projeto

```
minha_saude/
├── lib/
│   ├── main.dart
│   ├── theme/
│   │   └── app_theme.dart
│   └── screens/
│       ├── splash_screen.dart
│       ├── login_screen.dart
│       ├── main_nav.dart
│       ├── home_screen.dart
│       ├── favoritos_screen.dart
│       ├── detalhe_artigo_screen.dart
│       ├── lembretes_screen.dart
│       ├── perfil_screen.dart
│       ├── editar_perfil_screen.dart
│       ├── categorias_screen.dart
│       ├── criar_categoria_screen.dart
│       ├── dicas_uteis_screen.dart
│       └── suporte_screen.dart
├── assets/
│   └── images/
└── pubspec.yaml
```

---

## Como rodar o projeto

### Pré-requisitos

- [Flutter](https://flutter.dev/docs/get-started/install) 3.0+
- [Android Studio](https://developer.android.com/studio) com emulador configurado
- [VS Code](https://code.visualstudio.com/) com extensões Flutter e Dart

### Instalação

```bash
# Clone o repositório
git clone https://github.com/SEU_USUARIO/minha-saude-app.git

# Entre na pasta
cd minha-saude-app

# Instale as dependências
flutter pub get

# Rode o app
flutter run
```

---

## Telas

| Splash | Login | Home |
|---|---|---|
| Tela de entrada com logo animado | Autenticação e-mail/Google | Categorias e favoritos em destaque |

| Favoritos | Lembretes | Perfil |
|---|---|---|
| Lista de artigos salvos | Criação com DatePicker/TimePicker | Dados do usuário e menu de opções |

---

## Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

---

<p align="center">Feito com e Flutter</p>
