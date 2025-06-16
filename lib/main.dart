import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Image.network(
                'https://i.imgur.com/d5eZMNU.png',
                height: 220,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Bem-vindo ao LearnHero',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Embarque em uma jornada de conhecimento e diversão. Complete desafios, ganhe recompensas e torne-se um campeão do aprendizado.',
                style: TextStyle(color: Colors.white70, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const MainNavigation()),
                );
              },
              child: const Text(
                'Começar',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    ProgressScreen(),
    ChallengesScreen(),
    RankingScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.white70,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Aprender',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: 'Recompensas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}

class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 28),
      ),
    );
  }
}

class RankingScreen extends StatelessWidget {
  final List<Map<String, dynamic>> players = [
    {
      'name': 'Lucas Oliveira',
      'xp': 1200,
      'avatar': 'https://ui-avatars.com/api/?name=Lucas+Oliveira&background=4caf50&color=fff',
    },
    {
      'name': 'Isabela Santos',
      'xp': 1150,
      'avatar': 'https://ui-avatars.com/api/?name=Isabela+Santos&background=4caf50&color=fff',
    },
    {
      'name': 'Gabriel Almeida',
      'xp': 1100,
      'avatar': 'https://ui-avatars.com/api/?name=Gabriel+Almeida&background=4caf50&color=fff',
    },
    {
      'name': 'Manuela Costa',
      'xp': 1050,
      'avatar': 'https://ui-avatars.com/api/?name=Manuela+Costa&background=4caf50&color=fff',
    },
    {
      'name': 'Mateus Pereira',
      'xp': 1000,
      'avatar': 'https://ui-avatars.com/api/?name=Mateus+Pereira&background=4caf50&color=fff',
    },
    {
      'name': 'Sofia Ribeiro',
      'xp': 960,
      'avatar': 'https://ui-avatars.com/api/?name=Sofia+Ribeiro&background=4caf50&color=fff',
    },
    {
      'name': 'Rafael Martins',
      'xp': 900,
      'avatar': 'https://ui-avatars.com/api/?name=Rafael+Martins&background=4caf50&color=fff',
    },
    {
      'name': 'Beatriz Lima',
      'xp': 850,
      'avatar': 'https://ui-avatars.com/api/?name=Beatriz+Lima&background=4caf50&color=fff',
    },
    {
      'name': 'Enzo Carvalho',
      'xp': 800,
      'avatar': 'https://ui-avatars.com/api/?name=Enzo+Carvalho&background=4caf50&color=fff',
    },
    {
      'name': 'Laura Fernandes',
      'xp': 750,
      'avatar': 'https://ui-avatars.com/api/?name=Laura+Fernandes&background=4caf50&color=fff',
    },
  ];

  RankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
        title: const Text(
          'Recompensas e Ranking',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemCount: players.length,
        separatorBuilder: (context, index) => const Divider(color: Colors.white12, indent: 24, endIndent: 24),
        itemBuilder: (context, index) {
          final player = players[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(player['avatar']),
              radius: 26,
            ),
            title: Text(
              player['name'],
              style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
            ),
            trailing: Text(
              '${player['xp']} XP',
              style: const TextStyle(color: Colors.green, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          );
        },
      ),
      bottomNavigationBar: null,
    );
  }
}

class ProgressScreen extends StatelessWidget {
  ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Recompensas e Ranking',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Image.network(
            'https://i.imgur.com/KNqpfjE.png',
            height: 120,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 24),
          const Text(
            'Você está indo muito bem!',
            style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          const Text(
            'Continue com o ótimo trabalho! Sua dedicação é realmente inspiradora. Cada passo que você dá te aproxima mais dos seus objetivos.',
            style: TextStyle(color: Colors.white70, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _StatCard(title: 'Pontos Totais', value: '1.250'),
              _StatCard(title: 'Conquistas', value: '12'),
            ],
          ),
          const SizedBox(height: 32),
          const Text(
            'Ranking de Jogadores',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _MiniRanking(),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  const _StatCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(color: Colors.green, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class _MiniRanking extends StatelessWidget {
  final List<Map<String, dynamic>> miniPlayers = [
    {
      'name': 'Você',
      'points': 1250,
      'avatar': 'https://ui-avatars.com/api/?name=Voce&background=4caf50&color=fff',
    },
    {
      'name': 'Lucas',
      'points': 1100,
      'avatar': 'https://ui-avatars.com/api/?name=Lucas&background=4caf50&color=fff',
    },
    {
      'name': 'Sofia',
      'points': 1050,
      'avatar': 'https://ui-avatars.com/api/?name=Sofia&background=4caf50&color=fff',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: miniPlayers.map((player) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(player['avatar']),
            radius: 20,
          ),
          title: Text(
            player['name'],
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          trailing: Text(
            '${player['points']} pontos',
            style: const TextStyle(color: Colors.green, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        );
      }).toList(),
    );
  }
}

class ChallengesScreen extends StatelessWidget {
  ChallengesScreen({super.key});

  final List<Map<String, dynamic>> daily = [
    {
      'icon': Icons.menu_book,
      'title': 'Sequência de Lições',
      'desc': 'Complete 3 lições',
      'xp': 30,
    },
    {
      'icon': Icons.quiz,
      'title': 'Mestre dos',
      'desc': 'Complete 5 questionários',
      'xp': 50,
    },
    {
      'icon': Icons.access_time,
      'title': 'Viajante do Tempo',
      'desc': 'Passe 15 minutos aprendendo',
      'xp': 75,
    },
  ];
  final List<Map<String, dynamic>> weekly = [
    {
      'icon': Icons.emoji_events,
      'title': 'Caçador de XP',
      'desc': 'Ganhe 1000 XP',
      'xp': 20,
    },
    {
      'icon': Icons.group,
      'title': 'Borboleta Social',
      'desc': 'Junte-se a um grupo de estudo',
      'xp': 100,
    },
    {
      'icon': Icons.school,
      'title': 'Conquistador de Cursos',
      'desc': 'Complete um curso',
      'xp': 50,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Desafios e Missões',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Text(
            'Desafios Diários',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ...daily.map((item) => _ChallengeTile(item: item)),
          const SizedBox(height: 24),
          const Text(
            'Missões Semanais',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ...weekly.map((item) => _ChallengeTile(item: item)),
        ],
      ),
    );
  }
}

class _ChallengeTile extends StatelessWidget {
  final Map<String, dynamic> item;
  const _ChallengeTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white10,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.green,
          child: Icon(item['icon'], color: Colors.white),
        ),
        title: Text(
          item['title'],
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          item['desc'],
          style: const TextStyle(color: Colors.white70),
        ),
        trailing: Text(
          '+${item['xp']} XP',
          style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int selected = -1;
  final List<String> options = ['Londres', 'Paris', 'Berlin', 'Roma'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Questão 1 de 5',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(
              value: 0.2,
              color: Colors.green,
              backgroundColor: Colors.white12,
            ),
            const SizedBox(height: 32),
            const Text(
              'Qual é a capital da França?',
              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            ...List.generate(options.length, (i) {
              return RadioListTile<int>(
                value: i,
                groupValue: selected,
                onChanged: (val) {
                  setState(() {
                    selected = val!;
                  });
                },
                title: Text(
                  options[i],
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                activeColor: Colors.green,
                selected: selected == i,
                tileColor: Colors.white10,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              );
            }),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: selected != -1 ? () {} : null,
                child: const Text('Enviar', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final List<Map<String, String>> conquistas = [
    {'img': 'https://img.icons8.com/ios-filled/100/4caf50/medal2.png'},
    {'img': 'https://img.icons8.com/ios-filled/100/4caf50/medal-first-place.png'},
    {'img': 'https://img.icons8.com/ios-filled/100/4caf50/medal-second-place.png'},
    {'img': 'https://img.icons8.com/ios-filled/100/4caf50/medal-third-place.png'},
  ];
  final List<Map<String, String>> recompensas = [
    {'img': 'https://img.icons8.com/ios-filled/100/4caf50/plant-under-sun.png'},
    {'img': 'https://img.icons8.com/ios-filled/100/4caf50/plant-under-sun.png'},
    {'img': 'https://img.icons8.com/ios-filled/100/4caf50/plant-under-sun.png'},
  ];
  final List<String> atividades = [
    'Completou o curso de Matemática',
    'Participou do desafio de programação',
    'Recebeu 500 pontos de experiência',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text('Perfil', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Center(
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://ui-avatars.com/api/?name=Ricardo+Almeida&background=4caf50&color=fff'),
              radius: 48,
            ),
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text(
              'Ricardo Almeida',
              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          const Center(
            child: Text(
              '@ricardo_almeida',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
          ),
          const SizedBox(height: 8),
          const Center(
            child: Text(
              'Nível 12',
              style: TextStyle(color: Colors.green, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Progresso para o próximo nível', style: TextStyle(color: Colors.white70)),
          const SizedBox(height: 4),
          LinearProgressIndicator(
            value: 0.7,
            color: Colors.green,
            backgroundColor: Colors.white12,
          ),
          const SizedBox(height: 24),
          const Text('Conquistas', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: conquistas.map((c) => CircleAvatar(backgroundImage: NetworkImage(c['img']!), radius: 28)).toList(),
          ),
          const SizedBox(height: 24),
          const Text('Recompensas', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: recompensas.map((r) => CircleAvatar(backgroundImage: NetworkImage(r['img']!), radius: 28)).toList(),
          ),
          const SizedBox(height: 24),
          const Text('Atividades Recentes', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          ...atividades.map((a) => Row(
            children: [
              const Icon(Icons.check, color: Colors.green, size: 20),
              const SizedBox(width: 8),
              Expanded(child: Text(a, style: const TextStyle(color: Colors.white70))),
            ],
          )),
        ],
      ),
    );
  }
}
