import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductListScreen extends StatelessWidget {
  final String category;

  const ProductListScreen({super.key, required this.category});

  Future<void> _openLink(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }

  // 🔥 MOCK PRODUCTS (safe + demo ready)
  List<Map<String, String>> getProducts() {
    if (category == "Salicylic Acid Cleanser") {
      return [
        {
          "name": "Derma Co Salicylic Acid Cleanser",
          "image":
              "https://m.media-amazon.com/images/I/61yksgXYsuL._SL1080_.jpg",
          "link":
              "https://www.amazon.in/Derma-Co-Salicylic-Willow-Active/dp/B0C61Q7DM7/ref=sr_1_12?crid=2F9WUKZIR6PWG&dib=eyJ2IjoiMSJ9.nEtrcao0ICXdL6R5qEXGwNIJnk68OWc2oJhUxsR0m9dQvRFkQt8de6ZtisH27itsqsmqOaQIxYsb0tlp0SkJBxY4VV3_4XNU90kLmiqem47hF3f-T3DxyycJSRF0-o6h3UarvkOLWnbU-h5djCoFLZSCGdKbWq3UBTs5VV-H2Du7C89lxg4BD6mHU2AdJAEgMsWlLTzvhoEpSrZQA5mqYHFoKX48Hr_zvovt77g1QnAeakhO00wJ-VXOjEh19Lhj9iUv1e2Mz91Zh5O5loFQUgSet0Ln2Svre3TF64lX1u4.zfaCcnS8I5001VoGCXef-lf4TApSFXaG0WvoTfw1QUg&dib_tag=se&keywords=derma%2Bco&qid=1774234413&sprefix=derma%2Bc%2Caps%2C701&sr=8-12&th=1",
        },
        {
          "name": "Minimalist Regulation Sulfate-Free Cleanser",
          "image":
              "https://m.media-amazon.com/images/I/514PVblwPdL._SL1200_.jpg",
          "link":
              "https://www.amazon.in/Minimalist-Regulation-Sulfate-Free-Exfoliation-Combination/dp/B096PJMGPL/ref=sr_1_2_sspa?crid=UN5Z9PW46QR2&dib=eyJ2IjoiMSJ9.UhUQNcYMiyNbr70TbXPOAYqDxdyil567DMwWMqxRMNIXQs-QgUW7MQVQgxVoyMmW5mRYXWug1aCxxf2HuX4sNvQoT3pHzTKu7Op6jtI6CXaESbxMXdfq6pwYDYexrkqOf32pZCMvnoHN7sdl4iaPwGvZlBXewqxrKynGYXqXj_N9pyYY6nGwKkIK_56Ex-WTCCcTkTe28zTLd8pjMD9L7AgOvy1eXZME4og8R1YvVoDOLczqQsqwYxahpLWhlZdoR82GX-K4r_ypW38qfEY0iY-8q2XIuXDi5w8SUx2gD7M.jJep8BPgVOByyUNkNhimdQdEKpvOvMQT-4Obm5dpnO4&dib_tag=se&keywords=Salicylic%2BAcid%2BCleanser&qid=1774235108&sprefix=salicylic%2Bacid%2Bcleanser%2Caps%2C366&sr=8-2-spons&aref=u2LsxjwnL3&sp_csd=d2lkZ2V0TmFtZT1zcF9hdGY&th=1",
        },
      ];
    }

    if (category == "Niacinamide Serum") {
      return [
        {
          "name": "Derma Co Niacinamide Serum",
          "image":
              "https://m.media-amazon.com/images/I/61T9Iotet3L._SL1080_.jpg",
          "link":
              "https://www.amazon.in/Derma-Co-Niacinamide-Serum-Marks/dp/B08TQGMWT1/ref=sr_1_2_sspa?crid=33IKYOD1LVMDU&dib=eyJ2IjoiMSJ9.7_jGOdv6WG7JO2fK0S1YaFG3EIDzPMlNJZ5ORb9CLRkyOYyoRdkSIuAoU10W7YPJmwLKj43KRgsmD-PGHh8DYrDe0P7DJ24EQrxJ0rTtfZf1VIHi5exUGtRN8Ccl5NVFzpS9Kk_MReWr4EUKjB-Cs7fzKg7TXy0Dm4BOTMthQ0qUPA-mXP9sumBdrLRPlxoAqnmVjSo5yb6yY9G9Z1CDR3TzTW2aDkGBUvMjbkrQEMSNd_xAX4kiUeZjTmy_KWD-3IvJ2CqjEbXGyEJeK0Xm9eZqarknvnCrOPi5jCn_iIA.QjnMC_D91lXAVRP-tJilAhnO-biJUwHymiibhE_znSs&dib_tag=se&keywords=niacinamide%2Bserum&qid=1774235350&sprefix=niacinamide%2Bserum%2Caps%2C351&sr=8-2-spons&aref=ZabpZXmqig&sp_csd=d2lkZ2V0TmFtZT1zcF9hdGY&th=1",
        },
        {
          "name": "Plum Niacinamide Serum",
          "image":
              "https://m.media-amazon.com/images/I/51s3c+qYOwL._SL1500_.jpg",
          "link":
              "https://www.amazon.in/Plum-Niacinamide-Fermented-Blemish-Free-Fragrance-Free/dp/B097R8B7J7/ref=sr_1_4_sspa?crid=33IKYOD1LVMDU&dib=eyJ2IjoiMSJ9.7_jGOdv6WG7JO2fK0S1YaFG3EIDzPMlNJZ5ORb9CLRkyOYyoRdkSIuAoU10W7YPJmwLKj43KRgsmD-PGHh8DYrDe0P7DJ24EQrxJ0rTtfZf1VIHi5exUGtRN8Ccl5NVFzpS9Kk_MReWr4EUKjB-Cs7fzKg7TXy0Dm4BOTMthQ0qUPA-mXP9sumBdrLRPlxoAqnmVjSo5yb6yY9G9Z1CDR3TzTW2aDkGBUvMjbkrQEMSNd_xAX4kiUeZjTmy_KWD-3IvJ2CqjEbXGyEJeK0Xm9eZqarknvnCrOPi5jCn_iIA.QjnMC_D91lXAVRP-tJilAhnO-biJUwHymiibhE_znSs&dib_tag=se&keywords=niacinamide%2Bserum&qid=1774235350&sprefix=niacinamide%2Bserum%2Caps%2C351&sr=8-4-spons&aref=obcSchtw2z&sp_csd=d2lkZ2V0TmFtZT1zcF9hdGY&th=1",
        },
      ];
    }

    if (category == "Vitamin C Serum") {
      return [
        {
          "name": "The Derma Co 10% Vitamin C Face Serum with 5% Niacinamide",
          "image":
              "https://m.media-amazon.com/images/I/61dY-NS8lPL._SL1080_.jpg",
          "link":
              "https://www.amazon.in/Derma-Co-Niacinamide-Hyaluronic-Radiance/dp/B096MNYLWS/ref=sr_1_1_sspa?crid=XBFJ9OIYMF4M&dib=eyJ2IjoiMSJ9.BPvJOjVs2k00nlCJiKFnE5YPAR3y2yRPoIIWs8KTCrKEaTPU4ZFnndGZyqtY5Xo8BaLw6PElrAImfiWwh2o9XnLB_UR9dUVxjpyfs4Gs9zGThW1XhmdHERqJLtOOG1NBMtbq1tAsxYvX-M7Lw7cwiJN5ua4bKPXDm9n-TenNDL62Vi2HvW-JeaheZQUe84PRkJksFvExlwb1yDLvp5Lxa0UwDWuUYPkCEP01ti_Rbv4T5SvMNagjfbS-wBS4GO9VngxW2E02JVQEEzEXixCEnkjgGQasrh0watBjBA2n3D4.9KrQjGNPL_wpf5mRkaaqJJBdY0AZjDIiRpr7gNLrvao&dib_tag=se&keywords=vitamin%2Bc%2Bserum%2Bfor%2Bglowing%2Bskin&qid=1774236348&sprefix=vitamin%2B%2Caps%2C346&sr=8-1-spons&aref=DEoezUTKKp&sp_csd=d2lkZ2V0TmFtZT1zcF9hdGY&th=1",
        },
        {
          "name": "Pilgrim 10% Vitamin C Face Serum For Daily Brightness",
          "image":
              "https://m.media-amazon.com/images/I/71WKftoavnL._SL1500_.jpg",
          "link":
              "https://www.amazon.in/Pilgrim-Vitamin-Brightness-glowing-Fragrance/dp/B0D5DBMKMC/ref=sr_1_5?crid=XBFJ9OIYMF4M&dib=eyJ2IjoiMSJ9.BPvJOjVs2k00nlCJiKFnE5YPAR3y2yRPoIIWs8KTCrKEaTPU4ZFnndGZyqtY5Xo8BaLw6PElrAImfiWwh2o9XnLB_UR9dUVxjpyfs4Gs9zGThW1XhmdHERqJLtOOG1NBMtbq1tAsxYvX-M7Lw7cwiJN5ua4bKPXDm9n-TenNDL62Vi2HvW-JeaheZQUe84PRkJksFvExlwb1yDLvp5Lxa0UwDWuUYPkCEP01ti_Rbv4T5SvMNagjfbS-wBS4GO9VngxW2E02JVQEEzEXixCEnkjgGQasrh0watBjBA2n3D4.9KrQjGNPL_wpf5mRkaaqJJBdY0AZjDIiRpr7gNLrvao&dib_tag=se&keywords=vitamin%2Bc%2Bserum%2Bfor%2Bglowing%2Bskin&qid=1774236348&sprefix=vitamin%2B%2Caps%2C346&sr=8-5&th=1",
        },
        {
          "name":
              "DOT & KEY 10% Vitamin C + E Serum with 5% Niacinamide,for Glowing Skin,Fades Dark Spots & Hyperpigmentation",
          "image":
              "https://m.media-amazon.com/images/I/614RKPwdPwL._SL1500_.jpg",
          "link":
              "https://www.amazon.in/dp/B0BCQ5RJH1/?_encoding=UTF8&aref=HtoDB38Nr7&pd_rd_i=B0BCQ5RJH1&ref_=sbx_be_s_sparkle_ssd_vid&qid=1774237071&pd_rd_w=VUg9Q&content-id=amzn1.sym.9269eab1-ae85-443b-9ec2-b2fa4ebaad05%3Aamzn1.sym.9269eab1-ae85-443b-9ec2-b2fa4ebaad05&pf_rd_p=9269eab1-ae85-443b-9ec2-b2fa4ebaad05&pf_rd_r=GEWXM9NHCN9X9XM6SQPR&pd_rd_wg=nTlA3&pd_rd_r=8c9a9221-7d85-4512-a0a9-aa21d7f727cc&th=1",
        },
      ];
    }

    if (category == "Hyaluronic Acid Moisturizer") {
      return [
        {
          "name":
              "DOT & KEY 72Hr Hydrating Gel + Probiotics Moisturizer For Face With Hyaluronic Acid",
          "image":
              "https://m.media-amazon.com/images/I/61xPqnsI09L._SL1500_.jpg",
          "link":
              "https://www.amazon.in/Dot-Key-Comedogenic-Lightweight-moisturizer/dp/B08V4SGGDG/ref=sr_1_8?dib=eyJ2IjoiMSJ9.FmHGlaikAj4vqwbjyTMNRVbYGuW71EIOG01-j7v0GMsJ2ICvsoUAtD7t8e76gCRga4-R0FuBsSt-F2AW4ZSLmwtDE2Qw4u8B1m3OAiZYyerYXWES9FqzbCJ-QAAdd_Y5ePswzk6Wyrx5ewfp_ahBqRgEEFLIMKc67znW_de_RnyqT5wNapFndlMPT5X2uuG-sjShGnf4k79WqzoI52BqWA40HIdG03wr6VGSVJ6nNMWzTEpj8xXJQW7hF2xp7BMI5r6tpkVMUH25KTz5w5k-2IuDDgNE21wdLCpF3kdm_8A.5jSBWpOOKGdgLSuRmUOsc4KMKELW8cImViBbf7bOYB0&dib_tag=se&keywords=dot%2Band%2Bkey%2Bmoisturiser&qid=1774236627&sr=8-8&th=1",
        },
        {
          "name":
              "Plum 2% Niacinamide & Rice Water Superlight Gel Cream Moisturizer for Face",
          "image": "https://m.media-amazon.com/images/I/41nFzsxYbvL.jpg",
          "link":
              "https://www.amazon.in/Plum-Niacinamide-Moisturizer-MatmarineTM-Lightweight/dp/B0C2Z5F5TJ/ref=sr_1_1_sspa?dib=eyJ2IjoiMSJ9.FmHGlaikAj4vqwbjyTMNRVbYGuW71EIOG01-j7v0GMsJ2ICvsoUAtD7t8e76gCRga4-R0FuBsSt-F2AW4ZSLmwtDE2Qw4u8B1m3OAiZYyerYXWES9FqzbCJ-QAAdd_Y5ePswzk6Wyrx5ewfp_ahBqRgEEFLIMKc67znW_de_RnyqT5wNapFndlMPT5X2uuG-sjShGnf4k79WqzoI52BqWA40HIdG03wr6VGSVJ6nNMWzTEpj8xXJQW7hF2xp7BMI5r6tpkVMUH25KTz5w5k-2IuDDgNE21wdLCpF3kdm_8A.5jSBWpOOKGdgLSuRmUOsc4KMKELW8cImViBbf7bOYB0&dib_tag=se&keywords=dot%2Band%2Bkey%2Bmoisturiser&qid=1774236627&sr=8-1-spons&aref=dW0waTxNYn&sp_csd=d2lkZ2V0TmFtZT1zcF9hdGY&th=1",
        },
      ];
    }

    if (category == "Foaming Gel Cleanser") {
      return [
        {
          "name":
              "Dot & Key CICA Face Wash for Acne Prone Skin, 2% Salicylic Acid with Green Tea | For Oily & Sensitive Skin",
          "image":
              "https://m.media-amazon.com/images/I/51xTJd0ZfuL._SL1500_.jpg",
          "link":
              "https://www.amazon.in/Salicylic-Sensitive-Sulphate-Blemish-Clearing/dp/B0BCJZ289Q/ref=sr_1_3_sspa?crid=2DNVKCQJC57ZN&dib=eyJ2IjoiMSJ9.dxuvPzK3H2NP37vUoDzt0hHc3tDXKxph4fXlvYaEWabDEoh0oOJ-Yt7l3s3cc1DXTWttyPEE4oP_vFk57pyWp5Vmg2QRA24zGGDKlg3ysiCEpK5O8R5H1kdqUaN2j8T3Bw0-rSpyTsuWJtzQvoEsjhsChPw8ivdrQTmpLew12vabnnh6RSh6MYf3_KZwyZKS3cz7lH2wUsXLlBkoapO73yNYU-auuVkcy9Mv8kVFrmkR-TR5L3XRdfBZX2oHUl_hF-HKHp_IKbLV3OqVcMopyIkHIhbrHlssoesnoEcfzts._Mb3w30MuYkgu2Vr_zRhoec6GdpigKpF3b-T5Q1CnBc&dib_tag=se&keywords=dot%2Band%2Bkey%2Bfacewash&qid=1774236841&sprefix=dot%2Band%2B%2Caps%2C361&sr=8-3-spons&aref=UclpSgw8Fm&sp_csd=d2lkZ2V0TmFtZT1zcF9hdGY&th=1",
        },
        {
          "name":
              "DOT & KEY Vitamin C + E Super Bright Gel Face Wash For Glowing And Brightening Skin",
          "image":
              "https://m.media-amazon.com/images/I/61OFfAjyX2L._SL1500_.jpg",
          "link":
              "https://www.amazon.in/DOT-KEY-Vitamin-Brightening-Pigmentation/dp/B0CF28HXPY/ref=sr_1_2_sspa?crid=2DNVKCQJC57ZN&dib=eyJ2IjoiMSJ9.dxuvPzK3H2NP37vUoDzt0hHc3tDXKxph4fXlvYaEWabDEoh0oOJ-Yt7l3s3cc1DXTWttyPEE4oP_vFk57pyWp5Vmg2QRA24zGGDKlg3ysiCEpK5O8R5H1kdqUaN2j8T3Bw0-rSpyTsuWJtzQvoEsjhsChPw8ivdrQTmpLew12vabnnh6RSh6MYf3_KZwyZKS3cz7lH2wUsXLlBkoapO73yNYU-auuVkcy9Mv8kVFrmkR-TR5L3XRdfBZX2oHUl_hF-HKHp_IKbLV3OqVcMopyIkHIhbrHlssoesnoEcfzts._Mb3w30MuYkgu2Vr_zRhoec6GdpigKpF3b-T5Q1CnBc&dib_tag=se&keywords=dot%2Band%2Bkey%2Bfacewash&qid=1774236841&sprefix=dot%2Band%2B%2Caps%2C361&sr=8-2-spons&aref=Xv3SLEJGsd&sp_csd=d2lkZ2V0TmFtZT1zcF9hdGY&th=1",
        },
      ];
    }

    if (category == "Caffeine Eye Serum") {
      return [
        {
          "name":
              "Chemist At Play Under Eye Cream with 2% Revital Eye & Quinoa Extract | For Reducing Dark Circles",
          "image":
              "https://m.media-amazon.com/images/I/71srpfaZkRL._SL1500_.jpg",
          "link":
              "https://www.amazon.in/Chemist-Play-Puffiness-Plant-Based-Ceramides/dp/B0CCLHR9TT/ref=sr_1_2_sspa?crid=2ICPDC1YB4M8U&dib=eyJ2IjoiMSJ9.6yNjzNhjWSKuAtYjorC_W106BzGqAzttuit9FFPjmLKPFmeyzE-9cLK5t1yOETh7-WcZOFqHXmixFMTmIgXxf839SOB0T6jD1Jm4lWO9CBdIMdXgJmIoB-vPn1LUX8J3kCvGIgPLY6EmBW0Yxo6FnUWGXn8BFnBOfOeP5XfGFWNBozOZkxrizro3jTf5MTO4A4863qy6RcWOhvyJtdICkbEVwUQsuCPEE3gG_OU5f7Q-yE-PU3ogmHhthaQeD5grr2hjaHSPMybFATQgbKBGomwFed0UlVm1_dEnBLX2dwc.babNfzbWx2POZ_R7NcwbDMiYvnajld7oASAcJ5YHF3Y&dib_tag=se&keywords=Caffeine%2BEye%2BSerum&qid=1774237071&sprefix=caffeine%2Beye%2Bserum%2Caps%2C412&sr=8-2-spons&aref=gEQAlZTUJN&sp_csd=d2lkZ2V0TmFtZT1zcF9hdGY&th=1",
        },
        {
          "name":
              "Eye Revive Under Eye Serum with Caffeine, Haloxyl, Hyaluronic Acid",
          "image":
              "https://m.media-amazon.com/images/I/41xixR7Jm-L._SL1024_.jpg",
          "link":
              "https://www.amazon.in/Gleuhr-Caffeine-Haloxyl-Hyaluronic-Vitamin/dp/B0F7F46TP8/ref=sxin_14_pa_sp_search_thematic_sspa?content-id=amzn1.sym.7e2c8ac4-9f12-4bcd-9497-a8ae54bc8764%3Aamzn1.sym.7e2c8ac4-9f12-4bcd-9497-a8ae54bc8764&crid=2ICPDC1YB4M8U&cv_ct_cx=Caffeine+Eye+Serum&keywords=Caffeine+Eye+Serum&pd_rd_i=B0F7F46TP8&pd_rd_r=a1624332-0aa7-4ee2-9b73-443dc6c61ca8&pd_rd_w=6KEpS&pd_rd_wg=VMuCD&pf_rd_p=7e2c8ac4-9f12-4bcd-9497-a8ae54bc8764&pf_rd_r=GEWXM9NHCN9X9XM6SQPR&qid=1774237071&sbo=RZvfv%2F%2FHxDF%2BO5021pAnSA%3D%3D&sprefix=caffeine+eye+serum%2Caps%2C412&sr=1-4-66673dcf-083f-43ba-b782-d4a436cc5cfb-spons&aref=CtrPHXfkCn&sp_csd=d2lkZ2V0TmFtZT1zcF9zZWFyY2hfdGhlbWF0aWM&psc=1",
        },
      ];
    }

    if (category == "sunscreens") {
      return [
        {
          "name":
              "Aqualogica Radiance+ Dewy Sunscreen with Watermelon & Niacinamide with SPF 50 & PA++++",
          "image":
              "https://m.media-amazon.com/images/I/61Z0hWsC1cL._SL1200_.jpg",
          "link":
              "https://www.amazon.in/Aqualogica-Sunscreen-Watermelon-Niacinamide-Protection/dp/B0B3MNVPDV/ref=sr_1_5?crid=690EPGQ1IGXC&dib=eyJ2IjoiMSJ9.jbpInrEX2cLQOChXJfF-yi5tOfxFhcmTJWquQ6kgRFG5GqqEmnE40qLDxFaQafznO-HmzFFSUKtV84WS-OnnXkiATuFGrY_m1DzpaGYTeKjrpvlozlRvV0tJgLrtSfvLfNJHgPpoyCkGxaJvOkfBcmAkyOoDFfslw5QX-urlR5ju2lEKQZT3nBKwV3Os0Z4aB4EeFkZomspI-jdxUIua7Yn3uzrqogy8iWCJ_2KXCMxXCaggiP3vDDauGxwpumCvDPB7yd50Ppjim2Z6wIS2p6uU_-BoK21ngRHztuhRFvA.iKg0xOinSg08Rxk6OvFt1q7SWauGvZZpZ_UhUtQGbjw&dib_tag=se&keywords=sunscreen%2Bspf50%2Baqualogica&qid=1774237387&sprefix=sunscreen%2Bspf50%2Ba%2Caps%2C360&sr=8-5&th=1",
        },
      ];
    }

    // Default
    return [
      {
        "name": "YOU ARE NOT BEAUTIFOOL",
        "image": "https://m.media-amazon.com/images/I/61Z0hWsC1cL._SL1200_.jpg",
        "link":
            "https://www.amazon.in/Aqualogica-Sunscreen-Watermelon-Niacinamide-Protection/dp/B0B3MNVPDV/ref=sr_1_5?crid=690EPGQ1IGXC&dib=eyJ2IjoiMSJ9.jbpInrEX2cLQOChXJfF-yi5tOfxFhcmTJWquQ6kgRFG5GqqEmnE40qLDxFaQafznO-HmzFFSUKtV84WS-OnnXkiATuFGrY_m1DzpaGYTeKjrpvlozlRvV0tJgLrtSfvLfNJHgPpoyCkGxaJvOkfBcmAkyOoDFfslw5QX-urlR5ju2lEKQZT3nBKwV3Os0Z4aB4EeFkZomspI-jdxUIua7Yn3uzrqogy8iWCJ_2KXCMxXCaggiP3vDDauGxwpumCvDPB7yd50Ppjim2Z6wIS2p6uU_-BoK21ngRHztuhRFvA.iKg0xOinSg08Rxk6OvFt1q7SWauGvZZpZ_UhUtQGbjw&dib_tag=se&keywords=sunscreen%2Bspf50%2Baqualogica&qid=1774237387&sprefix=sunscreen%2Bspf50%2Ba%2Caps%2C360&sr=8-5&th=1",
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    final products = getProducts();

    return Scaffold(
      appBar: AppBar(title: Text(category)),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Image.network(product['image']!, width: 70),
                  const SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product['name']!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),

                        ElevatedButton(
                          onPressed: () => _openLink(product['link']!),
                          child: const Text("Buy Now"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
