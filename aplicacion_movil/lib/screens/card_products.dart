import 'package:image_card/image_card.dart';
import 'package:flutter/material.dart';

class CardProducts extends StatefulWidget {
  const CardProducts({ Key? key }) : super(key: key);

  @override
  State<CardProducts> createState() => _CardProductsState();
}

class _CardProductsState extends State<CardProducts> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      FillImageCard(
                        width: 200,
                        heightImage: 140,
                        imageProvider: AssetImage('assets/crash.jpeg'),
                        tags: [_tag('Aventuras', () {}), _tag('1042', () {})],
                        title: _title(),
                        description: _content(),
                      ),
                      const SizedBox(width: 12),
                      FillImageCard(
                        width: 200,
                        heightImage: 140,
                        imageProvider: AssetImage('assets/forza.jpeg'),
                        tags: [_tag('Carreras', () {}), _tag('930', () {})],
                        title: _title(),
                        description: _content(),
                      ),
                      const SizedBox(width: 12),
                      FillImageCard(
                        width: 200,
                        heightImage: 140,
                        imageProvider: AssetImage('assets/halo5.jpeg'),
                        description: _content(),
                      ),
                      const SizedBox(width: 12),
                      FillImageCard(
                        width: 200,
                        heightImage: 140,
                        imageProvider: AssetImage('assets/ragnarok.jpeg'),
                        tags: [_tag('Acción 1100', () {})],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      FillImageCard(
                        width: 200,
                        heightImage: 140,
                        imageProvider: AssetImage('assets/spider.jpeg'),
                        tags: [_tag('Acción 980', () {})],
                        title: _title(),
                        description: _content(),
                        footer: _footer(),
                      ),
                      const SizedBox(width: 12),
                      FillImageCard(
                        width: 200,
                        heightImage: 140,
                        imageProvider: AssetImage('assets/us.jpeg'),
                        tags: [_tag('Aventuras 850', () {})],
                        title: _title(),
                        description: _content(),
                        footer: _footer(),
                      ),
                      const SizedBox(width: 12),
                      FillImageCard(
                        width: 200,
                        heightImage: 140,
                        imageProvider: AssetImage('assets/zelda.jpeg'),
                        tags: [_tag('Aventuras 600', () {}), _tag('Product', () {})],
                        footer: _footer(),
                      ),
                      const SizedBox(width: 12),
                      
                    ],
                  ),
                ),
                const SizedBox(height: 12),
              ],
            )),
      ),
    );        
    
  }
  Widget _title({Color? color}) {
    return Text(
      'Crash bandicoot',
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: color),
    );
  }

  Widget _content({Color? color}) {
    return Text(
      'This a card description',
      style: TextStyle(color: color),
    );
  }

  Widget _footer({Color? color}) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(
            'assets/avatar.png',
          ),
          radius: 12,
        ),
        const SizedBox(
          width: 4,
        ),
        Expanded(
            child: Text(
          'Super user',
          style: TextStyle(color: color),
        )),
        IconButton(onPressed: () {}, icon: Icon(Icons.share))
      ],
    );
  }

  Widget _tag(String tag, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6), color: Colors.green),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Text(
          tag,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
