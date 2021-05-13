class Products{

  String name;
  String description;
  int weight;
  String unit;
  int price;  
  String image;
  int rating;
  String category;

  Products({
    this.name,
    this.description,
    this.weight,
    this.unit,
    this.price,
    this.image,
    this.rating,
    this.category,
  });  

}

// ignore: non_constant_identifier_names
List <Products> Product = [
  Products(
    name: "Sawi",
    description: "Sawi merupakan salah satu jenis sayuran hijau yang baik bagi tubuh karena memiliki kandungan vitamin dan mineral yang dibutuhkan tubuh. Beberapa vitamin yang terkandung dalam sawi Antara lain seperti vitamin B kompleks dalam bentuk asam folat, vitamin A yang berasal dari karoten, vitamin C, dan vitamin K. ",    
    weight: 7,
    unit: "Kilogram",
    price: 90000,
    image: "sawi.jpg",
    rating: 4,
    category: "Sayur"
  ),
  Products(
    name: "Bayam",
    description: "Bayam (Amaranthus) adalah tumbuhan yang biasa ditanam untuk dikonsumsi daunnya sebagai sayuran hijau. Tumbuhan ini berasal dari Amerika tropik namun sekarang tersebar ke seluruh dunia. Tumbuhan ini dikenal sebagai sayuran sumber zat besi yang penting bagi tubuh.",
    weight: 5,
    unit: "Kilogram",
    price: 30000,
    image: "bayam.jpg",
    rating: 4,
    category: "Sayur"
  ),
   Products(
    name: "Klengkeng",
    description: "Lengkeng atau Klengkeng merupakan tanaman hutan yang tingginya dapat mencapai 40 m. Tanaman ini baik untuk mencegah erosi lereng. Daun dan batang. Habitusnya sangat menarik, bentuk kanopi seperti payung. Berdaun rimbun, mirip daun rambutan kapulasan yakni berukuran kecil, panjang (dengan ujung meruncing), dan berwarna hijau gelap.",
    weight: 500,
    unit: "Gram",
    price: 4000,
    image: "klengkeng-kristal.jpg",
    rating: 4,
    category: "Buah"
  ),
   Products(
    name: "Delima",
    description: "Delima (Punica granatum) adalah tanaman buah-buahan yang dapat tumbuh hingga 5–8 m. Tanaman ini diperkirakan berasal dari Iran, namun telah lama dikembangbiakkan di daerah Mediterania. Bangsa Moor memberi nama salah satu kota kuno di Spanyol, Granada berdasarkan nama buah ini. ",
    weight: 2,
    unit: "Kilogram",
    price: 33000,
    image: "delima-merah.jpg",
    rating: 5,
    category: "Buah"
  ),
   Products(
    name: "Jambu Air",
    description: "Jambu air adalah tumbuhan dalam suku jambu-jambuan atau Myrtaceae yang berasal dari Asia Tenggara. Jambu air sebetulnya berbeda dengan jambu semarang (Syzygium samarangense), kerabat dekatnya yang memiliki pohon dan buah hampir serupa. Beberapa kultivarnya bahkan sukar dibedakan, sehingga kedua-duanya kerap dinamai dengan nama umum jambu air atau jambu saja.",
    weight: 1,
    unit: "Kilogram",
    price: 23000,
    image: "jambu-madu.jpg",
    rating: 5,
    category: "Buah"
  ),
   Products(
    name: "Kangkung",
    description: "Kangkung (Ipomoea aquatica Forsk.) adalah tumbuhan yang termasuk jenis sayur-sayuran dan ditanam sebagai makanan. Kangkung banyak dijual di pasar-pasar. Kangkung banyak terdapat di kawasan Asia dan merupakan tumbuhan yang dapat dijumpai hampir di mana-mana terutama di kawasan berair. ",
    weight: 500,
    unit: "Gram",
    price: 10000,
    image: "kangkung.jpg",
    rating: 5,
    category: "Sayur"
  ),
   Products(
    name: "Kubis",
    description: "Kubis, kol, kobis, atau kobis bulat (terdiri dari beberapa kelompok kultivar dari Brassica oleracea) adalah tanaman dua tahunan hijau atau ungu berdaun, ditanam sebagai tanaman tahunan sayuran untuk kepala padat berdaunnya. ",
    weight: 500,
    unit: "Gram",
    price: 5000,
    image: "kubis.jpg",
    rating: 5,
    category: "Sayur"    
  ),
  Products(
    name: "Mangga",
    description: "Mangga atau mempelam adalah nama sejenis buah, demikian pula nama pohonnya. Mangga termasuk ke dalam marga Mangifera, yang terdiri dari 35-40 anggota dari suku Anacardiaceae.",
    weight: 1,
    unit: "Kilogram",
    price: 12000,
    image: "mangga.png",
    rating: 5,
    category: "Buah"    
  ),
];