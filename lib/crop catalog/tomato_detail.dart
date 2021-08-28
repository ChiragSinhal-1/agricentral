import 'package:flutter/material.dart';

class TomatoDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tomato"),
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
                          "Tomato is a temperate crop but can be grown under a wide range of climatic conditions such as temperate, tropical and subtropical climate. The best performance can be obtained in a mild weather without the extremes of cold and heat and excessive rainfall. However, Tomato plant is hardy and in the young stage can withstand freezing temperature also. In India, short-day Tomato is grown in the plains and requires 10-12 hours day length. The long-day Tomato is grown in hills requiring 13-14 hours day length. For vegetative growth, lower temperature combined with short photoperiod is required whereas relatively higher temperature along with longer photoperiod is required for bulb development and maturity. The optimum temperature for vegetative phase and bulb development is 13-24˚C and 16-25˚C, respectively. It requires about 70% relative humidity for good growth. It can grow well in places where the average annual rainfall is 650-750 mm with good distribution during the monsoon period. Areas with low (< 650 mm) or heavy rainfall (>750 mm) are not particularly suitable for rain-fed crop.",
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
                          "Soil",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "Tomato can be grown in all types of soils such as sandy loam, clay loam, silt loam and heavy soils. However, the best soil for successful Tomato cultivation is deep, friable loam and alluvial soils with good drainage, moisture holding capacity and sufficient organic matter. In heavy soils, the bulbs produced may be deformed. Tomato crop can be grown successfully on heavy soil with application of organic manure prior to planting and preparation of the field for Tomato cultivation should be very good. The optimum pH range, regardless of soil type, is 6.0 - 7.5, but tomato can also be grown in mild alkaline soils. Tomato crop is more sensitive to highly acidic, alkali and saline soils and water logging condition. Tomato do not thrive in soils having pH below 6.0 because of trace element deficiencies, or occasionally, Al or Mn toxicity. The threshold electrical conductivity of a saturation extract (ECe) for tomato crop is 4.0 dS/m. When the ECe level exceeds this, crop yield starts declining.",
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
                          "Irrigation",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "Irrigation requirement of tomato depends upon the season, soil type, method of irrigation and age of the crop. In general, tomato needs irrigation at the time of transplanting, three days after transplanting and subsequently at   7-10 days interval depending upon the soil moisture. In general, Kharif crop needs 5-8 irrigations, the late Kharif crop requires 10-12 and Rabi crop needs 12-15 irrigations. Tomato being a shallow rooted crop, needs frequent light irrigation to maintain optimum soil moisture for proper growth and bulb development. Irrigation needs to be stopped when the crop attains maturity (10-15 days before harvest) and the top starts falling which helps in reducing the rotting during storage. Excess irrigation is always harmful and dry spell followed by irrigation will result in the splitting of the outer scales and also formation of bolters. Water loss with flood irrigation is too high due to conveyance, seepage and percolation losses.",
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Modern irrigation techniques such as drip and micro sprinkler irrigation help in saving irrigation water and improve the marketable bulb yield significantly. In case of drip irrigation, seedlings need to be planted at a spacing of 10 x 15 cm in a broad bed furrow (BBF) of 15 cm height and 120 cm top width with 45 cm furrow. Each BBF should have two drip laterals at (16 mm size) 60 cm distance with inbuilt emitters. The distance between two inbuilt emitters should be around 30-50 cm and the discharge flow rate is 4 l/hr. In case of micro sprinkler, the distance between two laterals (20 mm) of micro sprinkler should be 6m with a discharge rate of 135 l/hr. The research outcome indicated that the drip irrigation at 100 % Pan Evaporation (PE) significantly improved the marketable bulb yield (15-25%) with higher per cent A grade bulbs, water saving of about 35-40% and labour saving of 25-30% as compared to flood irrigation.",
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
                          "Fertigation",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "Fetigation is an effective and efficient method of applying fertilizers through drip irrigation which is used as the carrier and distributor of irrigation water and crop nutrients. Application of fertilizers @ NPK 40:40:60 kg /ha as basal and the remaining 70 kg N in seven splits through drip irrigation is recommended for achieving higher marketable bulb yield and cost benefit ratio. The drip irrigation system not only helps in water saving but also reduces nitrogen losses by leaching into ground water, as in fertigation, fertilizer nutrients are applied in root zone only.",
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
                          "Harvesting",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "Tomato is harvested depending upon the purpose for which the crop is planted. 0nion crop is ready for harvesting in five months for dry tomato. However, for marketing as green tomato, the crop becomes ready in three months after transplanting.",
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "n kharif season, since tops do not fall, bulbs are harvested soon after the colour of leaves changes to slightly yellow and red pigmentation on bulbs develop. Best time to harvest rabi tomato is one week after 50% tops have fallen over. Tomatos for sale as dried bulbs or for storage should be harvested progressively after tops have started falling over.",
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
