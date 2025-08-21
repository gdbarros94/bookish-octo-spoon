import 'package:flutter/material.dart';
import 'interactive_widgets_demo.dart';

void main() {
  runApp(const FlutterDemoApp());
}

class FlutterDemoApp extends StatelessWidget {
  const FlutterDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Didático',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Didático'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Menu de Demonstrações', style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            _DemoTile(title: 'Textos', page: TextDemoPage()),
            _DemoTile(title: 'Botões', page: ButtonDemoPage()),
            _DemoTile(title: 'Imagens', page: ImageDemoPage()),
            _DemoTile(title: 'Formulários', page: FormDemoPage()),
            _DemoTile(title: 'Listas', page: ListDemoPage()),
            _DemoTile(title: 'Layouts', page: LayoutDemoPage()),
            _DemoTile(title: 'Navegação', page: NavigationDemoPage()),
            _DemoTile(title: 'Outros Widgets', page: OtherWidgetsDemoPage()),
            _DemoTile(title: 'Widgets Interativos', page: InteractiveWidgetsDemoPage()),
          ],
        ),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Bem-vindo ao App de Demonstração Flutter!\n\nUse o menu lateral para explorar exemplos de widgets e elementos. Cada página traz explicações e exemplos práticos para facilitar o ensino.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}

class _DemoTile extends StatelessWidget {
  final String title;
  final Widget page;
  const _DemoTile({required this.title, required this.page});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context).pop();
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => page),
        );
      },
    );
  }
}

// Páginas de demonstração (só estrutura, conteúdo virá nas próximas iterações)
class TextDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demonstração: Textos')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'O widget Text é usado para exibir texto na tela. Você pode customizar cor, tamanho, alinhamento, peso, etc.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          const Text('Texto simples'),
          const Divider(),
          const Text(
            'Texto grande e negrito',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          const Text(
            'Texto colorido e itálico',
            style: TextStyle(fontSize: 18, color: Colors.blue, fontStyle: FontStyle.italic),
          ),
          const Divider(),
          const Text(
            'Texto centralizado',
            textAlign: TextAlign.center,
          ),
          const Divider(),
          const SelectableText('Texto selecionável (pode copiar)'),
        ],
      ),
    );
  }
}

class ButtonDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demonstração: Botões')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Flutter possui vários tipos de botões:'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text('ElevatedButton'),
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text('OutlinedButton'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('TextButton'),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.thumb_up),
              tooltip: 'Curtir',
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(Icons.add),
                  tooltip: 'FloatingActionButton',
                ),
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.send),
                  label: const Text('Com ícone'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ImageDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demonstração: Imagens')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Imagens podem ser locais (assets) ou da internet.'),
          const SizedBox(height: 16),
          const Text('Imagem da internet:'),
          Image.network(
            'https://gru.ifsp.edu.br/images/phocagallery/galeria2/thumbs/phoca_thumb_l_image03_grd.png',
            height: 100,
          ),
          const Divider(),
          const Text('Imagem circular:'),
          CircleAvatar(
            backgroundImage: NetworkImage('https://gru.ifsp.edu.br/images/phocagallery/galeria2/thumbs/phoca_thumb_l_image03_grd.png'),
            radius: 150,
          ),
          const Divider(),
          const Text('Imagem com borda arredondada:'),
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              'https://gru.ifsp.edu.br/images/phocagallery/galeria2/thumbs/phoca_thumb_l_image03_grd.png',
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

class FormDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demonstração: Formulários')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: FormDemoWidget(),
      ),
    );
  }
}

class FormDemoWidget extends StatefulWidget {
  @override
  State<FormDemoWidget> createState() => _FormDemoWidgetState();
}

class _FormDemoWidgetState extends State<FormDemoWidget> {
  final _formKey = GlobalKey<FormState>();
  String _nome = '';
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Exemplo de formulário com validação:'),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Nome'),
            validator: (value) => value == null || value.isEmpty ? 'Digite seu nome' : null,
            onSaved: (value) => _nome = value ?? '',
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Email'),
            validator: (value) => value != null && value.contains('@') ? null : 'Digite um email válido',
            onSaved: (value) => _email = value ?? '',
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Nome: $_nome, Email: $_email')),
                );
              }
            },
            child: const Text('Enviar'),
          ),
        ],
      ),
    );
  }
}

class ListDemoPage extends StatelessWidget {
  const ListDemoPage({super.key});
  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(10, (i) => 'Item ${i + 1}');
    return Scaffold(
      appBar: AppBar(title: const Text('Demonstração: Listas')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: items.length + 1,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          if (index == 0) {
            return const Text('ListView é usado para listas roláveis.');
          }
          return ListTile(
            leading: CircleAvatar(child: Text('${index}')),
            title: Text(items[index - 1]),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          );
        },
      ),
    );
  }
}

class LayoutDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demonstração: Layouts')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Row (linha):'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Icon(Icons.star, color: Colors.amber),
              Icon(Icons.star, color: Colors.amber),
              Icon(Icons.star, color: Colors.amber),
            ],
          ),
          const Divider(),
          const Text('Column (coluna):'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Linha 1'),
              Text('Linha 2'),
              Text('Linha 3'),
            ],
          ),
          const Divider(),
          const Text('Stack (sobreposição):'),
          SizedBox(
            height: 80,
            child: Stack(
              children: [
                Container(width: 80, height: 80, color: Colors.red),
                Positioned(left: 20, top: 20, child: Container(width: 40, height: 40, color: Colors.green)),
                Positioned(left: 40, top: 40, child: Container(width: 20, height: 20, color: Colors.blue)),
              ],
            ),
          ),
          const Divider(),
          const Text('GridView:'),
          SizedBox(
            height: 100,
            child: GridView.count(
              crossAxisCount: 4,
              children: List.generate(8, (i) => Container(
                margin: const EdgeInsets.all(4),
                color: Colors.blue[(i + 1) * 100],
              )),
            ),
          ),
        ],
      ),
    );
  }
}

class NavigationDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demonstração: Navegação')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Navegação entre páginas usando Navigator:'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const PaginaExemplo()),
                );
              },
              child: const Text('Ir para outra página'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const ListDemoPage()),
                );
              },
              child: const Text('Ir para mais uma página'),
            ),
            const SizedBox(height: 16),
            const Text('BottomNavigationBar (barra inferior):'),
            SizedBox(
              height: 200,
              child: NavigationBarDemo(),
            ),
          ],
        ),
      ),
    );
  }
}

class PaginaExemplo extends StatelessWidget {
  const PaginaExemplo({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nova Página')),
      body: const Center(child: Text('Você navegou para uma nova página!')),
    );
  }
}

class NavigationBarDemo extends StatefulWidget {
  @override
  State<NavigationBarDemo> createState() => _NavigationBarDemoState();
}

class _NavigationBarDemoState extends State<NavigationBarDemo> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    Center(child: Text('Página 1')),
    Center(child: Text('Página 2')),
    Center(child: Text('Página 3')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favoritos'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Config'),
        ],
      ),
    );
  }
}

class OtherWidgetsDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demonstração: Outros Widgets')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Switch:'),
          SwitchListTile(
            value: true,
            onChanged: (v) {},
            title: const Text('Exemplo de Switch'),
          ),
          const Divider(),
          const Text('Slider:'),
          Slider(
            value: 0.5,
            onChanged: (v) {},
          ),
          const Divider(),
          const Text('Checkbox:'),
          CheckboxListTile(
            value: true,
            onChanged: (v) {},
            title: const Text('Exemplo de Checkbox'),
          ),
          const Divider(),
          const Text('ProgressIndicator:'),
          const LinearProgressIndicator(value: 0.7),
          const SizedBox(height: 16),
          const CircularProgressIndicator(),
          const Divider(),
          const Text('AlertDialog:'),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Exemplo de AlertDialog'),
                  content: const Text('Este é um diálogo de alerta.'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Fechar'),
                    ),
                  ],
                ),
              );
            },
            child: const Text('Mostrar AlertDialog'),
          ),
        ],
      ),
    );
  }
}