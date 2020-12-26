import 'package:fake_app_v1/models/cuisine_model.dart';
import 'package:fake_app_v1/models/dish_model.dart';
import 'package:fake_app_v1/models/dish_review.dart';
import 'package:fake_app_v1/models/ingredient.dart';

final List<Cuisine> fakeAppCuisines = [
  Cuisine(
    name: "China",
    dishes: chineseDishes,
    imagePath: "assets/images/cuisine_images/chinese.jpg",
    thumbnailImagePath: "assets/images/cuisine_images/chinese_small.jpg",
  ),
  Cuisine(
    name: "India",
    dishes: indianDishes,
    imagePath: "assets/images/cuisine_images/indian.jpg",
    thumbnailImagePath: "assets/images/cuisine_images/indian_small.jpg",
  ),
  Cuisine(
    name: "Japón",
    dishes: japaneseDishes,
    imagePath: "assets/images/cuisine_images/japanese.jpg",
    thumbnailImagePath: "assets/images/cuisine_images/japanese_small.jpg",
  ),
  Cuisine(
    name: "Grecia",
    dishes: greekDishes,
    imagePath: "assets/images/cuisine_images/grece.jpg",
    thumbnailImagePath: "assets/images/cuisine_images/grece_small.jpg",
  ),
  Cuisine(
    name: "Bielorrusia",
    dishes: belarusianDishes,
    imagePath: "assets/images/cuisine_images/belarus.jpg",
    thumbnailImagePath: "assets/images/cuisine_images/belarus_small.jpg",
  ),
  Cuisine(
    name: "México",
    dishes: mexicanDishes,
    imagePath: "assets/images/cuisine_images/mexican.jpg",
    thumbnailImagePath: "assets/images/cuisine_images/mexican_small.jpg",
  ),
  Cuisine(
    name: "España",
    dishes: spanishDishes,
    imagePath: "assets/images/cuisine_images/spanish.jpg",
    thumbnailImagePath: "assets/images/cuisine_images/spanish_small.jpg",
  ),
  Cuisine(
    name: "Canada",
    dishes: canadianDishes,
    imagePath: "assets/images/cuisine_images/canada.jpg",
    thumbnailImagePath: "assets/images/cuisine_images/canada_small.jpg",
  ),
  Cuisine(
    name: "Suriname",
    dishes: surinameseDishes,
    imagePath: "assets/images/cuisine_images/surinam.jpg",
    thumbnailImagePath: "assets/images/cuisine_images/surinam_small.jpg",
  ),
  Cuisine(
    name: "Mongolia",
    dishes: mongolianDishes,
    imagePath: "assets/images/cuisine_images/mongolian.jpg",
    thumbnailImagePath: "assets/images/cuisine_images/mongolian_small.jpg",
  ),
  Cuisine(
    name: "Marruecos",
    dishes: marrocanDishes,
    imagePath: "assets/images/cuisine_images/marrocan.jpg",
    thumbnailImagePath: "assets/images/cuisine_images/marrocan_small.jpg",
  ),
  Cuisine(
    name: "Egipto",
    dishes: egiptianDishes,
    imagePath: "assets/images/cuisine_images/egipt.jpg",
    thumbnailImagePath: "assets/images/cuisine_images/egipt_small.jpg",
  ),
  Cuisine(
    name: "Uganda",
    dishes: ugandanDishes,
    imagePath: "assets/images/cuisine_images/uganda.jpg",
    thumbnailImagePath: "assets/images/cuisine_images/uganda_small.jpg",
  ),
  Cuisine(
    name: "Australia",
    dishes: australianDishes,
    imagePath: "assets/images/cuisine_images/australia.jpg",
    thumbnailImagePath: "assets/images/cuisine_images/australia_small.jpg",
  ),
];

final List<Dish> spanishDishes = [
  Dish(
    name: "Pollo pepitoria",
    ingredients: [
      Ingredient(name: "Pollo"),
      Ingredient(name: "Cebolla"),
      Ingredient(name: "Harina de trigo", allergens: ["Gluten"]),
      Ingredient(name: "Dientes de ajo"),
      Ingredient(name: "Azafrán"),
      Ingredient(name: "Vino de Jeréz"),
      Ingredient(name: "Caldo de pollo"),
      Ingredient(name: "Jamón serrano"),
      Ingredient(name: "Almendra molida", allergens: ["Frutos secos"]),
      Ingredient(
          name: "Almendra laminada (por encima)", allergens: ["Frutos secos"]),
      Ingredient(name: "Huevo", allergens: ["Huevo"]),
      Ingredient(name: "Aceite de oliva virgen extra"),
      Ingredient(name: "Sal y pimienta al gusto"),
    ],
    howToEat: "Se puede comer o bien caliente o bien frio, es al gusto.",
    description:
        """Pollo con salsa pepitoria. La salsa consiste de los jugos obtenidos de la preparación de las carnes enriquecidos con yema de huevo duro y almendras molidas.""",
    history:
        """Su origen es dudoso, unos lo ponen en Francia, con el argumento de que la palabra "pepitoria" viene del francés antiguo petite-oie que significa guiso de menudillos de ganso, plato medieval que se realizaba con las partes pequeñas de la oca (menudillos y despojos) y que se llamaba hochepot au petite oie. Pero en España preferimos defender sus orígenes árabes, tanto por el método de cocinado como por parte de sus ingredientes (azafrán y frutos secos).""",
    mainImagePath: "assets/images/dish_images/europe/spain/pollo_pepitoria.jpg",
    thumbnailImagePath:
        "assets/images/dish_images/europe/spain/pollo_pepitoria_small.jpg",
    price: 7.5,
    reviews: [
      DishReview(
        rating: 3.5,
        headline: "Me llego el envase roto",
        createdBy: "Miriam",
        description:
            """El envase estaba roto y se salía la salsa. Un desastre aunque he de decir que me lo volvieron a enviar a los 10 minutos 👍 La salsa de pepitoria era un pelín espesa como a mi me gusta""",
      ),
    ],
  ),
  Dish(
    name: "Paella Mixta",
    ingredients: [
      Ingredient(name: "Arroz tipo bomba"),
      Ingredient(name: "Pollo"),
      Ingredient(name: "Gambones", allergens: ["Pescado"]),
      Ingredient(name: "Mejillones", allergens: ["Pescado"]),
      Ingredient(name: "Mejillones", allergens: ["Pescado"]),
      Ingredient(name: "Judías verdes"),
      Ingredient(name: "Limón"),
      Ingredient(name: "Pimienta"),
      Ingredient(name: "Ajo"),
      Ingredient(name: "Azafrán"),
      Ingredient(name: "Pimiento rojo"),
      Ingredient(name: "Pimiento verde"),
      Ingredient(name: "Cebolla"),
      Ingredient(name: "Tomate"),
      Ingredient(name: "Pimentón dulce"),
      Ingredient(name: "Laurel"),
      Ingredient(name: "Aceite de oliva"),
      Ingredient(name: "Sal"),
    ],
    howToEat: "Caliente o frío. Utilizar un tenedor",
    description:
        """Arroz con verduras, carne y marisco. Gran colorido y sorprendentes sabores""",
    history:
        """Rondaba el año 1238 cuando fue el mismísimo Jaime I quién ordenó que los cultivos de arroz se trasladaran a la periferia de la ciudad de Valencia, él consideraba que dichos cultivos generaban un ambiente poco saludable para las personas, y que en ocasiones estaba dando paso a determinadas enfermedades. Aprovechando la elevada producción de arroz se diseñaron algunas recetas, una de ellas la paella""",
    mainImagePath: "assets/images/dish_images/europe/spain/paella_mixta.jpg",
    thumbnailImagePath:
        "assets/images/dish_images/europe/spain/paella_mixta_small.jpg",
    price: 8.20,
    reviews: [
      DishReview(
        rating: 4,
        headline: "Tradicional",
        createdBy: "Daniel",
        description:
            """Todo un clásico diría yo, lo bueno es que a mi familia le encanta""",
      ),
    ],
  ),
  Dish(
    name: "Marmitako de salmón al azafrán",
    ingredients: [
      Ingredient(name: "Salmón"),
      Ingredient(name: "Patatas"),
      Ingredient(name: "Cebolla"),
      Ingredient(name: "Pimiento verde"),
      Ingredient(name: "Tomate"),
      Ingredient(name: "Calabacín"),
      Ingredient(name: "Berenjena"),
      Ingredient(name: "Fumet de pescado", allergens: ["Pescado"]),
      Ingredient(name: "Aceite"),
      Ingredient(name: "Sal"),
      Ingredient(name: "Tomate triturado"),
      Ingredient(name: "Azafrán"),
    ],
    howToEat: "Caliente. Consumir el marmitako con cucharara",
    description:
        """Plato a base de patatas, salmón y verduras. Ligero, nutritivo y sabroso    """,
    history:
        """El origen del marmitako se encuentra en los barcos vascos de pesca. Antaño, en el barco, el cocinero disponía de pocos elementos para preparar la comida, así que pescado, unas patatas y poco más era suficiente para mantener a la tripulación. Su nombre proviene de la palabra marmita que es el recipiente donde se preparaba el marmitako a bordo. Este sencillo plato, es uno de los más populares dentro de la gastronomía vasca    """,
    mainImagePath:
        "assets/images/dish_images/europe/spain/marmitaco_de_salmon_al_azafran.jpg",
    thumbnailImagePath:
        "assets/images/dish_images/europe/spain/marmitaco_de_salmon_al_azafran_small.jpg",
    price: 5.2,
  ),
];
List<Dish> greekDishes = [
  Dish(
    name: "Moussakas",
    ingredients: [
      Ingredient(name: "Berenjena"),
      Ingredient(name: "Carne picada"),
      Ingredient(name: "Cebolla"),
      Ingredient(name: "Zanahoria"),
      Ingredient(name: "Tomate"),
      Ingredient(name: "Queso parmesano", allergens: ["Leche"]),
      Ingredient(
          name: "Salsa bechamel",
          allergens: ["Gluten", "Leche", "Frutos secos"]),
      Ingredient(name: "Patata"),
      Ingredient(name: "Vino tinto"),
      Ingredient(name: "Caldo de carne"),
      Ingredient(name: "Tomillo"),
      Ingredient(name: "Sal"),
      Ingredient(name: "Pimienta"),
    ],
    howToEat: "Caliente.Usar tenedor y cuchillo",
    description:
        """Consiste de capas de carne picada de cordero, berenjena en rebanadas, y tomate, cubierto de una salsa bechamel y horneado. El plato más típico de Grecia""",
    history:
        """La musaka debe su origen a los árabes y a su introducción de la berenjena en la zona durante la época medieval. Muchos historiadores coinciden en que podría proceder del musakhkhan, un plato árabe muy similar que apareció por primera vez en un libro de cocina de Bagdad del siglo XIII. Tal y como la conocemos hoy en día, data de principios del siglo XX, concretamente de 1910, cuando Nikolaos Tselementes, célebre y afamado chef griego nacido en la isla de Sifno publicó un libro de recetas de cocina. En un intento de europeizar el plato original (una simple pero deliciosa combinación de carne y vegetales), el chef griego añadió salsa de besamel en la parte superior de sus capas. Su versión de la musaka es la que la mayor parte de los griegos cocinan actualmente y la que han exportado al resto del mundo""",
    mainImagePath: "assets/images/dish_images/europe/greece/Moussaka.jpg",
    thumbnailImagePath:
        "assets/images/dish_images/europe/greece/Moussaka_small.jpg",
    price: 11,
    reviews: [
      DishReview(
        rating: 4.5,
        headline: "Casero y menos grasiento",
        createdBy: "Dolores",
        description:
            """He probado mucho Moussakas en diferentes restaurantes y puedo decir que este es un tanto diferente. En mi opinión tiene sabor a casero y es menos grasiento que los de restaurante""",
      ),
    ],
  ),
  Dish(
    name: "Yemistá",
    ingredients: [
      Ingredient(name: "Tomates maduros"),
      Ingredient(name: "Ajo"),
      Ingredient(name: "Cebolla"),
      Ingredient(name: "Calabacín"),
      Ingredient(name: "Berenjena"),
      Ingredient(name: "Queso parmesano", allergens: ["Leche"]),
      Ingredient(
          name: "Salsa bechamel",
          allergens: ["Gluten", "Leche", "Frutos secos"]),
      Ingredient(name: "Patata"),
      Ingredient(name: "Vino tinto"),
      Ingredient(name: "Caldo de carne"),
      Ingredient(name: "Tomillo"),
      Ingredient(name: "Sal"),
      Ingredient(name: "Pimienta"),
      Ingredient(name: "Aceite de oliva"),
      Ingredient(name: "Perejil"),
      Ingredient(name: "Hierbabuena"),
      Ingredient(name: "Pimentón dulce"),
      Ingredient(name: "Azúcar"),
      Ingredient(name: "Agua"),
    ],
    howToEat: "Caliente, cortar con tenedor y cuchillo",
    description:
        """Es un plato de la cocina griega consistente en tomates y pimientos rellenos de arroz y especias, y cocidos en el horno""",
    history:
        """Este plato utiliza los ingredientes que eran comunes en la zona de Grecia. El término yemistá en griego significa relleno, el cual va muy acorde con este plato. En su origen, los griegos preferían tomar este plato en verano, porque es la época en que más fresca se encuentra la verdura""",
    mainImagePath: "assets/images/dish_images/europe/greece/Yemitsa.jpg",
    thumbnailImagePath:
        "assets/images/dish_images/europe/greece/Yemitsa_small.jpg",
    isSoldInUnits: true,
    price: 1.20,
    reviews: [
      DishReview(
        rating: 5,
        headline: "Diferente",
        createdBy: "Ariel",
        description:
            """No había probado algo parecido anteriormente. Me sorprendió bastante la mezcla de especias""",
      ),
    ],
  ),
  Dish(
    name: "Pastitsio",
    ingredients: [
      Ingredient(name: "Pasta tipo macarrones"),
      Ingredient(name: "Carne picada"),
      Ingredient(name: "Tomate triturado"),
      Ingredient(name: "Cebolla"),
      Ingredient(name: "Mantequilla", allergens: ["Leche"]),
      Ingredient(name: "Vino blanco"),
      Ingredient(name: "Queso parmesano", allergens: ["Leche"]),
      Ingredient(
          name: "Salsa bechamel",
          allergens: ["Gluten", "Leche", "Frutos secos"]),
      Ingredient(name: "Aceite de oliva"),
      Ingredient(name: "Sal"),
      Ingredient(name: "Pimienta"),
      Ingredient(name: "Orégano"),
    ],
    howToEat: "Caliente, cortar con tenedor y cuchillo",
    description:
        """El Pastitsio es un plato en varias capas. Existen distintas variantes, nosotros ofrecemos la versión donde la parte superior vienen los famosos bucatini unidos con queso; la segunda capa es de carne picada de ternera con salsa de tomate y canela; la tercera consiste en una capa de pasta con salsa hecha de harina y huevo con una bechamel.""",
    history:
        """La pasta conocida como macarrones proviene de la Antigua Grecia, del banquete fúnebre que según los Ritos Orféicos se ofrecía en honor al difunto o makaritis (μακαρίτης). Incluso hoy en día, después del entierro, los familiares y amigos del difunto comparten una comida elaborada con pasta.
Claro, fue Marco Polo quien trajo la técnica de los fideos chinos a Venecia (1292), pero estos fideos se elaboraban con harina de arroz y de frijol chino. Sin embargo, los venecianos imitaron y elaboraron estos fideos con la receta de los macarrones que habían heredado de los romanos, que a su vez habían adoptado de los griegos.
No es un cuento, ni una broma, y así lo refleja en su definición de macarrón, el Diccionario de la Lengua Española (RAE).""",
    mainImagePath: "assets/images/dish_images/europe/greece/Pastitsio.jpg",
    thumbnailImagePath:
        "assets/images/dish_images/europe/greece/Pastitsio_small.jpg",
    price: 7.30,
  ),
];
List<Dish> belarusianDishes = [
  Dish(
    name: "Draniki",
    ingredients: [
      Ingredient(name: "Patatas"),
      Ingredient(name: "Cebolla"),
      Ingredient(name: "Harina", allergens: ["Gluten"]),
      Ingredient(name: "Huevos", allergens: ["Huevo"]),
      Ingredient(name: "Sal"),
      Ingredient(name: "Pimienta"),
    ],
    howToEat: "Caliente. Usar tenedor y cuchillo",
    description:
        """Tortitas saladas de patatas rayadas , harina y huevo al estilo Bielorruso. Uno de los platos más tradicionales Bielorruso""",
    history:
        """Draniki es un plato bielorruso de las patatas. Conduce la historia del comienzo del siglo XIX, y la receta de su preparación era copiada de los alemanes. Ya que el clima y el suelo de Bielorrusia se encontraban muy favorables para la cultivación de las patatas, esta hortaliza fue más popular en este país. En todas partes "bulba" se encontraba a la reina del refectorio diario y cualquier holgorio""",
    mainImagePath: "assets/images/dish_images/europe/belarus/Draniki.jpg",
    thumbnailImagePath:
        "assets/images/dish_images/europe/belarus/Draniki_small.jpg",
    price: 1,
    reviews: [
      DishReview(
        rating: 5,
        headline: "La salsa ágria es un puntazo",
        createdBy: "Carlos",
        description:
            """Buen aperitivo. Nunca había probado la salsa ágria blanca y me pareció un acierto. Pensé que sabría amarga pero para nada.""",
      ),
    ],
  ),
  Dish(
    name: "Tsibriki (10 unidades)",
    ingredients: [
      Ingredient(name: "Patatas"),
      Ingredient(name: "Harina", allergens: ["Gluten"]),
      Ingredient(name: "Manteca de cerdo"),
      Ingredient(name: "Crema agria", allergens: ["Leche"])
    ],
    howToEat: "Caliente",
    description:
        """Bolitas de patata con manteca y salsa ágria. Muy recomendables como aperitivo. Debido a su pequeño tamaño y textura crujiente, estas "tater tots" bielorrusas son un bocadillo favorito tanto para jóvenes como para adultos y, a pesar de su apariencia simplista, dejan una impresión memorable en muchos extranjeros""",
    history:
        """La cocina bielorrusa es famosa por los platos de patata y Tsibriki es uno de ellos. los ayunos prolongados que prescriben la abstinencia de carne y otros tipos de alimentos de origen animal explican por qué la cocina rusa incluye muchos platos vegetarianos. La patata es una hortaliza que crece en las temperaturas duras de Bielorrusia, de ahí que muchos de los platos lleven la patata como elemento principal""",
    mainImagePath: "assets/images/dish_images/europe/belarus/Tsibriki.jpg",
    thumbnailImagePath:
        "assets/images/dish_images/europe/belarus/Tsibriki_small.jpg",
    price: 4.5,
  ),
  Dish(
    name: "Nalitsniki 5 uds.",
    ingredients: [
      Ingredient(name: "Harina de trigo", allergens: ["Gluten"]),
      Ingredient(name: "Huevos", allergens: ["Huevo"]),
      Ingredient(name: "Mantequilla", allergens: ["Leche"]),
      Ingredient(name: "Leche", allergens: ["Leche"]),
      Ingredient(name: "Requesóno", allergens: ["Leche"]),
      Ingredient(name: "Crema agria", allergens: ["Leche"]),
      Ingredient(name: "Azucar"),
      Ingredient(name: "Pasas"),
      Ingredient(name: "Miel"),
    ],
    howToEat: "Caliente o fría",
    description:
        """Los nalistniki son crepes rellenas de queso, miel y un poco de salsa agria. ¡Combinación para atrevidos!""",
    history:
        """Un plato muy ligado a los ritos populares y las costumbres antiguas de Bielorrusia. Las tradiciones sacras especiales están asociadas con las crepes en varias regiones del país . Las crepes eran un plato obligatorio durante la conmemoración de los muertos o el culto a los antepasados""",
    mainImagePath: "assets/images/dish_images/europe/belarus/Nalistniki.jpg",
    thumbnailImagePath:
        "assets/images/dish_images/europe/belarus/Nalistniki_small.jpg",
    price: 4.5,
    reviews: [
      DishReview(
        rating: 3.5,
        headline: "Solo me llegaron 4 crepes",
        createdBy: "Sara",
        description:
            """Se equivocaron y tan solo me llegaron 4 crepes en vez de 5. Lo bueno es que me solucionaron el problema y me volvieron a enviar otro en 15 minutos 🙂""",
      ),
    ],
  ),
];

final List<Dish> japaneseDishes = [
  Dish(
    name: "Okonomiyaki",
    price: 7.5,
    description:
        """Consiste en la masa de harina, huevo y repollo, y aquí ofrecemos la versión más básica con la carne de cerdo. La salsa Otafuku, es la popular salsa de oeste de Japón que lleva tomate, dátiles, cebolla, shiitake, vinagre, azúcar y muchas verduras más. El sabor de Otafuku es el sabor de Osaka.""",
    history:
        """El Okonomiyaki es muy conocido como la "Tortilla Japonesa" o la "Pizza Japonesa". Una caracteristica del Okonomiyaki es que se prepara con todo tipo de ingredientes, de hecho su nombre okonomiyaki significa «lo que te guste, a la plancha».

Es un plato típico de la zona de Osaka e Hiroshima, donde hay muchos restaurantes que lo preparan directamente frente al comensal. Este popular plato en Japón y cada vez más conocido en el resto del mundo, es denominado por muchos como pizza japonesa o tortilla japonesa.

Hiroshima alberga un museo dedicado a esta variedad gastronómica, el Wood Egg Okonomiyaki, donde los visitantes pueden aprender los secretos de la preparación del Okonomiyaki, además de degustarlo en sus diferentes variantes. Este plato es todo un emblema de Japón""",
    ingredients: [
      Ingredient(name: "Harina de trigo", allergens: ["Gluten"]),
      Ingredient(name: "Carne de cerdo en laminas muy finas"),
      Ingredient(name: "Repollo"),
      Ingredient(name: "Huevo", allergens: ["Huevo"]),
      Ingredient(name: "Levadura de repostería"),
      Ingredient(name: "Polvo de dashi (caldo japones)"),
      Ingredient(name: "Mayonesa", allergens: ["Huevo"]),
      Ingredient(name: "Salsa Otafuku", allergens: ["Gluten", "Soja"]),
      Ingredient(name: "Aonori (Tipo de alga nori)"),
      Ingredient(name: "Viruta de bonito seco", allergens: ["Pescado"]),
      Ingredient(name: "Benishoga (Encurtido de jengibre)"),
      Ingredient(name: "Sal"),
      Ingredient(name: "Agua"),
    ],
    howToEat: "El Okonomiyaki se come caliente. Se puede cortar como si fuese"
        " una pizza o una tortilla. Intenta atrapar todos los ingredientes"
        " espolvoreados por encima para obtener un bocado con el máximo sabor.",
    mainImagePath: "assets/images/dish_images/asia/japan/okonomiyaki.jpg",
    thumbnailImagePath:
        "assets/images/dish_images/asia/japan/okonomiyaki_small.jpg",
    reviews: [
      DishReview(
        rating: 5,
        headline: "Sabor super intenso",
        createdBy: "Casandra",
        description:
            """Me sorprendió mucho el sabor intenso del Okonomiyaki. Si eres atrevido y te gustan lo sabores fuertes asiáticos te lo recomiendo""",
      ),
    ],
  ),
  Dish(
    name: "Onigiri",
    isSoldInUnits: true,
    description:
        """Bola de arroz con polvos de ciruela japonesa. Es ligeramente acido, salado y muy aromático, el sabor único que representa la sutileza de la comida japonesa. Cubierta con alga nori para darle más sabor.""",
    history:
        """Onigiri es uno de los soul foods de Japón. Como si fuese un bocata, los japoneses los llevan por todas partes.

La bola de arroz está formada con algo salado o acido que impide el deterioro del arroz y consigue una conservación de larga duración. Aquí ofrecemos con la versión de Yukari. Es el polvo hecho con la hoja de ciruela japonesa. Es ligeramente acido, salado y muy aromático, el sabor único que representa la sutileza de la comida japonesa.""",
    price: 2.25,
    mainImagePath: "assets/images/dish_images/asia/japan/onigiri.jpg",
    thumbnailImagePath:
        "assets/images/dish_images/asia/japan/onigiri_small.jpg",
    howToEat:
        "Se puede comer caliente o frio. Se come con las manos, solamente tienes que cubrir el arroz con la alga nori y comertelo como si fuese un bocata.",
    ingredients: [
      Ingredient(name: "Arroz"),
      Ingredient(name: "Yukari (Ciruela japonesa)"),
      Ingredient(name: "Alga nori"),
      Ingredient(name: "Sal"),
    ],
    reviews: [
      DishReview(
        rating: 4.5,
        headline: "Son una monada",
        createdBy: "Verónica",
        description:
            """Son una auténtica monada!! Son como triangulitos de arroz envueltos en un alga. Me zampé 4 yo sola 🤭""",
      ),
    ],
  ),
  Dish(
    name: "Pollo frito estilo Japonés",
    isSoldInUnits: true,
    description:
        """El pollo se marina previamente en una mezcla de salsa de soja japonesa, jengibre y ajo y posteriormente se enharina antes de freírlo. quedando una fritura muy ligera y deliciosa. Es crujiente por fuera y jugoso por dentro. Frío o caliente, gracias a la carne marinada, es muy sabroso.""",
    history:
        """La carne se dio a conocer en Japón a finales del siglo XIX. Debido a un contexto religioso, el ganado era indispensable y muy valioso como animal de granja, por lo que estaba prohibido incluir la carne en la dieta. No se consumió carne hasta el año 1877 cuando 558 restaurantes de “gyunabe”, carne de res guisada en el sartén, abrieron en Tokio. Este hecho fue visto como uno de los movimientos de occidentalización de Japón.

Los platillos de carne se hicieron muy populares junto a “la cultura del Sukiyaki“. En la ciudad vanguardista de Kyoto, en el año 1940, se tenía la costumbre de comer “sukiyaki” contribuyendo al aumento de la demanda de carne. Mientras tanto, la automatización se estaba instalando en la producción de ganado. En este momento, el objetivo se centró en mejorar la especie para conseguir una carne más grande y con mejor sabor.

Por otro lado, la carne “yamato-ni” enlatada, carne guisada con salsa de soya, ayudó a la aceleración del uso de la carne en la cocina de todo Japón. Esta carne es muy apreciada, tanto en los hogares, como fuera de ellos como una comida práctica, ya elaborada y muy sabrosa.""",
    mainImagePath: "assets/images/dish_images/asia/japan/pollo_jp.jpg",
    thumbnailImagePath:
        "assets/images/dish_images/asia/japan/pollo_jp_small.jpg",
    price: 2.5,
    howToEat: "Puedes comerlo frio o caliente, como más te guste.",
    ingredients: [
      Ingredient(name: "Contramuslo de pollo"),
      Ingredient(name: "Salsa de soja", allergens: ["Soja"]),
      Ingredient(name: "Azucar"),
      Ingredient(name: "Jenjibre"),
      Ingredient(name: "Ajo"),
      Ingredient(name: "Aceite de sesamo"),
      Ingredient(name: "Harina", allergens: ["Gluten"]),
      Ingredient(name: "Aceite de girasol (para freir)"),
    ],
  ),
];

List<Dish> chineseDishes = [
  Dish(
    name: "Pastel de luna",
    ingredients: [
      Ingredient(name: "Patatas"),
      Ingredient(name: "Cebolla"),
      Ingredient(name: "Harina", allergens: ["Gluten"]),
      Ingredient(name: "Huevos", allergens: ["Huevo"]),
      Ingredient(name: "Sal"),
      Ingredient(name: "Pimienta"),
    ],
    howToEat: "Frío, cortar con tenedor y cuchillo",
    description:
        """El pastel de luna es un dulce chino que se consume tradicionalmente en la Fiesta del Medio Otoño, una de las más importantes de China. Es un pastel que contiene coco, albaricoque, dátiles y uvas pasas. ¡Muy ricos!""",
    history:
        """A finales de la dinastía Yuan, el ejército que lideraba Zhu Yuanzhang planeó derrocar al régimen de los mongoles a través de una rebelión. Utilizaban los pasteles para transmitir mensajes. Al abrir los pasteles, se encontraban las cartas secretas escondidas en su interior. Y de esta forma, los soldados consiguieron tener éxito. Como esta sublevación sucedió un 15 de agosto, a partir de entonces, la gente empezó a comer pasteles de luna en el Festival de Medio Otoño.""",
    isSoldInUnits: true,
    mainImagePath: "assets/images/dish_images/asia/china/Pastel_de_Luna.jpg",
    thumbnailImagePath:
        "assets/images/dish_images/asia/china/Pastel_de_Luna_small.jpg",
    price: 3,
  ),
  Dish(
    name: "Pollo Kung Pao",
    ingredients: [
      Ingredient(name: "Pollo"),
      Ingredient(name: "Maicena"),
      Ingredient(name: "Soja", allergens: ["Soja"]),
      Ingredient(name: "Vinagre de arroz"),
      Ingredient(name: "Cebolleta"),
      Ingredient(name: "Ajo"),
      Ingredient(name: "Apio", allergens: ["Apio"]),
      Ingredient(name: "Jengibre"),
      Ingredient(name: "Pimienta de Sichuan"),
      Ingredient(name: "Guindilla seca"),
      Ingredient(name: "Aceite de sésamo"),
      Ingredient(name: "Aceite de oliva"),
      Ingredient(name: "Tallos de cebollino"),
      Ingredient(name: "Salsa de soja", allergens: ["Soja"]),
      Ingredient(name: "Caldo de pollo"),
      Ingredient(name: "Azúcar moreno"),
      Ingredient(name: "Anacardos", allergens: ["Frutos secos"])
    ],
    howToEat: "Caliente, comer con palillo chinos o con tenedor en su defecto",
    description: """Pollo con verduras originario de la provincia de Sichuan""",
    history:
        """Es un plato clásico de la cocina Sichuan, originario de la provincia de Sichuan en la parte central al oeste de China. El plato se nombra en honor de Ding Baozhen, un oficial de la época tardía de la Dinastía Qing. Se dice que a Ding Baozhen le encantaba comer cierto plato de pollo troceado picante, y según algunas fuentes él mismo llevó la receta que habría aprendido en Guizhou, su provincia natal, quizá de un restaurante local. La receta, con sus variaciones, se extendió por todo Sichuán con el nombre de Gong Bao, del que derivaría Kung Pao""",
    mainImagePath: "assets/images/dish_images/asia/china/Pollo_kung_pao.jpg",
    thumbnailImagePath:
        "assets/images/dish_images/asia/china/Pollo_kung_pao_small.jpg",
    price: 6.50,
  ),
  Dish(
    name: "Jiaozi 8 unidades",
    ingredients: [
      Ingredient(name: "Langostinos"),
      Ingredient(name: "Carne de cerdo picada"),
      Ingredient(name: "Col china"),
      Ingredient(name: "Shiitake"),
      Ingredient(name: "Jengibre rallado"),
      Ingredient(name: "Salsa de ostras", allergens: ["Pescado"]),
      Ingredient(name: "Salsa de soja", allergens: ["Soja"]),
      Ingredient(name: "Vino de arroz"),
      Ingredient(name: "Aceite de sésamo"),
      Ingredient(name: "Maicena"),
      Ingredient(name: "Pimienta blanca"),
      Ingredient(name: "Azúcar"),
      Ingredient(name: "Sal"),
    ],
    howToEat: "Caliente, consumir con palillos chinos o con tenedor",
    description:
        """Tipo de dumpling o ravioli típico de la cocina china relleno de langostino, cerdo y col""",
    history:
        """Su historia se data a la dinastía Han, de unos 2 mil años atrás. En esa época, el pueblo chino ya empezaba a tomar una comida llamada Hundun, nombre que viene de una palabra filosófica china que significa "no tiene una forma fija y no hay agugeros en su envuelta". El método de prepararlo es envolver los rellenos con una envuelta delgada de arena de trigo y hervirlo con agua. Luego, más o menos en el siglo VI, la gente que vivía en el norte del país realizó algunas renovaciones al Hundun, se aumentan el volumen de los rellenos, se los da una forma de media luna y se los toman sin la sopa. Así nacieron los verdaderos jiaozis chinos""",
    mainImagePath: "assets/images/dish_images/asia/china/Jiozi.jpg",
    thumbnailImagePath: "assets/images/dish_images/asia/china/Jiozi_small.jpg",
    price: 5.50,
  ),
];
List<Dish> indianDishes = [
  Dish(
    name: "Samosa (8 uds)",
    ingredients: [
      Ingredient(name: "Pechuga de pollo picada"),
      Ingredient(name: "Cebolla"),
      Ingredient(name: "Ajo"),
      Ingredient(name: "Comino"),
      Ingredient(name: "Curry"),
      Ingredient(name: "Jengibre rallado"),
      Ingredient(name: "Cúrcuma"),
      Ingredient(name: "Cilantro"),
      Ingredient(name: "Aceite de oliva"),
      Ingredient(name: "Chile troceado"),
      Ingredient(name: "Sal"),
      Ingredient(name: "Harina de trigo", allergens: ["Gluten"]),
      Ingredient(name: "Harina para amasar", allergens: ["Gluten"])
    ],
    howToEat: "Caliente, consumir con tenedor y cuchillo o con las manos",
    description:
        """Las samosas son unas empanadillas de forma triangular típicas de la cocina india. Se preparan con una masa muy fina similar a la pasta filo, que al freírla queda muy crujiente. Están rellenas de verdura""",
    history:
        """El origen de la samosa se remonta hasta hace más de mil años, pues hay constancia de su existencia en antiguos libros de cocina que datan del siglo X, donde se refieren a ellas como sanbusak. Se estima que su popularidad se fue extendiendo a lo largo de las rutas comerciales entre la zona central y la zona meridional de Asia gracias a la sencillez de su preparación y su fácil conservación: los comerciantes podían hacer un descanso en el camino para elaborarlas alrededor de un fuego y almacenarlas para comer posteriormente durante los días de viaje siguientes""",
    mainImagePath: "assets/images/dish_images/asia/india/Samosa.jpg",
    thumbnailImagePath: "assets/images/dish_images/asia/india/Samosa_small.jpg",
    price: 7.50,
    reviews: [
      DishReview(
        rating: 4.5,
        headline: "muy cucos",
        createdBy: "Teresa",
        description:
            """Los triangulitos me parecieron muy bonitos. No apto para paladares blandos, el sabor del relleno es bastante intenso!""",
      ),
    ],
  ),
  Dish(
    name: "Pollo Tikka Masala",
    ingredients: [
      Ingredient(name: "Pollo"),
      Ingredient(name: "Arroz"),
      Ingredient(name: "Jengibre molido"),
      Ingredient(name: "Cúrcuma"),
      Ingredient(name: "Sal"),
      Ingredient(name: "Semillas de cilantro"),
      Ingredient(name: "Comino molido"),
      Ingredient(name: "Cayena"),
      Ingredient(name: "Limón"),
      Ingredient(name: "Yogur", allergens: ["Leche"]),
      Ingredient(name: "Cebolla"),
      Ingredient(name: "Garam masala (mezcla de especias)"),
      Ingredient(name: "Concentrado de tomate"),
      Ingredient(name: "Leche de coco"),
      Ingredient(name: "Cilantro"),
    ],
    howToEat: "Caliente, consumir con tenedor o cuchara",
    description:
        """Pollo marinado en salsa de yogur, Garam Massala y otras especias""",
    history:
        """Entre los lejanos 50 y 70 en un restaurante hindú llamado Shish Mahal, un cliente pidió pollo Tikka pero lo devolvió al argumentar que estaba demasiado seco, sugiriendo una salsa. La historia cuenta que los cocineros se apresuraron para cocinar una salsa que contenía tomate, yogur, nata y especias entre otros ingredientes. De ahí nació el Pollo Tikka Masala""",
    mainImagePath:
        "assets/images/dish_images/asia/india/Pollo_Tikka_Massala.jpg",
    thumbnailImagePath:
        "assets/images/dish_images/asia/india/Pollo_Tikka_Massala_small.jpg",
    price: 10,
  ),
  Dish(
    name: "Jalebi",
    ingredients: [
      Ingredient(name: "Harina de trigo", allergens: ["Gluten"]),
      Ingredient(name: "Harina de arroz"),
      Ingredient(name: "Yogur natural", allergens: ["Leche"]),
      Ingredient(name: "Levadura"),
      Ingredient(name: "Aceite de oliva"),
      Ingredient(name: "Colorante amarillo"),
      Ingredient(name: "Agua"),
      Ingredient(name: "Azúcar"),
      Ingredient(name: "Azafrán"),
    ],
    howToEat: "Caliente o frío, comer con tenedor o con la mano",
    description: """Dulce típico indio con forma de pretzel""",
    history:
        """Fue introducido en la India por los invasores persas que hablaban turco, A partir del siglo XV ya existen documentos que hablan de la receta que en aquellos años era conocida como Kundalika. A pesar de ser muy popular en los países árabes y de Asia occidental, es en la India donde el Jalebi que conocemos toma su forma, ellos fueron los que le dieron esa silueta y su consistencia crujiente""",
    mainImagePath: "assets/images/dish_images/asia/india/Jalebi.jpg",
    thumbnailImagePath: "assets/images/dish_images/asia/india/Jalebi_small.jpg",
    price: 4.50,
    reviews: [
      DishReview(
        rating: 5,
        headline: "Riquísimo",
        createdBy: "Adolfo",
        description: """Me los comí todos en 5 minutos, buenísimo!""",
      ),
    ],
  ),
];
List<Dish> mongolianDishes = [
  Dish(
    name: "Khuushuur (4 uds)",
    ingredients: [
      Ingredient(name: "Harina de trigo", allergens: ["Gluten"]),
      Ingredient(name: "Carne de cordero picada"),
      Ingredient(name: "Cebolla picada"),
      Ingredient(name: "Ajo"),
      Ingredient(name: "Sal"),
      Ingredient(name: "Pimiento"),
    ],
    howToEat: "Caliente, consumir con tenedor y cuchillo o con la mano",
    description:
        """Empanadilla típica de Mongolia rellena de carne y verduras. Difícil de encontrar en restaurantes""",
    history:
        """En los tiempos en que Mongolia pertenecía a la Union Soviética, esta comenzó influenciar en su gastronomía y hasta el día de hoy, gran parte de los países ex URSS, comparten platos y bebidas típicas. En Mongolia, uno de estos platos de origen ruso es el Khuushuur""",
    mainImagePath: "assets/images/dish_images/asia/mongolia/khuushuur.jpg",
    thumbnailImagePath:
        "assets/images/dish_images/asia/mongolia/khuushuur_small.jpg",
    price: 4,
  ),
  Dish(
    name: "Khorkhog",
    ingredients: [
      Ingredient(name: "Cordero"),
      Ingredient(name: "Zanahoria"),
      Ingredient(
        name: "Cebolla",
      ),
      Ingredient(name: "Repollo"),
      Ingredient(name: "Patatas"),
      Ingredient(name: "Lechuga"),
      Ingredient(name: "Alcaravea"),
      Ingredient(name: "Sal"),
      Ingredient(name: "Pimienta"),
    ],
    howToEat: "Caliente, consumir con cuchillo y tenedor",
    description:
        """Barbacoa de cordero con verduras. Plato muy tradicional mongolés""",
    history:
        """El khorkhog es una receta que crearon los nómadas y que no se encuentra mucho en las ciudades. Se trata de un platillo que nunca se sirve en restaurantes, ni siquiera en Ulan-Bator. Se rumorea que era la comida preferida de Genghis Khan""",
    mainImagePath: "assets/images/dish_images/asia/mongolia/khorkhog.jpg",
    thumbnailImagePath:
        "assets/images/dish_images/asia/mongolia/khorkhog_small.jpg",
    price: 11,
    reviews: [
      DishReview(
        rating: 5,
        headline: "Me recuerda a las barbacoas en familia",
        createdBy: "Ganbold",
        description:
            """El cordero es muy parecido al que solíamos comer en Mongolia con la familia. Es cierto que este plato solo lo encuentras en las casas y que no se vende en restaurantes ¡Gracias!""",
      ),
      DishReview(
        rating: 4,
        headline: "Muy rico",
        createdBy: "Sandra",
        description: """Os lo recomiendo!""",
      ),
    ],
  ),
];
List<Dish> mexicanDishes = [
  Dish(
    name: "Tacos de ternera",
    ingredients: [
      Ingredient(name: "Carne de ternera"),
      Ingredient(name: "Tortilla de maíz"),
      Ingredient(name: "Cebolla morada"),
      Ingredient(name: "Ajo"),
      Ingredient(name: "Chile"),
      Ingredient(name: "Pimiento rojo"),
      Ingredient(name: "Pimiento verde"),
      Ingredient(name: "Zumo de limón"),
      Ingredient(name: "Tomate"),
      Ingredient(name: "Lechuga"),
      Ingredient(name: "Orégano"),
      Ingredient(name: "Cilantro"),
      Ingredient(name: "Aceite de oliva"),
      Ingredient(name: "Sal"),
      Ingredient(name: "Pimienta"),
    ],
    howToEat: "Caliente o templado. Consumir con las manos a modo de sandwich",
    description:
        """Tortilla enrollada de maíz con lechuga, ternera, pimiento y especias. En pocas palabras, Mexico en un plato""",
    history:
        """Las tortillas se consumían en la América precolombina y el modo de comerlas en taco es una herencia directa del periodo a la actualidad. Se desarrolló la tradición de una preparación a base de harina que aporta carbohidratos hecha de tal manera que queda como una superficie plana que sirve de sostén para otros alimentos""",
    mainImagePath: "assets/images/dish_images/america/mexico/Tacos.jpg",
    thumbnailImagePath:
        "assets/images/dish_images/america/mexico/Tacos_small.jpg",
    isSoldInUnits: true,
    price: 0.90,
  ),
  Dish(
    name: "Nachos caseros",
    ingredients: [
      Ingredient(name: "Harina de maíz"),
      Ingredient(name: "Harina de trigo", allergens: ["Gluten"]),
      Ingredient(name: "Clara de huevo", allergens: ["Huevo"]),
      Ingredient(name: "Queso para gratinar", allergens: ["Leche"]),
      Ingredient(name: "Tomate"),
      Ingredient(name: "Guacamole"),
      Ingredient(name: "Aceitunas negras"),
      Ingredient(name: "Salsa agria"),
      Ingredient(name: "Cebolla"),
      Ingredient(name: "Jalapeños"),
      Ingredient(name: "Pimiento rojo"),
      Ingredient(name: "Pimentón dulce"),
      Ingredient(name: "Pimentón picante"),
      Ingredient(name: "Orégano"),
      Ingredient(name: "Cilantro"),
      Ingredient(name: "Sal"),
      Ingredient(name: "Aceite de girasol"),
    ],
    howToEat: "Se pueden comer con las manos o con un tenedor y cuchillo",
    description:
        """Los totopos son un producto a base de trozos de tortilla de maíz fritos o tostados hasta adquirir una textura crujiente. Más comúnmente conocidos como nachos""",
    history:
        """Los totopos tradicionales provienen de las culturas prehispánicas, específicamente del nombre de la acción totopochtli, que en náhuatl significa dorar o tostar. El consumo de totopos tradicionales se da principalmente en el sureste de México, en los estados de Oaxaca y Chiapas""",
    mainImagePath:
        "assets/images/dish_images/america/mexico/nachos_caseros.jpg",
    thumbnailImagePath:
        "assets/images/dish_images/america/mexico/nachos_caseros_small.jpg",
    price: 12,
    reviews: [
      DishReview(
        rating: 5,
        headline: "Muy buenos",
        createdBy: "Diana",
        description: """Riquísimos!! Me encantaron""",
      ),
    ],
  ),
  Dish(
    name: "Enchilada",
    ingredients: [
      Ingredient(name: "Pechuga de pollo"),
      Ingredient(name: "Tortillas de maíz"),
      Ingredient(name: "Queso", allergens: ["Leche"]),
      Ingredient(name: "Aceite de oliva"),
      Ingredient(name: "Cilantro"),
      Ingredient(name: "Jalapeño"),
      Ingredient(name: "Tomate verde"),
      Ingredient(name: "Queso fresco", allergens: ["Leche"]),
      Ingredient(name: "Nata", allergens: ["Leche"]),
      Ingredient(name: "Chile"),
      Ingredient(name: "Tomate rojo"),
      Ingredient(name: "Sal"),
    ],
    howToEat: "Caliente. Usar tenedor  y cuchillo",
    description:
        """Tortilla de maíz enrollada alrededor de pollo y cubierto con las tres salsas típicas mexicanas (roja, verde y blanca)""",
    history:
        """Las enchiladas se originaron en México, donde la práctica de enrollar las tortillas alrededor de otros alimentos se remonta al menos a la época azteca . Las personas que viven en la región lacustre del Valle de México tradicionalmente comían tortillas de maíz dobladas o enrolladas alrededor de peces pequeños. Tan populares eran que en la época de los conquistadores españoles, Bernal Díaz del Castillo documentó una fiesta que disfrutaban los europeos organizada por Hernán Cortés en Coyoacán , que incluía alimentos servidos en tortillas de maíz, entre ellas la enchilada""",
    mainImagePath: "assets/images/dish_images/america/mexico/Enchilada.jpg",
    thumbnailImagePath:
        "assets/images/dish_images/america/mexico/Enchilada_small.jpg",
    price: 9,
    reviews: [
      DishReview(
        rating: 4.5,
        headline: "Mucho queso",
        createdBy: "Andrea",
        description: """Mogollón de queso! Muy bueno""",
      ),
    ],
  ),
];
List<Dish> canadianDishes = [
  Dish(
    name: "Poutine",
    ingredients: [
      Ingredient(name: "Patatas"),
      Ingredient(name: "Queso Mozarella", allergens: ["Leche"]),
      Ingredient(name: "Queso cottage", allergens: ["Leche"]),
      Ingredient(name: "Mantequilla", allergens: ["Leche"]),
      Ingredient(name: "Caldo de res"),
      Ingredient(name: "Sal"),
      Ingredient(name: "Pimienta"),
    ],
    howToEat: "Caliente. Usar tenedor",
    description:
        """Ración de patatas fritas y queso, una especialidad regional hecha de partes sólidas de la leche cuajada, un queso muy delicado y fresco y cubierta de salsa de carne""",
    history:
        """Poutine se origina en un restaurante anteriormente llamado Le Lutin qui rit en Warwick, en la región de Arthabaska. En 1957, un cliente llamado Eddy Lainesse le habría pedido al propietario Fernand Lachance que mezclara la cuajada de queso con las patatas fritas. ¡Magnífico!""",
    mainImagePath: "assets/images/dish_images/america/canada/Poutine.jpg",
    thumbnailImagePath:
        "assets/images/dish_images/america/canada/Poutine_small.jpg",
    price: 3.50,
  ),
  Dish(
    name: "Maccaroni & cheese",
    ingredients: [
      Ingredient(name: "Macarrones con codo", allergens: ["Gluten"]),
      Ingredient(name: "Mantequilla", allergens: ["Leche"]),
      Ingredient(name: "Ajo"),
      Ingredient(name: "Tomillo"),
      Ingredient(name: "Harina de trigo", allergens: ["Gluten"]),
      Ingredient(name: "Leche", allergens: ["Leche"]),
      Ingredient(name: "Mostaza de Dijon", allergens: ["Mostaza"]),
      Ingredient(name: "Nuez moscada"),
      Ingredient(name: "Sal"),
      Ingredient(name: "Pimienta"),
      Ingredient(name: "Queso Gruyere rallado", allergens: ["Leche"]),
      Ingredient(name: "Queso Cheddar rallado", allergens: ["Leche"]),
      Ingredient(name: "Queso Mozarella rallado", allergens: ["Leche"])
    ],
    howToEat: "Caliente, Usar tenedor",
    description:
        """Plato de macarrones con queso. Un plato muy típico de Canadá y Estados Unidos""",
    history:
        """Se originó durante la Segunda Guerra Mundial como el famoso “mac n cheese”, arropado en una caja de cartón que de repente, empezó a ganar popularidad entre niños y jóvenes. Cuando por culpa de la guerra se hizo cada vez más difícil encontrar productos hechos con queso, las compañías empezaron a desarrollar alternativas para volverlos a convertir en parte de la mesa familiar. Su popularidad ha ido creciendo y creciendo con los años""",
    mainImagePath:
        "assets/images/dish_images/america/canada/Macaroni-and-cheese-plato-canada.jpg",
    thumbnailImagePath:
        "assets/images/dish_images/america/canada/Macaroni-and-cheese-plato-canada_small.jpg",
    price: 5.50,
    reviews: [
      DishReview(
        rating: 5,
        headline: "El queso fundido estaba muy bueno",
        createdBy: "Lidia",
        description:
            """Muy bueno!! No sabía si animarme a probar macarrones con queso y resultó que el queso cremoso y fundido estaba muy bueno""",
      ),
    ],
  ),
];
List<Dish> surinameseDishes = [
  Dish(
    name: "Vatapá",
    ingredients: [
      Ingredient(name: "Pollo"),
      Ingredient(name: "Gambas", allergens: ["Pescado"]),
      Ingredient(name: "Aceite de girasol"),
      Ingredient(name: "Cebolla"),
      Ingredient(name: "Pimiento rojo"),
      Ingredient(name: "Ajo"),
      Ingredient(name: "Jalapeño"),
      Ingredient(name: "Tomate"),
      Ingredient(name: "Caldo de pollo"),
      Ingredient(name: "Cacahuetes tostados", allergens: ["Frutos secos"]),
      Ingredient(name: "Leche de coco"),
      Ingredient(name: "Vinagre"),
      Ingredient(name: "Cilantro"),
      Ingredient(name: "Sal"),
      Ingredient(name: "Cayena"),
      Ingredient(name: "Pimienta"),
    ],
    howToEat: "Caliente. Usar cuchara",
    description:
        """Uno de los platos más tradicionales de Suriname es el vatapá. La vatapá es un plato de mariscos que incluye diferentes tipos de pescado junto con verduras y pimiento.""",
    history:
        """Debido a su ubicación e historia, la cocina de Suriname muestra la combinación de varias culturas diferentes. Combina recetas caribeñas con elementos aportados por las culturas holandesa, china, judía, libanesa, india, africana occidental, española y francesa, entre otras. La variedad de recetas e ingredientes que combina hace que la gastronomía de Surinam sea muy variada e interesante.""",
    mainImagePath: "assets/images/dish_images/america/suriname/Vatapa.jpg",
    thumbnailImagePath:
        "assets/images/dish_images/america/suriname/Vatapa_small.jpg",
    price: 6,
    reviews: [
      DishReview(
        rating: 4,
        headline: "Para atrevidos",
        createdBy: "Miguel",
        description:
            """El sabor es muy fuerte! Tiene una mezcla de especias curiosa y diferente. La salsa era un pelín picante. Nunca había probado comida de Suriname antes y he de decir que me gustó""",
      ),
    ],
  ),
  Dish(
    name: "Pastei",
    ingredients: [
      Ingredient(name: "Harina de trigo", allergens: ["Gluten"]),
      Ingredient(name: "Mantequilla", allergens: ["Leche"]),
      Ingredient(name: "Sal"),
      Ingredient(name: "Pechuga de pollo"),
      Ingredient(name: "Cebolla"),
      Ingredient(name: "Ajo"),
      Ingredient(name: "Pasta de tomate"),
      Ingredient(name: "Guisantes"),
      Ingredient(name: "Zanahoria"),
      Ingredient(name: "Alcaparras"),
      Ingredient(name: "Margarina", allergens: ["Leche"]),
      Ingredient(name: "Caldo de pollo"),
      Ingredient(name: "Huevo", allergens: ["Huevo"]),
      Ingredient(name: "Pimienta"),
      Ingredient(name: "Aceite de girasol"),
    ],
    howToEat: "Caliente o frío, usar tenedor y cuchillo",
    description:
        """Pastel de pollo con guisantes y zanahorias muy típico de Suriname""",
    history:
        """En 1650, Lord Willoughby , el gobernador de Barbados , proporcionó un barco para asentar una colonia en Surinam. A su propio costo, equipó un barco de 20 cañones y dos barcos más pequeños con las cosas necesarias para el apoyo de la plantación. Allí había alrededor de 1.000 blancos, a los que se unieron judíos brasileños, atraídos por la libertad religiosa que se concedía a todos los colonos. Estos colonos judíos trajeron consigo sus influencias culinarias entre las cuales se encuentra el Pastei""",
    mainImagePath: "assets/images/dish_images/america/suriname/Pastei.jpg",
    thumbnailImagePath:
        "assets/images/dish_images/america/suriname/Pastei_small.jpg",
    price: 4,
  ),
  Dish(
    name: "Pom",
    ingredients: [
      Ingredient(name: "Pollo"),
      Ingredient(name: "Cerdo"),
      Ingredient(name: "Raíz de pomtajer"),
      Ingredient(name: "Tomate"),
      Ingredient(name: "Cebolla"),
      Ingredient(name: "Perejil"),
      Ingredient(name: "Caldo de pollo"),
      Ingredient(name: "Nuez moscada"),
      Ingredient(name: "Naranja", allergens: ["Leche"]),
      Ingredient(name: "Limones"),
      Ingredient(name: "Ajo"),
      Ingredient(name: "Azúcar"),
      Ingredient(name: "Mantequilla", allergens: ["Leche"]),
      Ingredient(name: "Sal"),
      Ingredient(name: "Pimienta"),
    ],
    howToEat: "Caliente o frío. Usar tenedor y cuchillo",
    description:
        """El pom es el plato festivo más popular y conocido de Surinam. Está preparado con raíz de pomtajer y carnes de cerdo y poll""",
    history:
        """A mediados del siglo XVII, llegó una gran población de judíos portugueses a través de Holanda y Brasil, huyendo de la Inquisición en su país. El número de judíos en Suriname era desproporcionado e influenciaron la gastronomía de Suriname. Los judíos de Suriname solían cocinar este plato para la Pascua (Pesaj)""",
    mainImagePath: "assets/images/dish_images/america/suriname/Pom.jpg",
    thumbnailImagePath:
        "assets/images/dish_images/america/suriname/Pom_small.jpg",
    price: 10,
    reviews: [
      DishReview(
        rating: 4.5,
        headline: "Buena cantidad",
        createdBy: "Nahir",
        description:
            """La porción era más grande de lo que aparecía en la foto. El plato se sentía diferente a lo que suelo comer""",
      ),
    ],
  ),
];
List<Dish> marrocanDishes = [
  Dish(
    name: "Bissara",
    ingredients: [
      Ingredient(name: "Habas"),
      Ingredient(name: "Guisantes"),
      Ingredient(name: "Ajo"),
      Ingredient(name: "Pimentón dulce"),
      Ingredient(name: "Pimientón picante"),
      Ingredient(name: "Comino"),
      Ingredient(name: "Aceite de oliva"),
    ],
    howToEat: "Caliente. Usar cuchara",
    description:
        """Plato tradicional que consiste en puré de habas y guisantes con aceite y especias""",
    history:
        """Tan solo hay que escuchar el refrán marroquí "es tan pobre que solo come bissara". Este plato era consumido antiguamente por las poblaciones más pobres de Marruecos, especialmente en el norte. Este sencillo plato se ha ido conservando y perfeccionando con los años. A veces lo sencillo está riquísimo""",
    mainImagePath: "assets/images/dish_images/africa/morocco/Bissara.jpg",
    thumbnailImagePath:
        "assets/images/dish_images/africa/morocco/Bissara_small.jpg",
    price: 5.50,
  ),
  Dish(
    name: "Kefta (5 uds)",
    ingredients: [
      Ingredient(name: "Carne de cordero picada"),
      Ingredient(name: "Carne de ternera picada"),
      Ingredient(name: "Cebolla"),
      Ingredient(name: "Ajo"),
      Ingredient(name: "Perejil"),
      Ingredient(name: "Cilantro"),
      Ingredient(name: "Menta"),
      Ingredient(name: "Pimentón"),
      Ingredient(name: "Comino"),
      Ingredient(name: "Canela"),
      Ingredient(name: "Harissa"),
      Ingredient(name: "Aceite de oliva"),
      Ingredient(name: "Sal"),
    ],
    howToEat: "Caliente.",
    description:
        """La kefta es un pincho de diferentes carnes con cebolla y especias. Típico de la zona norte de África y, más concretamente, Marruecos""",
    history:
        """La cocina marroquí empezó a gestarse en el siglo XIV, en los palacios de las dinastías beréberes dominantes, las pródigas cocinas palaciegas constituyeron el medio a través del cual se introdujo nuevos ingredientes y recetas en las cocinas domésticas. Es aquí donde nace la kefta como plato típico marroquí""",
    mainImagePath: "assets/images/dish_images/africa/morocco/Kefta.jpg",
    thumbnailImagePath:
        "assets/images/dish_images/africa/morocco/Kefta_small.jpg",
    price: 7.70,
    reviews: [
      DishReview(
        rating: 3,
        headline: "Me llego muy poca cantidad",
        createdBy: "Belén",
        description:
            """Hable con ellos y me comentaron que el cocinero no había puesto suficiente cantidad. Me enviaron otro nuevo a los 15 minutos""",
      ),
    ],
  ),
  Dish(
    name: "Pastilla",
    ingredients: [
      Ingredient(name: "Mantequilla", allergens: ["Leche"]),
      Ingredient(name: "Clara de huevo", allergens: ["Huevo"]),
      Ingredient(name: "Azúcar glas"),
      Ingredient(name: "Canela molida"),
      Ingredient(name: "Gallina"),
      Ingredient(name: "Perejil"),
      Ingredient(name: "Cebolla"),
      Ingredient(name: "Azafrán"),
      Ingredient(name: "Azúcar"),
      Ingredient(name: "Huevo", allergens: ["Huevo"]),
      Ingredient(name: "Sal"),
      Ingredient(name: "Pimienta"),
      Ingredient(name: "Jengibre"),
      Ingredient(name: "Cúrcuma"),
      Ingredient(name: "Aceite de girasol"),
      Ingredient(name: "Almendras"),
    ],
    howToEat: "Caliente, comer con tenedor y cuchara",
    description:
        """La pastilla es el aperitivo marroquí más emblemático. Contiene un relleno de dulce y salado, envuelto en capas de masa muy fina""",
    history:
        """Cuenta la historia que, en 1492, durante la caída de Al-Andalus que fue expulsado de España después de la reconquista de Granada, los moriscos se refugiaron en Marruecos y trajeron consigo sus tradiciones y una multitud de recetas, incluida la pastilla. Pero no se trata solo de los moriscos. Se cree que la pastilla también tiene orígenes judíos sefardíes. De hecho, después de la expulsión de los judíos de España por Isabel I, hubo una gran ola de emigración de judíos en el norte de África que también trajeron sus conocimientos y tradiciones con ellos""",
    mainImagePath: "assets/images/dish_images/africa/morocco/Pastilla.jpg",
    thumbnailImagePath:
        "assets/images/dish_images/africa/morocco/Pastilla_small.jpg",
    price: 9.50,
    reviews: [
      DishReview(
        rating: 4.5,
        headline: "Mezcla de dulce y salado",
        createdBy: "John",
        description:
            """Es extraño ya que no se suelen juntar sabores dulces con salados. La combinación de la carne con el el azúcar me resultó sabrosa y diferente. Muy bueno!""",
      ),
    ],
  ),
];
List<Dish> egiptianDishes = [
  Dish(
    name: "Kushari",
    ingredients: [
      Ingredient(name: "Cebolla"),
      Ingredient(name: "Tomates"),
      Ingredient(name: "Ajo"),
      Ingredient(name: "Baharat"),
      Ingredient(name: "Pimentón dulce"),
      Ingredient(name: "Vinagre"),
      Ingredient(name: "Arroz"),
      Ingredient(name: "Pasta", allergens: ["Gluten"]),
      Ingredient(name: "Garbanzos"),
      Ingredient(name: "Lentejas"),
      Ingredient(name: "Sal"),
      Ingredient(name: "Aceite de oliva"),
      Ingredient(name: "Guindilla"),
    ],
    howToEat: "Caliente, utilizar cuchara o tenedor",
    description:
        """El Kushari suele servirse en los restaurantes egipcios. Plato típico a base de arroz, pasta, garbanzos y lentejas""",
    history:
        """Se cree que Koshari se originó en la India y se remonta a la época de la colonización británica. El nombre "Koshari" es en realidad del hindú "khichri", que se refiere a un plato de lentejas y arroz. Cuando los británicos llegaron a Egipto a fines del siglo XIX, trajeron este plato con ellos: era económico y abundante. No pasó mucho tiempo antes de que el plato fuera acogido con entusiasmo por el pueblo egipcio""",
    mainImagePath: "assets/images/dish_images/africa/egipt/Kushari.jpg",
    thumbnailImagePath:
        "assets/images/dish_images/africa/egipt/Kushari_small.jpg",
    price: 5.50,
    reviews: [
      DishReview(
        rating: 5,
        headline: "Sencillo y rico",
        createdBy: "Jorge",
        description:
            """Como dicen, este plato tiene un origen humilde. Mi sensación es que uno es capaz de sentir su historia. En general yo diría que es un plato sencillo y rico 👌""",
      ),
    ],
  ),
  Dish(
    name: "Hummus",
    ingredients: [
      Ingredient(name: "Garbanzos"),
      Ingredient(name: "Agua"),
      Ingredient(name: "Aceite de oliva"),
      Ingredient(name: "Zumo de limón"),
      Ingredient(name: "Ajo"),
      Ingredient(name: "Pimentón"),
      Ingredient(name: "Comino"),
      Ingredient(name: "Pimentón"),
      Ingredient(name: "Comino"),
      Ingredient(name: "Sal"),
    ],
    howToEat:
        "Frío. Se puede untar en pan o en cualquier cosa que quieras, también se puede comer solo",
    description:
        """El hummus es una crema de garbanzos con limón, aceite y especias.""",
    history:
        """Este plato tiene un rigen incierto. Las primeras recetas escritas conocidas de un plato parecido al hummus se registran en libros de cocina escritos en El Cairo en el siglo XIII. Un puré frío de garbanzos con vinagre y limones en escabeche con hierbas, especias y aceite. Los garbanzos son uno de los cultivos más antiguos especialmente en la zona de Egipto con lo que se utilizaba para numerosos platos, entre ellos, el Hummus    """,
    mainImagePath: "assets/images/dish_images/africa/egipt/Hummus.jpg",
    thumbnailImagePath:
        "assets/images/dish_images/africa/egipt/Hummus_small.jpg",
    reviews: [
      DishReview(
        rating: 4.5,
        headline: "Es como una sensación extraña",
        createdBy: "Alejandro",
        description:
            """Se nota que no es un hummus industrial. Tiene ese toque de autenticidad que me resultó super curioso. A mi y a mis amigos nos gustó. Un plato curioso""",
      ),
    ],
    price: 3.85,
  ),
];
List<Dish> ugandanDishes = [
  Dish(
    name: "Ugali",
    ingredients: [
      Ingredient(name: "Agua"),
      Ingredient(name: "Sal"),
      Ingredient(name: "Harina de Maíz blanca"),
    ],
    howToEat:
        "Caliente, se puede partir con las manos o con un tenedor y cuchillo",
    description:
        """Pan ugandés. El Ugali es una guarnición muy típica de Uganda. Se acompaña con las comidas.""",
    history:
        """El maíz fue introducido en Kenia por los comerciantes y colonos portugueses a partir del siglo XVI y rápidamente se convirtió en el grano preferido. En el este, el ugali se hace generalmente con harina de maíz blanco, pero en el oeste también se hace con mijo. En la costa, puede comer su ugali con un poco de pescado o curry, pero en el interior puede usar su ugali para preparar un estofado de ternera como karanga . Independientemente de cómo se sirva, debe comer ugali con la mano derecha""",
    mainImagePath: "assets/images/dish_images/africa/uganda/Ugali.jpg",
    thumbnailImagePath:
        "assets/images/dish_images/africa/uganda/Ugali_small.jpg",
    price: 2.50,
  ),
  Dish(
    name: "Matoke",
    ingredients: [
      Ingredient(name: "Plátano"),
      Ingredient(name: "Limón"),
      Ingredient(name: "Aceite de oliva"),
      Ingredient(name: "Cebolla"),
      Ingredient(name: "Pimiento morrón"),
      Ingredient(name: "Ajo"),
      Ingredient(name: "Chiles"),
      Ingredient(name: "Cilantro"),
      Ingredient(name: "Ternera"),
      Ingredient(name: "Tomate"),
      Ingredient(name: "Caldo de res"),
      Ingredient(name: "Sal"),
    ],
    howToEat: "Caliente. Utilizar cuchara",
    description:
        """Guiso de plátano mezclado con ajo picado, cebolla, pimiento y carne""",
    history:
        """Otro plato en el que los ingredientes locales tienen mucha influencia. Cocinar los plátanos ha sido durante mucho tiempo y sigue siendo un cultivo básico común en la zona del lago Victoria en Uganda y en las regiones del oeste y el Kilimanjaro de Tanzania. De estos cultivos surgió el Matoke""",
    mainImagePath: "assets/images/dish_images/africa/uganda/Matoke.jpg",
    thumbnailImagePath:
        "assets/images/dish_images/africa/uganda/Matoke_small.jpg",
    price: 7.20,
  ),
  Dish(
    name: "Mkate Wa Mayai (pastel esponja)",
    ingredients: [
      Ingredient(name: "Huevo", allergens: ["Huevo"]),
      Ingredient(name: "Uvas pasas"),
      Ingredient(name: "Harina de trigo", allergens: ["Huevo"]),
      Ingredient(name: "Canela"),
      Ingredient(name: "Azúcar"),
      Ingredient(name: "Levadura en polvo"),
    ],
    howToEat: " Frío. Cortar el pastel en porciones como una pizza",
    description: """Bizcocho muy ligero y esponjoso con canela y pasas""",
    history:
        """Durante el Renacimiento, los cocineros italianos se hicieron famosos por sus habilidades para hornear y fueron contratados por hogares tanto en Inglaterra como en Francia. Los nuevos artículos que introdujeron se llamaron “galletas”, aunque fueron el precursor de lo que ahora consideramos bizcocho. Los europeaos trajeron este tipo de bizcocho a Uganda, el cual fue evolucioando hasta crear el Mkate Wa Mayai o "pastel esponja".""",
    mainImagePath: "assets/images/dish_images/africa/uganda/Mkate.jpg",
    thumbnailImagePath:
        "assets/images/dish_images/africa/uganda/Mkate_small.jpg",
    price: 4,
    reviews: [
      DishReview(
        rating: 5,
        headline: "Muy parecido al original",
        createdBy: "Sarabi",
        description:
            """He vivido en Uganda por 5 años y parece que este pastel lo ha hecho la señora que vivía al lado. Solíamos comer este pastel cuando nos invitaba a su casa en Kampala""",
      ),
      DishReview(
        rating: 4,
        headline: "La canela le da un toque",
        createdBy: "Antonio",
        description:
            """Muy muy esponjoso. El sabor a canela le da un toque especial al pastel que gustó mucho""",
      ),
    ],
  ),
];
List<Dish> australianDishes = [
  Dish(
    name: "Fish & Chips",
    ingredients: [
      Ingredient(name: "Harina de trigo", allergens: ["Gluten"]),
      Ingredient(name: "Huevo", allergens: ["Huevo"]),
      Ingredient(name: "Filetes de pez hoki", allergens: ["Pescado"]),
      Ingredient(name: "Patatas"),
      Ingredient(name: "Cerveza"),
      Ingredient(name: "Limón"),
    ],
    howToEat: "Caliente, utilizar tenedor y cuchillo",
    description:
        """Plato muy típico autraliano y británico. Consiste en pescado típico australiano (hoki) rebozado con cerveza y limón. El plato va acompañado de patatas frita""",
    history:
        """La primera combinación registrada de pescado y papas fritas fue en una tienda de Londres abierta en 1860 por el migrante judío Joseph Malin. No pasó mucho tiempo para que el concepto se popularizara allí. Fue entonces cuando Athanasias Comino, un inmigrante griego en Australia, quien abrió su tienda en 1879 en la calle Oxford de Sydney.""",
    mainImagePath:
        "assets/images/dish_images/oceania/australia/Fish_and_chips.jpg",
    thumbnailImagePath:
        "assets/images/dish_images/oceania/australia/Fish_and_chips_small.jpg",
    price: 8.70,
    reviews: [
      DishReview(
        rating: 4,
        headline: "Es un plato típico de Reino Unido",
        createdBy: "Simón",
        description:
            """He de decir que los Fish & Chips son un plato típico británico! 😛 Fuera bromas, muy rico todo y bastante tradicional. me recordó a los Fish & Chips caseros que comía en casa de mi tía.""",
      ),
    ],
  ),
  Dish(
    name: "Barramundi a la plancha",
    ingredients: [
      Ingredient(name: "Pez barramundi"),
      Ingredient(name: "Pimientos picados"),
      Ingredient(name: "Espárragos verdes"),
      Ingredient(name: "Ajo"),
      Ingredient(name: "Aceite de oliva"),
      Ingredient(name: "Sal marina"),
      Ingredient(name: "Mantequilla", allergens: ["Leche"]),
      Ingredient(name: "Zumo de limón"),
      Ingredient(name: "Agua"),
      Ingredient(name: "Azúcar"),
      Ingredient(name: "Perejil"),
    ],
    howToEat: "Caliente. Utilizar cuchillo y tenedor",
    description:
        """Pez autóctono de la región australiana. Cocinado con verduras y especias""",
    history:
        """El nombre de barramundi significa “pez de río de escamas grandes” y es originario de Nueva Guinea y del norte y este de Australia. Es de las especies más buscadas en las competencias de pesca deportiva, por su gran tamaño e imponencia""",
    mainImagePath: "assets/images/dish_images/oceania/australia/BARRAMUNDI.jpg",
    thumbnailImagePath:
        "assets/images/dish_images/oceania/australia/BARRAMUNDI_small.jpg",
    price: 5.75,
  ),
  Dish(
    name: "Pavlova",
    ingredients: [
      Ingredient(name: "Clara de huevo", allergens: ["Huevo"]),
      Ingredient(name: "Azúcar en polvo"),
      Ingredient(name: "Vinagre de vino blanco"),
      Ingredient(name: "Harina de maíz"),
      Ingredient(name: "Extracto de vainilla"),
      Ingredient(name: "Fresas"),
      Ingredient(name: "Arándanos"),
      Ingredient(name: "Frambuesas"),
      Ingredient(name: "Nueces"),
      Ingredient(name: "Azúcar glas"),
    ],
    howToEat: "Frío, cortar en porciones. Usar una cucharilla",
    description:
        """La pavlova es un postre muy conocido en ambos países, tanto en Australia como en Nueva Zelanda. Consiste en una base de merengue sobre la cual se pone nata, y trozos de fruta. Resulta crujiente por fuera y húmedo por dentro""",
    history:
        """Este postre fue creado en honor de la bailarina Ana Pavlova. Según escribe el biógrafo de la bailarina, cuando ésta se encontraba en su gira mundial de 1926, durante su estadía en Nueva Zelanda, el chef del hotel donde Ana Pavlova se hospedaba inventó este postre para sorprender a la bailarina""",
    mainImagePath: "assets/images/dish_images/oceania/australia/Pavlova.jpg",
    thumbnailImagePath:
        "assets/images/dish_images/oceania/australia/Pavlova_small.jpg",
    price: 5.75,
    reviews: [
      DishReview(
        rating: 4,
        headline: "cortar una nube",
        createdBy: "Jorge",
        description:
            """Me quedé muy asombrado cuando note la ligereza del merengue. El pastel se cortaba muy fácilmente y no era nada espeso. """,
      ),
    ],
  ),
];
List<Dish> papuanDishes = [
  Dish(
    name: "Kau Kau de coco (6 uds)",
    ingredients: [
      Ingredient(name: "Batatas (kau kau)"),
      Ingredient(name: "Mantequilla", allergens: ["Leche"]),
      Ingredient(name: "Coco fresco rallado"),
      Ingredient(name: "Cebolla"),
      Ingredient(name: "Ajo"),
      Ingredient(name: "Jengibre"),
      Ingredient(name: "Zumo de naranja"),
      Ingredient(name: "Sal"),
      Ingredient(name: "Pimienta"),
    ],
    howToEat: "Caliente.",
    description:
        """Patatas rellenas de leche y crema de coco con cebolla y especias. Algo que no habías probado aún seguro""",
    history:
        """Los alimentos comunes en la vida cotidiana de un papú incluyen, principalmente, los cultivos de raíces como el sagú, las batatas, el taro, la mandioca, el coco y otras frutas tropicales. El estilo de vida dietético de los papúes casi no se vio influenciado por los colonos durante la colonización. La batata, conocida localmente como kaukau, se ha convertido en un alimento básico de Papúa Nueva Guinea  y ahora es una parte integrante de su vida. Hay muy pocos platos de PNG que no la usen en sus recetas""",
    mainImagePath: "assets/images/dish_images/oceania/new_guinea/Kau_Kau.jpg",
    thumbnailImagePath:
        "assets/images/dish_images/oceania/new_guinea/Kau_Kau_small.jpg",
    price: 4.20,
  ),
  Dish(
    name: "Mumu",
    ingredients: [
      Ingredient(name: "Col rizada"),
      Ingredient(name: "Paíz de taro"),
      Ingredient(name: "Plátanos verdes"),
      Ingredient(name: "Batata"),
      Ingredient(name: "Muslos de pollo"),
      Ingredient(name: "Panceta de cerdo"),
      Ingredient(name: "Piña"),
      Ingredient(name: "Limón"),
      Ingredient(name: "Leche de coco"),
      Ingredient(name: "Sal"),
    ],
    howToEat: "Caliente, utilizar cuchara o tenedorr",
    description:
        """Este plato es una delicia tropical de cerdo, pollo, batata y plátano cocinado en una olla a fuego lento""",
    history:
        """Mumu es en realidad una forma en que cocinan los habitantes de Papúa Nueva Guinea. Aunque ahora hay hornos disponibles en algunos hogares, el estilo de cocinar mumu es una tradición que aún continúa en la actualidad. El mumu típico es un pozo que tiene carbones encendidos colocados en su interior""",
    mainImagePath: "assets/images/dish_images/oceania/new_guinea/Mumu.jpg",
    thumbnailImagePath:
        "assets/images/dish_images/oceania/new_guinea/Mumu_small.jpg",
    price: 11.20,
  ),
];
