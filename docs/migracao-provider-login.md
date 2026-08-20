# Migração do Login para Provider

Passo a passo das mudanças feitas para trocar o gerenciamento de estado do login de `StatefulWidget`/`setState` para `Provider`/`ChangeNotifier`.

## 1. Adicionar o pacote `provider`
`pubspec.yaml` → adicionado `provider: ^6.1.2` nas dependências.
> Motivo: é o pacote que fornece o `ChangeNotifierProvider`/`Consumer` usados no restante da migração.

## 2. `LoginController` passa a ser um `ChangeNotifier`
`LoginController` agora `extends ChangeNotifier`.
> Motivo: permite que o controller notifique a UI quando seu estado interno muda, sem depender do widget guardar esse estado.

## 3. Mover a `GlobalKey<FormState>` para dentro do controller
Adicionado `final GlobalKey<FormState> key = GlobalKey<FormState>();` no `LoginController`.
> Motivo: a chave do formulário é estado ligado à lógica de login, então centralizá-la no controller evita duplicar/repassar essa referência pela página.

## 4. Chamar `notifyListeners()` ao mudar o checkbox
`changeActiveCheckBox()` agora chama `notifyListeners()` após alternar o valor.
> Motivo: sem isso, o `Consumer` na tela não saberia que precisa reconstruir a UI com o novo valor do checkbox.

## 5. Mover `_handleLogin` da página para o controller (`handleLogin`)
A lógica que validava o form, ligava/desligava `isLoading` e chamava `login()` foi movida de `_LoginPageState._handleLogin` para `LoginController.handleLogin()`, usando `notifyListeners()` no lugar de `setState`.
> Motivo: tira regra de negócio/estado da camada de widget e concentra no controller, que é a fonte única de verdade.

## 6. Registrar o `LoginController` no `MultiProvider` (`main.dart`)
`MaterialApp` passou a ser envolvido por `MultiProvider` com um `ChangeNotifierProvider(create: (_) => LoginController())`.
> Motivo: disponibiliza uma instância única do controller para toda a árvore de widgets abaixo do `MaterialApp`.

## 7. Converter `LoginPage` de `StatefulWidget` para `StatelessWidget`
Removidos `_LoginPageState`, o campo `loginController` local e a `GlobalKey` local da página.
> Motivo: a página não guarda mais estado próprio — quem guarda é o `LoginController` via Provider, então não há necessidade de `State`.

## 8. Consumir o controller com `Consumer<LoginController>`
O corpo do `build` foi envolvido em `Consumer<LoginController>(builder: (context, controller, child) {...})`, e todas as referências trocaram de `loginController.x` para `controller.x`.
> Motivo: reconstrói apenas a parte da UI que depende do controller sempre que `notifyListeners()` é chamado, em vez de reconstruir o widget inteiro com `setState`.

## 9. Trocar chamadas diretas por métodos do controller
`onPressed` do botão "Entrar" passou a ser `controller.handleLogin` (em vez de `_handleLogin` local) e o checkbox chama `controller.changeActiveCheckBox()` diretamente, sem `setState`.
> Motivo: com o Provider, a UI só dispara a ação; quem decide reconstruir a tela é o `notifyListeners()` do controller.

