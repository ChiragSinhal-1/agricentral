import 'package:flutter/material.dart';

class CornDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Corn"),
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
                          "Climate",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                            "Maize does well on a wide range of climatic conditions, and it is grown in the tropical as well as temperate regions, from sea-levels up to altitudes of 2500m. It is however susceptible to frost at all stages of its growth.")
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
                          "Maize can be grown successfully in variety of soils ranging from loamy sand to clay loam. However, soils with good organic matter content having high water holding capacity with neutral pH are considered good for higher productivity. Being a sensitive crop to moisture stress particularly excess soil moisture and salinity stresses; it is desirable to avoid low lying fields having poor drainage and also the field having higher salinity. Therefore, the fields having provision of proper drainage should be selected for cultivation of maize.",
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
                          "Seed and Sowing",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Selection of seed:",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "Seed should be free from insect, pest and disease free. It should be free from weed seed. It should be purchased from reliable sources. It should be high germination percentage.",
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Sowing Method:",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "Maize seed should be sown with dibbling or drilling method. It is depending on purpose of sowing, type of of maize, varieties and farm condition. Seed should not be sown more 5-6 cm depth of soil.",
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          " Seed rate and plant geometry:",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          " To achieve higher productivity and resource-use efficiencies optimum plant stand is the key factor. The seed rate varies depending on purpose, seed size, plant type, season, sowing methods etc.",
                          textAlign: TextAlign.justify,
                        ),
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
                          "Among all the cereals, maize in general and hybrids in particular are responsive to nutrients applied either through organic or inorganic sources. The rate of nutrient application depends mainly on soil nutrient status/balance and cropping system. For obtaining desirable yields, the doses of applied nutrients should be matched with the soil supplying capacity and plant demand (Site-specific nutrient management approach) by keeping in view of the preceding crop (cropping system). Response of maize to applied organic manures is notable and hence integrated nutrient management (INM) is very important nutrient management strategy in maize based production systems. Therefore, for higher economic yield of maize, application of 10 t FYM ha-1, 10-15 days prior to sowing supplemented with 150-180 kg N, 70-80 kg P2O5, 70-80 kg K2O and 25 kg ZnSO4 ha-1 is recommended. Full doses of P, K and Zn should be applied as basal preferably drilling of fertilizers in bands along the seed using seed-cum-fertilizer drills. Nitrogen should be applied in 5-splits as detailed below for higher productivity and use efficiency. N application at grain filling results in better grain filling.",
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
