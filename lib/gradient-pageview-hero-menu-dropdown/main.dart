import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class GPHDHome extends StatefulWidget {
  const GPHDHome({super.key});

  @override
  State<GPHDHome> createState() => _GPHDHomeState();
}

class _GPHDHomeState extends State<GPHDHome> {
  final List<String> image = [
    "https://cdn.marvel.com/u/prod/marvel/i/mg/9/30/538cd33e15ab7/standard_xlarge.jpg",
    "https://cdn.marvel.com/u/prod/marvel/i/mg/3/e0/661e9b6428e34/standard_xlarge.jpg",
    "https://cdn.marvel.com/u/prod/marvel/i/mg/3/50/537ba56d31087/standard_xlarge.jpg",
    "https://cdn.marvel.com/u/prod/marvel/i/mg/5/c0/537ba730e05e0/standard_xlarge.jpg",
    "https://cdn.marvel.com/u/prod/marvel/i/mg/1/c0/537ba2bfd6bab/standard_xlarge.jpg",
    "https://cdn.marvel.com/u/prod/marvel/i/mg/c/10/537ba5ff07aa4/standard_xlarge.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    timeDilation = 2.0;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: FractionalOffset.topRight,
                end: FractionalOffset.bottomLeft,
                colors: [Colors.red, Colors.yellow, Colors.green])),
        child: PageView.builder(
            controller: PageController(viewportFraction: 0.8),
            itemCount: image.length,
            itemBuilder: (BuildContext context, int i) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 20.0),
                child: Material(
                  borderRadius: BorderRadius.circular(30.0),
                  elevation: 8.0,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Hero(
                            tag: image[i],
                            child: Material(
                              child: InkWell(
                                onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            DetailHero(
                                              image: image[i],
                                            ))),
                                child: SizedBox.fromSize(
                                  size: const Size.fromRadius(48),
                                  child: Image.network(image[i],
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          )
                        ],
                      )),
                ),
              );
            }),
      ),
    );
  }
}

class DetailHero extends StatefulWidget {
  const DetailHero({super.key, required this.image});

  final String image;

  @override
  State<DetailHero> createState() => _DetailHeroState();
}

class _DetailHeroState extends State<DetailHero> {

  Color color = Colors.grey;

  void _options(Options options) {
    setState(() {
      color = options.color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Hero"),
        backgroundColor: Colors.grey,
        actions: [
          PopupMenuButton<Options>(
            onSelected: _options,
            itemBuilder: (BuildContext context){
            return listOption.map((Options options){
              return PopupMenuItem<Options>(
                value: options,
                child: Text(options.text),
              );
            }).toList();
          })
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: RadialGradient(center: Alignment.center, colors: [
              Colors.blue,
              color,
              Colors.black.withOpacity(0.9)
            ])),
            child: Center(
              child: Hero(
                  tag: widget.image,
                  child: ClipOval(
                    child: SizedBox(
                      child: Material(
                        child: InkWell(
                          onTap: () => Navigator.of(context).pop(),
                          child: Image.network(widget.image, fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}

class Options {
  Options(this.text, this.color);
  final String text;
  final Color color;
}

List<Options> listOption = <Options>[
  Options("Strength", Colors.red),
  Options("Agility", Colors.green),
  Options("Intelligence", Colors.blue)
];
