import 'package:flutter/material.dart';
import 'package:temple_on_wheel/components/map_comp.dart';
import 'package:temple_on_wheel/constants/theme.dart';

class StationScreen extends StatelessWidget {
  const StationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: kMainThemeColor,
            centerTitle: false,
            expandedHeight: 100,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              background: Container(color: kMainThemeColor),
              titlePadding: const EdgeInsets.only(left: 20, bottom: 20),
              title: Text(
                "Temple\nOn Wheels",
                style: TextStyle(
                  fontFamily: "ClimateCrisis",
                  color: kSecondaryThemeColor,
                  fontSize: 15,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: GoogleMapComponent(
              latitude: 13.411593,
              longitude: 103.867416,
              zoom: 12.0,
              height: 250.0,
              showExpandButton: true,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nearby E-Stations',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Inter",
                    ),
                  ),
                  SizedBox(height: 16),
                  // Your other content here
                  Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: Icon(Icons.electric_meter_outlined),
                      title: Text(
                        'Station 1',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text('Distance: 2.5 km'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                  SizedBox(height: 10),
                  Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: Icon(Icons.electric_meter_outlined),
                      title: Text(
                        'Station 2',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text('Distance: 2.5 km'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                  SizedBox(height: 10),
                  Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: Icon(Icons.electric_meter_outlined),
                      title: Text(
                        'Station 3',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text('Distance: 2.5 km'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
