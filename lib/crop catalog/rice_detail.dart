import 'package:flutter/material.dart';

class RiceDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rice"),
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
                          "Rice is a tropical climate crop that can grow from sea level to an altitude of 3000 meters. Paddy cultivation can also be done in temperate and sub-tropical climate under humid conditions. A high temperature, humidity and sufficient rainfall with irrigation facilities are the primary requirements of paddy cultivation. It also needs bright sunshine with temperature ranging between 20 and 40⁰C. It can tolerate temperature upto 42⁰C.",
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
                          "Season",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            Text(
                              "Since rice can grow in a variety of climate and altitude it is cultivated in different seasons in different parts of the country. In areas of high rainfall and low winter temperature (northern and western parts) rice crop is grown once a year- during May to November. Two or three crops are grown in the southern and eastern states. India has three rice farming seasons- summer, autumn and winter. However, the chief rice growing season is ‘kharif’ season also called ‘winter rice’. The sowing time is June-July and is harvested during November- December months. 84% of the country’s rice supply is grown in the kharif crop.",
                              textAlign: TextAlign.justify,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Rice cultivated during rabi season is also called as ‘summer rice’. It is sown in the months of November to February and harvested during March to June. 9% of total rice crop is grown in this season. Early maturing varieties are normally grown during this time.",
                              textAlign: TextAlign.justify,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "The pre-kharif or ‘autumn rice’ is sown during May to August. The sowing time also depends on the rainfall and weather condition. Hence the timing may differ slightly from place to place. Generally, it is harvested during September- October months. 7% of the total rice crop in India grows in this season and short duration varieties which mature within 90-110 days are cultivated.",
                              textAlign: TextAlign.justify,
                            ),
                          ],
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
                          "Almost every type of soil can be used for rice cultivation provided the region has a high level of humidity, sufficient rainfall with irrigational facilities, and a high temperature. The major types of soils for rice cultivation are black soil, red soil (loamy and yellow), laterite soil, red sandy, terai, hill and medium to shallow black soil. It can be even cultivated on silts and gravels. If the cultivating soil has rich organic matter and if it powders easily on drying or forms a puddle when wet then it is considered to be ideal.",
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
                          "Treatment of Seeds",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "The seeds must be soaked in salt solution for 10 minutes. The ones that float must be discarded while the ones that sink are mature seeds that must be used for planting. Immediately wash the seeds after removing from the solution. Farmers are advised to soak the seeds in a good fungicide solution like carbendazim for 24 hours. This ensures the seed protection from fungal diseases. If the area of cultivation is prevalent in bacterial diseases like leaf blight, then the seeds must be soaked in Streptocycline solution for 12 hours. After this, they must dried thoroughly under shade and then used for sowing. Normally seeds are sprouted before sowing or then grown in nurseries before transplanting.",
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
                          "Harvesting Rice ",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "One of the essential factors in rice cultivation is in-time rice harvesting otherwise the grains would shed. Irrigation of the field is completely stopped about a week before harvesting. This dehydration process helps in grain ripening. It also hastens maturity. In case of early and medium maturing varieties, harvesting should be carried out 25- 30 days after flowering. The late maturing varieties are harvested 40 days after flowering. They are generally harvested when the moisture content is about 25%. Post harvesting, drying is carried out gradually under shade.",
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
