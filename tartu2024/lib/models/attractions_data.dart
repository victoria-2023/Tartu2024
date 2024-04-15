import 'attraction.dart'; // Adjust the import path if necessary

final List<Attraction> attractions = [
  Attraction(
    name: "Tartu Hall Square",
    description:
        "Immerse yourself in the historic charm of Tartu. Stroll through its heart, adorned with magnificent architecture and vibrant ambiance, offering a glimpse into the city's rich cultural heritage.",
    imageUrl:
        "https://visittartu.com/sites/default/files/tartu-raekoda-tarmo-haud.jpg",
    address: "Raekoja plats, 51004 Tartu",
    visitingHours: "9:00 - 18:00",
    directions:
        "Located in the heart of Tartu, easily accessible by public transport.",
    latitude: 58.3803,
    longitude: 26.7236,
    placeId: "PLACE_ID_1",
  ),

  Attraction(
    name: "University of Tartu Museum",
    description:
        "Step into the corridors of Estonia's oldest university and unravel centuries of academic excellence through captivating exhibits and artifacts, promising an enlightening journey through the nation's scholarly legacy.",
    imageUrl:
        "https://muuseum.ut.ee/sites/default/files/styles/max_1300x1300/public/2022-11/_H5A2479.jpg?itok=Uoi0LddW",
    address: "Ülikooli 18, 50090 Tartu, Estonia",
    visitingHours: "10:00 - 17:00, closed on Mondays",
    directions: "Situated atop Toome Hill, a landmark location in Tartu.",
    latitude: 58.3803, // Example latitude
    longitude: 26.7154,
    placeId: "PLACE_ID_2",
  ),
  Attraction(
    name: "Tartu Cathedral",
    description:
        "Discover the haunting beauty of a medieval marvel, where the echoes of history resonate through the Gothic ruins, now transformed into a captivating museum, offering a window into Tartu's past.",
    imageUrl:
        "https://static.visitestonia.com/images/3741023/600_400_false_false_173290493e2c4ed897635210fad9cc78.jpg",
    address: "Lossi 25, Tartu, Estonia",
    visitingHours: "11:00 - 16:00, varies by season",
    directions: "Accessible via Lossi Street, on Toome Hill.",
    latitude: 58.3803, // Example latitude
    longitude: 26.7144,
    placeId: "PLACE_ID_3",
  ),
  Attraction(
    name: "Botanical Gardens of the University of Tartu",
    description:
        "Lose yourself in a botanical wonderland, where thousands of plant species intertwine in a harmonious dance of colors and scents, providing a serene escape in the heart of the city.",
    imageUrl:
        "https://static.visitestonia.com/images/3806297/1600_900_false_false_47b3c3217bb60dcf4668b03bfde7e7b6.jpg",
    address: "Lai 38, 51005 Tartu, Estonia",
    visitingHours: "9:00 - 19:00",
    directions: "Located near the city center, adjacent to the Emajõgi River.",
    latitude: 58.3848, // Example latitude
    longitude: 26.7213,
    placeId: "PLACE_ID_4",
  ),
  Attraction(
    name: "AHHAA Science Centre",
    description:
        "Ignite your curiosity and engage your senses in a world of scientific wonders, where interactive exhibits and awe-inspiring planetarium shows promise an immersive experience for all ages.",
    imageUrl:
        "https://visittartu.com/sites/default/files/vemedia/206197_0e6296c6ba584ce4b0f05b35986e487c.jpg",
    address: "Sadama 1, 51004 Tartu, Estonia",
    visitingHours: "10:00 - 19:00",
    directions:
        "Found in the city's heart, easily reachable from the main square.",
    latitude: 58.2236, // Example latitude
    longitude: 26.4401,
    placeId: "0x46eb36deb312c23b",
  ),
  Attraction(
    name: "Estonian National Museum",
    description:
        "Embark on a captivating journey through Estonia's cultural tapestry, as diverse exhibits and immersive displays unfold the nation's fascinating history and vibrant heritage.",
    imageUrl:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Eesti_Rahva_Muuseumi_peahoone_13.jpg/270px-Eesti_Rahva_Muuseumi_peahoone_13.jpg",
    address: "Muuseumi tee 2, 60532 Tartu, Estonia",
    visitingHours: "10:00 - 18:00, closed on Tuesdays",
    directions:
        "Located on the outskirts of Tartu, accessible by public bus or car.",
    latitude: 58.3958, // Example latitude
    longitude: 26.7463,
    placeId: "PLACE_ID_6",
  ),
  Attraction(
    name: "Toome Hill Park",
    description:
        "Ascend to breathtaking heights and savor panoramic views of Tartu from this historic park, where tranquil paths wind through lush greenery, offering a serene retreat for contemplation and relaxation.",
    imageUrl:
        "https://static.visitestonia.com/images/3536963/600_400_false_false_fca7954859f906147e36b74cc04f6ab7.jpg",
    address: "Toome Hill, Tartu, Estonia",
    visitingHours: "Open 24 hours",
    directions: "Easily reachable from the city center by foot.",
    latitude: 58.3814, // Example latitude
    longitude: 26.7199,
    placeId: "PLACE_ID_7",
  ),
  Attraction(
    name: "Tartu Toy Museum",
    description:
        "Delve into a world of nostalgia and wonder as you explore a charming collection of historic and modern toys, evoking memories and sparking joy for visitors of all ages.",
    imageUrl:
        "https://static.visitestonia.com/images/2977629/1600_900_false_false_3b65f18109bc0fb33a36229eee1d85c7.jpg",
    address: "Lutsu 8, 51006 Tartu, Estonia",
    visitingHours: "11:00 - 18:00, closed on Mondays and Tuesdays",
    directions: "Located in the Old Town, a short walk from the main square.",
    latitude: 58.3814, // Example latitude
    longitude: 26.7199,
    placeId: "PLACE_ID_8",
  ),
  Attraction(
    name: "Tartu Art Museum",
    description:
        "Immerse yourself in the soul-stirring beauty of Estonian art, spanning centuries of creativity and expression, housed within the heart of the Old Town, a treasure trove for art enthusiasts.",
    imageUrl:
        "https://static.visitestonia.com/images/3382254/Tartu+Art+Museum-Visit+Estonia-Tartu+Visitor+Centre+%284%29_.jpg",
    address: "Raekoja plats 18, 51004 Tartu, Estonia",
    visitingHours: "11:00 - 18:00, closed on Mondays",
    directions: "Situated in the heart of the Old Town, in the main square.",
    latitude: 58.3814, // Example latitude
    longitude: 26.7199,
    placeId: "PLACE_ID_9",
  ),
  Attraction(
    name: "Angel’s Bridge",
    description:
        "Cross the threshold into a realm of timeless beauty and architectural grace, as this historic bridge connects the enchanting Toome Hill with the picturesque Old Town, offering vistas that inspire the soul.",
    imageUrl:
        "https://static.visitestonia.com/images/3527806/390_480_false_false_7014fec292b9996e68e137121f7161fa.jpg",
    address: "Angel’s Bridge, Toome Hill, Tartu, Estonia",
    visitingHours: "Open 24 hours",
    directions:
        "Crosses over Lossi Street, connecting the city center to Toome Hill.",
    latitude: 58.3796, // Example latitude
    longitude: 26.7177,
    placeId: "PLACE_ID_10",
  ),
  // Additional attractions
  Attraction(
    name: "Emajõgi River Promenade",
    description:
        "Experience the tranquil beauty of Tartu as you stroll along the banks of the Emajõgi River, where serene waters mirror the city's enchanting skyline, inviting moments of peaceful contemplation.",
    imageUrl:
        "https://static.visitestonia.com/images/3818774/Photo+of+Tartu+City+Centre+by+Tanel+Kindsigo_.jpg",
    address: "Emajõe 1, 51004 Tartu, Estonia",
    visitingHours: "Open 24 hours",
    directions:
        "Accessible from various points in the city center, offering picturesque views.",
    latitude: 58.3814, // Example latitude
    longitude: 26.7199,
    placeId: "PLACE_ID_11",
  ),
  Attraction(
    name: "Tartu City Museum",
    description:
        "Embark on a journey through Tartu's past, as the city museum showcases artifacts and stories that weave together the tapestry of its history, offering insight into its evolution and cultural significance.",
    imageUrl:
        "https://static.visitestonia.com/images/3537658/Tartu+City+Museum+-+visittartu-visitestonia1_.jpeg",
    address: "Ülikooli 1, 51003 Tartu, Estonia",
    visitingHours: "10:00 - 18:00, closed on Mondays",
    directions:
        "Located near the Town Hall Square, easily accessible from the city center.",
    latitude: 58.3814, // Example latitude
    longitude: 26.7199,
    placeId: "PLACE_ID_12",
  ),
  Attraction(
    name: "St. John's Church",
    description:
        "Marvel at the grandeur of St. John's Church, a symbol of Tartu's religious heritage and architectural prowess, where centuries of history are etched into its sacred walls, inviting reverence and contemplation.",
    imageUrl:
        "https://static.visitestonia.com/images/3387767/st-johns-church-visittartu-estonia_.jpg",
    address: "Jaani 5, 51007 Tartu, Estonia",
    visitingHours: "9:00 - 17:00",
    directions:
        "Located in the city center, near the University of Tartu, easily accessible by foot.",
    latitude: 58.3827, // Example latitude
    longitude: 26.7201,
    placeId: "PLACE_ID_13",
  ),

  Attraction(
    name: "Tartu Market Square",
    description:
        "Indulge in the vibrant atmosphere of Tartu Market Square, where bustling stalls offer a cornucopia of local delights, from fresh produce to artisanal crafts, creating a sensory feast for visitors.",
    imageUrl:
        "https://static.visitestonia.com/images/3539409/Tartu+Farmers+Market-Visit-Tartu_.JPG",
    address: "Turuplats 6, 51004 Tartu, Estonia",
    visitingHours: "Varies by market days",
    directions:
        "Located in the city center, adjacent to Tartu Town Hall, easily accessible on foot.",
    latitude: 58.3814, // Example latitude
    longitude: 26.7199,
    placeId: "PLACE_ID_15",
  ),
  Attraction(
    name: "Estonian Sports Museum",
    description:
        "Celebrate the spirit of athleticism at the Estonian Sports Museum, where exhibits honor the nation's sporting heroes and showcase the triumphs and challenges of Estonia's sporting history.",
    imageUrl:
        "https://static.visitestonia.com/images/3705039/Eesti+Spordi-+ja+Ol%C3%BCmpiamuuseum+%2813%29_.jpg",
    address: "Rüütli 15, 51007 Tartu, Estonia",
    visitingHours: "10:00 - 18:00, closed on Mondays",
    directions:
        "Located near the city center, easily accessible from Tartu Cathedral.",
    latitude: 58.3814, // Example latitude
    longitude: 26.7199,
    placeId: "PLACE_ID_16",
  ),
  Attraction(
    name: "Tartu Observatory Museum",
    description:
        "Journey through the annals of scientific discovery at the Tartu Observatory Museum, where astronomical artifacts and exhibits chronicle the institution's legacy of exploration and innovation.",
    imageUrl:
        "https://visittartu.com/sites/default/files/vemedia/2509_745c22a529f534abbc1c9b0a5d27e480.jpg",
    address: "Tõravere 61602, Tartu County, Estonia",
    visitingHours: "10:00 - 17:00, closed on Mondays",
    directions:
        "Located near Tartu Observatory, accessible by car or public transportation.",
    latitude: 58.3814,
    longitude: 26.7199,
    placeId: "PLACE_ID_18",
  ),

  Attraction(
    name: "Tartu Cathedral Bell Tower",
    description:
        "Ascend to new heights and witness panoramic views of Tartu from the historic Cathedral Bell Tower, where the city's skyline unfolds before your eyes, offering a mesmerizing backdrop for memorable moments.",
    imageUrl:
        "https://muuseum.ut.ee/sites/default/files/styles/max_1300x1300/public/2022-11/_H5A5775.jpg?itok=iWBjQjKi",
    address: "Lossi 25, Tartu, Estonia",
    visitingHours: "10:00 - 18:00",
    directions: "Accessible via Lossi Street, adjacent to Tartu Cathedral.",
    latitude: 58.3814,
    longitude: 26.7199,
    placeId: "PLACE_ID_20",
  ),
];
