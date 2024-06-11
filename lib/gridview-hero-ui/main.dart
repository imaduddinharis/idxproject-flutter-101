import 'package:flutter/material.dart';

class GHUHome extends StatefulWidget {
  const GHUHome({super.key});

  @override
  State<GHUHome> createState() => _GHUHomeState();
}

class _GHUHomeState extends State<GHUHome> {
  var characters = [
    {
      "name": "Spiderman",
      "image":
          "https://cdn.marvel.com/u/prod/marvel/i/mg/9/30/538cd33e15ab7/standard_xlarge.jpg"
    },
    {
      "name": "Ironman",
      "image":
          "https://cdn.marvel.com/u/prod/marvel/i/mg/3/e0/661e9b6428e34/standard_xlarge.jpg"
    },
    {
      "name": "Captain America",
      "image":
          "https://cdn.marvel.com/u/prod/marvel/i/mg/3/50/537ba56d31087/standard_xlarge.jpg"
    },
    {
      "name": "Deadpool",
      "image":
          "https://cdn.marvel.com/u/prod/marvel/i/mg/5/c0/537ba730e05e0/standard_xlarge.jpg"
    },
    {
      "name": "Black Panther",
      "image":
          "https://cdn.marvel.com/u/prod/marvel/i/mg/1/c0/537ba2bfd6bab/standard_xlarge.jpg"
    },
    {
      "name": "Captain Marvel",
      "image":
          "https://cdn.marvel.com/u/prod/marvel/i/mg/c/10/537ba5ff07aa4/standard_xlarge.jpg"
    },
  ];

  List<Container> heroes = List<Container>.empty(growable: true);
  _createList() async {
    for (var i = 0; i < characters.length; i++) {
      final character = characters[i];
      heroes.add(Container(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(children: [
            Hero(
                tag: character["name"]!,
                child: Material(
                  child: InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => DetailHero(
                            name: character["name"]!,
                            image: character["image"]!))),
                    child: SizedBox(
                      width: 335,
                      height: 110,
                      child: Image.network(
                        character["image"]!,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                )),
            const SizedBox(
              height: 16,
            ),
            Text(character["name"]!),
          ]),
        ),
      ));
    }
  }

  @override
  void initState() {
    _createList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Marvel Heroes",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: heroes,
        ));
  }
}

class DetailHero extends StatelessWidget {
  const DetailHero({super.key, required this.name, required this.image});

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 240.0,
            child: Hero(
                tag: name,
                child: Material(
                  child: InkWell(
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
          ),
          SectionName(
            name: name,
          ),
          SectionAction(),
          SectionDescription(),
        ],
      ),
    );
  }
}

class SectionName extends StatelessWidget {
  const SectionName({super.key, required this.name});

  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 20.0, color: Colors.blue),
                ),
                Text(
                  name,
                  style: const TextStyle(fontSize: 17.0, color: Colors.grey),
                )
              ],
            ),
          ),
          const Row(children: [
            Icon(
              Icons.star,
              color: Colors.red,
            ),
            Text(
              "12",
              style: TextStyle(fontSize: 20.0, color: Colors.grey),
            )
          ])
        ],
      ),
    );
  }
}

class SectionAction extends StatelessWidget {
  const SectionAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(12.0),
        child: const Row(
          children: [
            ActionButton(icon: Icons.phone, buttonName: "Call"),
            ActionButton(icon: Icons.message, buttonName: "Message"),
            ActionButton(icon: Icons.photo_camera, buttonName: "Gallery")
          ],
        ));
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton({super.key, required this.icon, required this.buttonName});

  final IconData icon;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.blue,
            size: 40.0,
          ),
          Text(
            buttonName,
            style: const TextStyle(fontSize: 17.0, color: Colors.blue),
          )
        ],
      ),
    );
  }
}

class SectionDescription extends StatelessWidget {
  const SectionDescription({super.key});
  final String lorem =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            lorem,
            style: const TextStyle(fontSize: 14.0, color: Colors.grey),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
