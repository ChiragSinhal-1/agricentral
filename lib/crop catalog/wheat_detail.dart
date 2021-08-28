import 'package:flutter/material.dart';

class WheatDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wheat"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: [Colors.tealAccent, Colors.teal])),
          child: Card(
            elevation: 8,
            child: Container(
              padding: EdgeInsets.only(top: 16, right: 24, bottom: 16),
              child: Column(
                children: [
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Season",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Best season to cultivate wheat is Winter")
                      ],
                    ),
                    leading: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Color(0xff01a982),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Soil",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "Wheat is grown in a variety of soils of India. Soils with a clay loam or loam texture, good structure and moderate water holding capacity are ideal for wheat cultivation.  Heavy soil with good drainage are suitable for wheat cultivation under dry conditions. ",
                          textAlign: TextAlign.justify,
                        )
                      ],
                    ),
                    leading: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Color(0xff01a982),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Fertilizer Management",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "The time and placement of fertilizer is another area where significant progress was made. It was demonstrated that 120 kg nitrogen, 60 kg phosphorus and 30 kg potash per hectare were required for optimum productivity. The N was to be applied in two split doses of 60 kg as basal and the remaining 60 kg at first irrigation and full phosphorus and potash to be applied as basal. Recently, the new wheat varieties have responded up to 180 kg N/ha with optima dose around 150 kg/ha. In the Indo-Gangetic plains, application of zinc @ 25kg/ha in rice-wheat system was found to increase the yield substantially. Recently, the use of sulphur has been found beneficial for enhancing the productivity as well as the grain protein content of wheat. Response to Mn (pockets in the Indo-Gangetic plains) and boron (eastern and far eastern region) has also been realized.",
                          textAlign: TextAlign.justify,
                        )
                      ],
                    ),
                    leading: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Color(0xff01a982),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Nutrition Management: ",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "With intensive agriculture, deficiency of essential nutrients has also become wide spread. The work conducted under the All India Coordinated Research Project on Micronutrient in Crops and Soils, has shown wide spread deficiency of zinc in soils in India. At the national level, the deficiency level in micro nutrients is Zn: 46 %, B: 17 %, Mo: 12 %, Fe: 11 % and Cu: 5%. The deficiency of sulphur has also been reported across a wide range of soils (38%).The yield response to sulphur has been obtained in more than 40 crops including cereal, millets, oilseeds and pulses etc",
                          textAlign: TextAlign.justify,
                        )
                      ],
                    ),
                    leading: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Color(0xff01a982),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
