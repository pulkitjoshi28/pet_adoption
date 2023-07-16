import 'dart:convert';

class PetAdoption {
  final List<Pet> data;

  PetAdoption({
    required this.data,
  });

  factory PetAdoption.fromRawJson(String str) => PetAdoption.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PetAdoption.fromJson(Map<String, dynamic> json) => PetAdoption(
        data: List<Pet>.from(json["data"].map((x) => Pet.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Pet {
  final String id;
  final String name;
  final String pet;
  final int age;
  final String price;
  final String image;
  final String about;
  final bool status;

  Pet({
    required this.id,
    required this.name,
    required this.pet,
    required this.age,
    required this.price,
    required this.image,
    required this.about,
    this.status = false,
  });

  factory Pet.fromRawJson(String str) => Pet.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pet.fromJson(Map<String, dynamic> json) => Pet(
        id: json["id"],
        name: json["name"],
        pet: json["pet"],
        age: json["age"],
        price: json["price"],
        image: json["image"],
        about: json["about"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "pet": pet,
        "age": age,
        "price": price,
        "image": image,
        "about": about,
        "status": status
      };

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'pet': pet,
      'age': age,
      'price': price,
      'image': image,
      'about': about,
      'status': status ? 1 : 0,
    };
  }

  Pet copyWith(
      {String? id,
      String? name,
      String? pet,
      int? age,
      String? price,
      String? image,
      String? about,
      bool? status,
      DateTime? adoptedOn}) {
    return Pet(
        id: id ?? this.id,
        name: name ?? this.name,
        pet: pet ?? this.pet,
        age: age ?? this.age,
        price: price ?? this.price,
        image: image ?? this.image,
        about: about ?? this.about,
        status: status ?? this.status);
  }
}

const petData = {
  "data": [
    {
      "id": "8f2e1196-26d3-4e81-9a3a-7aacb674ae74",
      "name": "Alice",
      "pet": "Cat",
      "age": 8,
      "price": "100",
      "image": "https://images.pexels.com/photos/1170986/pexels-photo-1170986.jpeg",
      "about":
          "Meet Alice: a charming, playful, and affectionate cat eagerly waiting for her forever home. Available for adoption now, Alice promises to bring joy and companionship into your life. Don't miss the chance to make her a part of your family! 🐱❤️ #AdoptAlice #CatLove #ForeverHome",
      "status": false
    },
    {
      "id": "f78c4d5c-6faa-4bbf-8f60-c17faccfc552",
      "name": "Tommy",
      "pet": "Dog",
      "age": 8,
      "price": "300",
      "image": "https://images.pexels.com/photos/1851164/pexels-photo-1851164.jpeg",
      "about":
          "A loyal, gentle, and adorable dog seeking a loving family to call his own. This lovable companion is ready to bring happiness and wagging tails to your home. Adopt Tommy today and experience the unconditional love only a dog can offer! 🐶❤️ #AdoptTommy #DogLove #ForeverHome",
      "status": false
    },
    {
      "id": "131fead2-3e2f-4895-9957-e704c5b77ced",
      "name": "Elvis",
      "pet": "Bird",
      "age": 2,
      "price": "50",
      "image":
          "https://images.pexels.com/photos/2662434/pexels-photo-2662434.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "about":
          "Meet Elvis: a charming and melodious bird with vibrant feathers and a delightful personality. This feathered friend is ready to serenade his way into your heart. Bring the joy of birdsong to your home by adopting Elvis today! 🐦❤️ #AdoptElvis #BirdLove #ForeverHome",
      "status": false
    },
    {
      "id": "edc69f79-915f-4286-8123-c9359be580fd",
      "name": "Mike",
      "pet": "Dog",
      "age": 8,
      "price": "500",
      "image":
          "https://images.pexels.com/photos/3687770/pexels-photo-3687770.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "about":
          "Say hello to Mike: a friendly, playful, and loyal dog eagerly searching for his forever family. With a wagging tail and a heart full of love, Mike is ready to become your new best friend. Don't miss the chance to make him a part of your life! 🐶❤️ #AdoptMike #DogLove #ForeverHome",
      "status": false
    },
    {
      "id": "6cbc104a-9137-4e05-a15d-2cf96b03a30f",
      "name": "Sebastian",
      "pet": "Bird",
      "age": 2,
      "price": "400",
      "image":
          "https://images.pexels.com/photos/792416/pexels-photo-792416.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "about":
          "Meet Sebastian: a colorful and intelligent bird looking for a loving home to spread his wings. With charming chirps and curious antics, he'll captivate your heart. Adopt Sebastian today and bring the enchantment of birdsong into your life! 🐦❤️ #AdoptSebastian #BirdLove #ForeverHome",
      "status": false
    },
    {
      "id": "6634a89d-621c-4297-a033-f212d624c2ab",
      "name": "Lark",
      "pet": "Parrot",
      "age": 11,
      "price": "500",
      "image":
          "https://images.pexels.com/photos/1059823/pexels-photo-1059823.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "about":
          "Introducing Lark: a beautiful and talkative parrot seeking a caring family to share his wit and charm. With vibrant plumage and a lively personality, Lark is sure to add laughter and love to your home. Adopt Lark today and experience the joy of having a clever companion! 🦜❤️ #AdoptLark #ParrotLove #ForeverHome",
      "status": false
    },
    {
      "id": "b69af588-6f87-4fb2-99a6-03bb6a3b1b88",
      "name": "Bella",
      "pet": "Dog",
      "age": 4,
      "price": "350",
      "image":
          "https://images.pexels.com/photos/5255202/pexels-photo-5255202.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "about":
          "Meet Bella, a lively and affectionate dog who adores belly rubs and long walks. With her expressive eyes and wagging tail, she'll be your faithful companion. Adopt Bella now and discover endless happiness! 🐶❤️ #AdoptBella #DogLove #ForeverHome",
      "status": false
    },
    {
      "id": "d9f86e1e-3f90-4c0d-8b0f-b57ca35d7c66",
      "name": "Luna",
      "pet": "Cat",
      "age": 2,
      "price": "150",
      "image":
          "https://images.pexels.com/photos/1302290/pexels-photo-1302290.jpeg?auto=compress&cs=tinysrgb&w=800",
      "about":
          "Luna, the playful and curious cat, is ready to bring a world of joy and mischief to your home. With her sweet purrs and soft cuddles, she'll steal your heart. Don't wait to adopt Luna! 🐱❤️ #AdoptLuna #CatLove #ForeverHome",
      "status": false
    },
    {
      "id": "7908d85f-105b-439a-b1e9-1f267315e909",
      "name": "Thumper",
      "pet": "Rabbit",
      "age": 1,
      "price": "70",
      "image":
          "https://images.pexels.com/photos/4001296/pexels-photo-4001296.jpeg?auto=compress&cs=tinysrgb&w=800",
      "about":
          "Thumper, the adorable and gentle rabbit, will hop his way into your heart. With his inquisitive nature and fluffy fur, he'll make every day brighter. Adopt Thumper today and experience the charm of a bunny friend! 🐰❤️ #AdoptThumper #RabbitLove #ForeverHome",
      "status": false
    },
    {
      "id": "5a5d4cb2-8666-41a3-ae54-1e598d7fb9ee",
      "name": "Kiwi",
      "pet": "Bird",
      "age": 3,
      "price": "60",
      "image":
          "https://images.pexels.com/photos/15284180/pexels-photo-15284180/free-photo-of-close-up-of-bird.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
      "about":
          "Meet Kiwi, the colorful and talkative bird with a quirky personality. Kiwi loves learning new words and showing off tricks. Bring the beauty of avian companionship into your life by adopting Kiwi now! 🐦❤️ #AdoptKiwi #BirdLove #ForeverHome",
      "status": false
    },
    {
      "id": "7dbf1c1c-1327-4759-b4b9-04dd0f80efb0",
      "name": "Rocky",
      "pet": "Dog",
      "age": 5,
      "price": "250",
      "image":
          "https://images.pexels.com/photos/257540/pexels-photo-257540.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "about":
          "Rocky, the brave and playful dog, is always up for an adventure. He's great with kids and other pets, making him the perfect addition to any family. Adopt Rocky today and share unforgettable moments together! 🐶❤️ #AdoptRocky #DogLove #ForeverHome",
      "status": false
    },
    {
      "id": "0909fcd1-581c-4b2b-9090-01372c1eaa20",
      "name": "Whiskers",
      "pet": "Cat",
      "age": 3,
      "price": "120",
      "image":
          "https://images.pexels.com/photos/615369/pexels-photo-615369.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "about":
          "Whiskers, the elegant and graceful cat, enjoys lounging in the sun and receiving gentle pets. Her calming presence will bring tranquility to your home. Don't miss the chance to adopt Whiskers! 🐱❤️ #AdoptWhiskers #CatLove #ForeverHome",
      "status": false
    },
    {
      "id": "4b72da01-5031-4d58-999c-02cf2a26cdd3",
      "name": "Binky",
      "pet": "Rabbit",
      "age": 2,
      "price": "80",
      "image":
          "https://images.pexels.com/photos/14045502/pexels-photo-14045502.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "about":
          "Binky, the adorable and energetic rabbit, loves hopping around and exploring new places. His floppy ears and twitching nose will steal your heart. Adopt Binky now and fill your life with bunny fun! 🐰❤️ #AdoptBinky #RabbitLove #ForeverHome",
      "status": false
    },
    {
      "id": "c57876c1-2004-4a0e-86b5-c3a0e40e6c40",
      "name": "Sunny",
      "pet": "Bird",
      "age": 4,
      "price": "70",
      "image":
          "https://images.pexels.com/photos/2695703/pexels-photo-2695703.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "about":
          "Sunny, the cheerful and sociable bird, loves spending time with humans and singing lovely tunes. Adopt Sunny today and enjoy the delightful melodies he'll bring into your life! 🐦❤️ #AdoptSunny #BirdLove #ForeverHome",
      "status": false
    },
    {
      "id": "4e06fbf3-052e-4e42-983b-76f25f3e2db4",
      "name": "Daisy",
      "pet": "Dog",
      "age": 3,
      "price": "300",
      "image":
          "https://images.pexels.com/photos/1254140/pexels-photo-1254140.jpeg?auto=compress&cs=tinysrgb&w=800",
      "about":
          "Daisy, the sweet and affectionate dog, is a true cuddle bug. Her friendly nature and wagging tail will brighten your days. Adopt Daisy now and experience unconditional love like no other! 🐶❤️ #AdoptDaisy #DogLove #ForeverHome",
      "status": false
    },
    {
      "id": "713f3d11-56c5-414e-a6c3-ecf7ec220344",
      "name": "Milo",
      "pet": "Cat",
      "age": 1,
      "price": "100",
      "image":
          "https://images.pexels.com/photos/617278/pexels-photo-617278.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "about":
          "Milo, the mischievous and playful cat, will keep you entertained with his antics. His adorable meows and playful paws will steal your heart. Adopt Milo today and let the feline fun begin! 🐱❤️ #AdoptMilo #CatLove #ForeverHome",
      "status": false
    },
    {
      "id": "7b6b51f1-5f46-4003-b1d9-6a6c0c1d4c09",
      "name": "Hazel",
      "pet": "Rabbit",
      "age": 3,
      "price": "90",
      "image":
          "https://images.pexels.com/photos/104373/pexels-photo-104373.jpeg?auto=compress&cs=tinysrgb&w=800",
      "about":
          "Hazel, the gentle and curious rabbit, enjoys snuggling and exploring her surroundings. Her fluffy coat and curious eyes make her irresistible. Adopt Hazel today and fill your home with bunny love! 🐰❤️ #AdoptHazel #RabbitLove #ForeverHome",
      "status": false
    },
    {
      "id": "fcdbecec-e4a9-4487-8089-45f5a3ad4c26",
      "name": "Rio",
      "pet": "Bird",
      "age": 6,
      "price": "80",
      "image":
          "https://images.pexels.com/photos/1199792/pexels-photo-1199792.jpeg?auto=compress&cs=tinysrgb&w=800",
      "about":
          "Rio, the vibrant and talkative bird, loves mimicking sounds and showing off his colorful feathers. Adopt Rio today and experience the joy of having a feathered friend! 🐦❤️ #AdoptRio #BirdLove #ForeverHome",
      "status": false
    },
    {
      "id": "240b532a-31ad-4a34-a195-0951e27c1565",
      "name": "Rusty",
      "pet": "Dog",
      "age": 2,
      "price": "350",
      "image":
          "https://images.pexels.com/photos/1805164/pexels-photo-1805164.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "about":
          "Rusty, the playful and energetic dog, enjoys running and playing fetch. With his warm eyes and wagging tail, he'll be a loyal companion. Adopt Rusty now and create wonderful memories together! 🐶❤️ #AdoptRusty #DogLove #ForeverHome",
      "status": false
    },
    {
      "id": "ef5ceea1-ebab-47e6-9aa9-46c45be27b2c",
      "name": "Luna",
      "pet": "Cat",
      "age": 4,
      "price": "130",
      "image":
          "https://images.pexels.com/photos/7149465/pexels-photo-7149465.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "about":
          "Luna, the graceful and gentle cat, loves basking in the sun and observing the world from her perch. Adopt Luna today and bring feline elegance into your life! 🐱❤️ #AdoptLuna #CatLove #ForeverHome",
      "status": false
    }
  ]
};
