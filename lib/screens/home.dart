import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff1b232A),
        body: const SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: CryptoHeading2()),
              SliverToBoxAdapter(child: CryptoListView1()),
            ],
          ),
        ),
        bottomNavigationBar: CryptoBottomNavBar(
          selectedIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ));
  }
}

class CryptoHeading1 extends StatelessWidget {
  const CryptoHeading1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total balance",
                style: TextStyle(
                    color: Colors.white.withOpacity(.55), fontSize: 15),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "\$259.54",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(
              Icons.remove_red_eye,
              color: Colors.grey,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}

class CryptoHeading2 extends StatelessWidget {
  const CryptoHeading2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 15.0, right: 15.0, top: 15.0, bottom: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            "Favoritas",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class CryptoBtnRow1 extends StatelessWidget {
  const CryptoBtnRow1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ActionBtn(text: "Deposit", onTap: () {}, active: true),
          ActionBtn(text: "Withdraw", onTap: () {}, active: false),
          ActionBtn(text: "Transfer", onTap: () {}, active: false),
        ],
      ),
    );
  }
}

class CryptoListView1 extends StatelessWidget {
  const CryptoListView1({Key? key}) : super(key: key);
  final String bitcoin =
      "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/coinbase%2F1200px-Bitcoin.png?alt=media&token=0ebd9322-e2a4-4a3f-9c6e-a4c9342a593e";

  final String cardano =
      "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/coinbase%2F3305878.png?alt=media&token=6e9a95eb-8aa7-401f-a388-bd2302c881d4";

  final String ethereum =
      "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/coinbase%2Feth.png?alt=media&token=131beeef-99b3-42d4-b48c-9481e73fa5cf";

  final String shiba =
      "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/crypto%2FShiba_Inu_coin_logo.png?alt=media&token=f3be657d-0169-44c4-9727-4882ffc49143";

  final String doge =
      "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/crypto%2FDogecoin_Logo.png?alt=media&token=2634e5ab-4b67-4106-8049-11247c21a712";

  final String lite =
      "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/crypto%2Flitecoin-ltc-logo.png?alt=media&token=30ccdf36-d6b8-4cf7-86f9-edc13a5e2a8a";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 40),
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 1.3,
        child: ListView(
          children: [
            AssetCard(cardano, "\$125.00", "52.129 ADA", "Cardano"),
            AssetCard(bitcoin, "\$50.10", "0.0003 BTC", "Bitcoin"),
            AssetCard(ethereum, "\$74.35", "0.01 Eth", "Ethereum"),
            AssetCard(doge, "\$0.35", "100.1 DOGE", "Doge"),
            AssetCard(lite, "\$545.35", "1 LTE", "Lite"),
            AssetCard(shiba, "\$10.35", "0.000015 SHIB", "Shiba Inu"),
          ],
        ),
      ),
    );
  }
}

class CryptoBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;
  const CryptoBottomNavBar(
      {required this.selectedIndex, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: SizedBox(
        height: 83,
        child: BottomAppBar(
          color: const Color(0xff1b232A),
          child: SizedBox(
            height: 54,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconBottomBar(
                    text: "Favoritas",
                    icon: Icons.favorite,
                    selected: selectedIndex == 0,
                    onPressed: () => onTap(0),
                  ),
                  IconBottomBar(
                    text: "Cotações",
                    icon: Icons.bar_chart,
                    selected: selectedIndex == 1,
                    onPressed: () => onTap(1),
                  ),
                  IconBottomBar(
                    text: "Meu Perfil",
                    icon: Icons.person_rounded,
                    selected: selectedIndex == 4,
                    onPressed: () => onTap(4),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  IconBottomBar(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(icon,
              size: 25,
              color: selected
                  ? const Color(0xff5ED5A8)
                  : Colors.grey.withOpacity(.75)),
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 12,
              height: .1,
              color: selected
                  ? const Color(0xff5ED5A8)
                  : Colors.grey.withOpacity(.75)),
        )
      ],
    );
  }
}

class AssetCard extends StatelessWidget {
  final String image;
  final String text;
  final String price;
  final String qty;
  const AssetCard(this.image, this.price, this.qty, this.text, {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: Row(
          children: [
            Image.network(image, width: 35),
            const SizedBox(
              width: 15,
            ),
            Text(
              text,
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Colors.white),
            ),
            const Spacer(),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          overflow: TextOverflow.ellipsis),
                    ),
                    Text(
                      qty,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(.55),
                          overflow: TextOverflow.ellipsis),
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}

class ActionBtn extends StatelessWidget {
  final String text;
  final Function() onTap;
  final bool active;

  const ActionBtn({
    required this.text,
    required this.onTap,
    required this.active,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        width: MediaQuery.of(context).size.width / 3.5,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: active ? const Color(0xff5ED5A8) : const Color(0xff777777),
            boxShadow: [
              BoxShadow(
                color: active
                    ? const Color(0xff5ED5A8).withOpacity(.15)
                    : Colors.transparent,
                offset: const Offset(0, 10),
                blurRadius: 20,
                spreadRadius: 0,
              )
            ]),
        child: TextButton(
          onPressed: onTap,
          child: Text(text,
              style: TextStyle(color: active ? Colors.black : Colors.white54)),
        ));
  }
}
