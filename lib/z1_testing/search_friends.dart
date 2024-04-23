import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var arrNames = [
      'FlorianTales',
      'Graver_Merchant',
      'Jacob Hillßpike',
      'KapturetheLight',
      'Olivi0Smith',
      "Gracia B.",
      'Mason 3illiam',
      'Evelyn_erchanr',
      'Liam23Jones'
    ];
    var arrImages = [
      'https://s3-alpha-sig.figma.com/img/1b52/b191/fbbe22720b2a057a68fe6efb35b5ba1c?Expires=1710115200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=EgxHoVhgf0rVvqsfeM0VTvqG2uf2Ud~GKDCL4Sug0Nv3VD~E1JfZFLNntyGVjkBLugATM3~ch-nRGASA~CTJ8A9018jYr64Dzd6hqBqhHnKSHRvoZbW~EnGqTDWxoWZpT-dmiu1-r6-8QKkn3nCqmGt1TQzEn1zXTj8VwBY4brPtn240IcrtRckSdi1-LbhoGzh4kHcTCdayS7C1EnCZ8KX7YFBYGXN~CSLseKE~1~EQZa--PWDZwQCdJy07QbsMvo5FoEb2~mkHkpRcZnd8~olxuXOKr2EkWCgyVhKYMo0etjaIveSydp8zgp92QngZPChCKozQdtKkgDExYaL-dA__',
      'https://s3-alpha-sig.figma.com/img/659d/fdf4/d5d55da849bfa9f7231c4db977223d95?Expires=1710115200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=NDHMDX8pvo57qcSs77~e2LLo8~zLwWPbngi48Sq9rKQvhfuTueHxedrXHkOFYCpQyd4rfirdmmCSSwJPXkFpqZgJZmFOYc1s8bFcctxbUOKylMK--FOnMJwf~rsCXp7~uwlz9RQ3hI5JleAG6j1H9JAvuLBMKnRj2HHc7Y4a304fwGmbi4zL0ThtPDetzVZEQmWNKwcrD-pIx-50TY3vKVjT3guS7bu7hPePF1ke7KCyg9u5zocBlYEI-~QitBl9cPoIE0hQ7sYN3V2Lux948xla3EusttsYg2pDeVYGr77fWmOnLNqtf79k2KtZxjwgFRp~bOSvJB1WAcX0s0UG4g__',
      'https://s3-alpha-sig.figma.com/img/f3c4/f25b/7293ddcccd8d6eb7f71d868a6d273d2c?Expires=1710115200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=cvidP0EkEDkxVbSdO6tnSg63ZinkJ1fKLDnC5oxg05EwTd9N3J5H7-xRyQiP6P3cqqBxV4RO5yDdu7PghEejLgCDqzigRNJSEhLe57GbwZNtZp1zttgZgMYJGBloFZCoRgiSvlLNnuoYP4ztEeaE5D-l--VjNQFS3kexMNIDRtC4ktxAMXfJw67GdEGNWMjaSXDAEeewTUlSXJ~-8kdeSPrkJPTQs9lzfWqC6LqbpUFm9qaxEYWHv7bzCfQbVdL44rwvq7AOduw12drRoYhT-8Ao0w4H6mWBUP2Inp2Zww9QXMW3h8uvGmLIdCoPbfLHFKJCsFmpsONPrgegMSszDQ__',
      'https://s3-alpha-sig.figma.com/img/d859/d8bd/aa96a3052ac2fa4a60bc22b4bb8d14da?Expires=1710115200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=fpFT3gOsexd3cjhuSCaVf114QF7MXz-Vna949wS3Ou~SSHCyHsrN76422Gy-ZBZjI7a387WZAV2r0raCcyO6jf-VXVCALYSclndl~YqxnZsQ9UXyde6l4t2IQV5qiy0NoatYR6ZNLLFpGNgwmY3JJETMkyFhIfQHbyNVYCkZK9vnV-n3wlIgC2eAg9W9ZmGp9AL8-QF0OQzborkPO-jlrf~i9ZRLteftzbHvPA2MCse41W-2xNTmDuy5-lTSMn5BwBFuYiqimu0RDFumil8W9zDdguYRBr8h9fRltMRRAS3FUecdiVptipDcycMQ64nPupxL5cIp3rK1aawAwBPUkg__',
      'https://s3-alpha-sig.figma.com/img/fc40/35a5/c79af1f4fed09a6ec8a4df730ab00383?Expires=1710115200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=JdVw7wd3vwH4H3fTnY-eZIyHk3CNHRznYnzLkbDQf8ymVXuJHS4tmnGogAaBlXMJ0f1MtF7juoJA1z5yu5RftRWGRP12swjy-vIEuoRaScmTLc93pEGM7hvwoMRZbhyUpNA2palFQGFLYIjwLSnv7b8-HDSpljzFuS6ov3znT5w9jJfws10~vPEQOGGoPkugtMOSF01xvuNCftCoh5znRJu-q-W5Y8Nr1Y05srgEVvnScVp2V4rxbIWlBGctofHfjywlefOthzzzs~uE6qk7AfOaBOX8wa-TAJrvR-SpA2y9SwowwhZpcAEYH3Ptz8nU-RJoC~hW2RPu8sEjJYCz7Q__',
      'https://s3-alpha-sig.figma.com/img/4853/ab97/d659a65954d2d688cd945d410a0bfc4e?Expires=1710115200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=X8iKyHKilBRoMy1HL5W0g6qobZxU5fWIfnqMPkgDHJ6q2abz-ohHuZKHNAHubuZWg7MWX6id27beCwiBuH2w1KVMvnN7VohXQ83i~-gAjsLMSBRAy~u47FwNvnnTRG7obCHH8CGpGukqejPAIAY29xv5QSlsRYhQejtu-feEAZVrJ04WFNiOmwByqBTHkQXezmvCvCp1EMiFJpdmaPfyc80Hb1Jozjg~zUtsrhudHvl76DysoDFu7ZG3OG2fq6Jvx5IkGfHM2mzkS-5sqFU8lVyVDftwwZYhVqAuR4FiJae57J~g5SK9p7b8w4Zj~~zLKWddwXNHA2l8Qq5MScLn2w__',
      'https://s3-alpha-sig.figma.com/img/ee96/2e2d/ae99fef584cc5240b5d6a167269ab777?Expires=1710115200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=T4ENyHv7Acj3N6NPcHwVL7ZPM1YTXoGMtuJNvuX1tsI9203V8lCyLYDhxsGy8fykdR5D-ifPyLSGYSgo3TuMu7o2Rr4Sc5NBQVsfUieKBpppFg1DFoykND6jvZjf~rfpPjMUbWevowzrUeswOiX2kmRI8brTkHzirKKjev-eDNkn9Q~zdmt~l5wdycwN3aLozzRiZtELXnL2T~sGp65s3Xngyfr8~SYxTDTE9AabY2mSWIWKP5BbNQL2p2xElrT4QJTbXGhvDGsV0JwqPxY2HGuhHfn6933NgVbnSSw8Y476nQ-5mGO5~d~Rpv95vypb-pUwukIqs-hBOBDCxrHF9g__',
      'https://s3-alpha-sig.figma.com/img/eec7/2a9f/5fd02fb95b532ce149517dbe42011c85?Expires=1710115200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=ienrbL13tNu0qjJ5OJwFraM8kQtzQt8HMi9XTT5DFwIcLLynSt2A0mCigVJc~fvLIySrj4Jj6~Yy1qKgGV2YvWJwEeQA66UPH3b0mi2pHMTDqSx18Vt79pFUaDzv~HaFLFIF0oGiljN2wIW3ACS2KHaS9M235YhRWc-ZmhpV4UJCZ2uAIJeSAMsMxoxEP3R2plFJ-HNmvGTvsOG0ATiNU-~vDZa586kbGY8OGysmLDgHO2gPvycW3d9jxPzT~Yqu2yVABvG0qjv1EN71M9Ld6hWyOeGu140PVokW~LVpR12Fm88EraBp1EWOt-bFugcb9zZ5o57AVNbhDeeqYJu9jA__',
      'https://s3-alpha-sig.figma.com/img/40dd/7113/01eef228c6d13fd4e8df32bcc7206fd5?Expires=1710115200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Q2tE9BAOESszoN0pfrZi-74~Xd5BjBNYO8D~7s9-GGvp-tVueSFefaQeYS5sQgK-0HHNWb3W6YiKoWdbqEHqO4Odd4omi4RF-8w0Ax3AumpTQ81lflBf0svI2O4UDp7y2SLNqZa919rgbaYbsp87mmV6enrvLk9lyUEaCQfMTC-I8rOogwh2LF8vkPJ5b38o51g63pkNxTPEuFx1cZSHjC65AVNJdGdHN4QmPQ-OvS5GJHJm4g3T7tVfZIlFub8j0EGDdNc3m~OdlMXQhCK5zMF65VqVy86D4BUO6cu~D86Xphvx~OTzONKpMW8FLwlfRrtRJky2f~dhUfxlsrqvbQ__',
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Search for Friends'),
          leading: Icon(Icons.arrow_back),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  fillColor: Color.fromRGBO(248, 248, 251, 1),
                  filled: true,
                  suffixIcon: Icon(Icons.search),
                  hintText: 'Swa',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 12),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: arrNames.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: EdgeInsets.only(bottom: 10),
                      title: Text(arrNames[index]),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(arrImages[index]),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
