import 'package:flutter/material.dart';
import 'package:music_player_app/components/my_drawer.dart';
import 'package:music_player_app/model/playlist_provider.dart';
import 'package:music_player_app/model/song.dart';
import 'package:music_player_app/pages/song_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final dynamic playlistProvider;

  @override
  void initState() {
    super.initState();
    playlistProvider = Provider.of<PlayListProvider>(context, listen: false);
  }

  void goToSong(int songIndex) {
    playlistProvider.currentSongIndex = songIndex;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SongPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("P L A Y L I S T"),
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
      body: Consumer<PlayListProvider>(
        builder: (context, value, child) {
          final List<Song> playList = value.playList;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: playList.length,
                  itemBuilder: (context, index) {
                    final Song song = playList[index];
                    return Card(
                      elevation: 4,
                      margin: EdgeInsets.symmetric(vertical: 11, horizontal: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title: Text(song.songName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                        subtitle: Text(song.artistName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            song.albumArtImagePath,
                            height: 90,
                            width: 90,
                            fit: BoxFit.cover,
                          ),
                        ),
                        onTap: () => goToSong(index),
                      ),
                    );
                  },
                ),
                // Lyrics section
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Lyrics",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Roboto', // change font family
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "रचना: चूडामणि देवकोटा",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Roboto', // change font family
                        ),
                      ),
                      Text(
                        "संगीत: शक्ति बल्लभ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Roboto', // change font family
                        ),
                      ),
                      Text(
                        "स्वर: स्वरुपराज",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Roboto', // change font family
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        '''ज्ञान दिने वैभव दिने सभ्यता र विकास दिने 
सन्ततीलाई हुर्काई बढाई पौरख र सिप दिने 
जेष्ठ नागरिक  जेष्ठ नागरिक  
आदरणिय छन् सँधै जेष्ठ नागरिक ,

आफ्नो खुशी सन्तानको मुस्कानमा खोज्ने सँधै
आफ्नो गाँस कटाएर लालन पालन गर्ने उनै 
जेष्ठ नागरिक  जेष्ठ नागरिक  
आदरणिय छन् सँधै जेष्ठ नागरिक ,

रिती थिती बसाएर समाजलाई बाँधी राख्ने
दियो बनी ज्योती छर्दै सवैलाई प्रेरित गर्ने 
जेष्ठ नागरिक  जेष्ठ नागरिक  
आदरणिय छन् सँधै जेष्ठ नागरिक।''',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: 'Roboto', // change font family
                        ),
                        textAlign: TextAlign.center, // align lyrics in the middle
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
