# GrowTrack - Instruções de Execução

## 🚀 Como executar o projeto

O projeto está estruturado com o main.dart na pasta `lib/Application/` para manter a arquitetura MVVM organizada.

### Opção 1: Executar com comando específico (Recomendado)

```bash
flutter run -t lib/Application/main.dart
```

### Opção 2: Configurar em VS Code

Crie/atualize o arquivo `.vscode/launch.json`:

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "GrowTrack",
      "request": "launch",
      "type": "dart",
      "program": "lib/Application/main.dart",
      "console": "debugConsole",
      "cwd": "${workspaceFolder}"
    }
  ]
}
```

Depois, use `F5` ou `Run > Start Debugging` no VS Code.

### Opção 3: Criar um script de execução

**Windows (run.bat):**
```batch
@echo off
flutter run -t lib/Application/main.dart
```

**Linux/Mac (run.sh):**
```bash
#!/bin/bash
flutter run -t lib/Application/main.dart
```

## 📁 Estrutura do Projeto

```
lib/
├─ Application/
│  └─ main.dart (Entrada principal)
├─ scenes/
│  ├─ Login/
│  ├─ Monitoring/
│  └─ plantRegister/
├─ Designsystem/
├─ resources/
└─ main.dart (export apenas)
```
