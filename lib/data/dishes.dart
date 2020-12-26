import 'package:fake_app_v1/models/dish_model.dart';
import 'package:fake_app_v1/models/ingredient.dart';

final List<Dish> japaneseDishes = [
  Dish(
    name: "Okonomiyaki",
    price: 7.5,
    description: """
El Okonomiyaki es muy conocido como la "Tortilla Japonesa" o la "Pizza Japonesa". Una caracteristica del Okonomiyaki es que se prepara con todo tipo de ingredientes, de hecho su nombre okonomiyaki significa «lo que te guste, a la planca».

Es un plato típico de la zona de Osaka e Hiroshima, donde hay muchos restaurantes que lo preparan directamente frente al comensal.

El Okonomiyaki se prepara sobre una plancha llamada Teppanyaki. Consiste en la masa de harina, huevo y repollo, y aquí ofrecemos la versión más básica, con la carne de cerdo.

La salsa Otafuku, es la popular salsa de oeste de Japón que lleva tomate, dátiles, cebolla, shiitake, vinagre, azúcar y muchas verduras más. Es como la salsa Worcester souce de Reino Unido pero elaborada para el gusto de los japoneses. El sabor de Otafuku es el sabor de Osaka.

La viruta de bonito seco da un acento a este plato. Esta viruta es elaborada con una pieza de bonito seco y curado llamado Katsuobushi, es uno de los ingredientes fundamentales para la comida japonesa.
""",
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
  ),
  Dish(
    name: "Onigiri",
    isSoldInUnits: true,
    description: """
Onigiri es uno de los soul foods de Japón. Como si fuese un bocata, los japoneses los llevan por todas partes.

La bola de arroz está formada con algo salado o acido que impide el deterioro del arroz y consigue una conservación de larga duración. Aquí ofrecemos con la versión de Yukari. Es el polvo hecho con la hoja de ciruela japonesa. Es ligeramente acido, salado y muy aromático, el sabor único que representa la sutileza de la comida japonesa.
""",
    price: 2.25,
    mainImagePath: "assets/images/dish_images/asia/japan/onigiri.jpg",
    howToEat:
        "Se puede comer caliente o frio. Se come con las manos, solamente tienes que cubrir el arroz con la alga nori y comertelo como si fuese un bocata.",
    ingredients: [
      Ingredient(name: "Arroz"),
      Ingredient(name: "Yukari (Ciruela japonesa)"),
      Ingredient(name: "Alga nori"),
      Ingredient(name: "Sal"),
    ],
  ),
  Dish(
    name: "Pollo frito estilo Japonés",
    isSoldInUnits: true,
    description: """
Pollo frito de cocinado al estilo japones se hace con carne de pollo remojada en la salsa de soja y otros ingredientes. Es crujiente por fuera y jugoso por dentro. Aunque esté frio, gracias a la carne marinada, es muy sabroso.
    """,
    history: """
La carne se dio a conocer en Japón a finales del siglo XIX. Debido a un contexto religioso, el ganado era indispensable y muy valioso como animal de granja, por lo que estaba prohibido incluir la carne en la dieta. No se consumió carne hasta el año 1877 cuando 558 restaurantes de “gyunabe”, carne de res guisada en el sartén, abrieron en Tokio. Este hecho fue visto como uno de los movimientos de occidentalización de Japón.

Los platillos de carne se hicieron muy populares junto a “la cultura del Sukiyaki“. En la ciudad vanguardista de Kyoto, en el año 1940, se tenía la costumbre de comer “sukiyaki” contribuyendo al aumento de la demanda de carne. Mientras tanto, la automatización se estaba instalando en la producción de ganado. En este momento, el objetivo se centró en mejorar la especie para conseguir una carne más grande y con mejor sabor.

Por otro lado, la carne “yamato-ni” enlatada, carne guisada con salsa de soya, ayudó a la aceleración del uso de la carne en la cocina de todo Japón. Esta carne es muy apreciada, tanto en los hogares, como fuera de ellos como una comida práctica, ya elaborada y muy sabrosa.
""",
    mainImagePath: "assets/images/dish_images/asia/japan/pollo_jp.jpg",
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

final List<Dish> ecuadorDishes = [
  Dish(
    name: "Papas con cuero",
    price: 3,
    howToEat: "Este plato se come caliente y con cuchara",
    description: """
Consiste en un caldo de piel de chancho cocinado con papas y especies. Actualmente, es considerado como una comida rápida de fácil acceso, te lo puedes encontrar en puestos de ventas en la vía pública y restaurantes gastronómicos tradicionales en ciudades como Quito.

Las papas con cuero son un plato de comida que se consume tradicionalmente en algunas localidades de la región Sierra del Ecuador.

El líquido de cocción del cuero se lo prepara con un refrito de achiote y cebolla, después se lo combina con papas del tipo 'Gabriela' o 'Chola'.
""",
    history: """
La preparación de este plato criollo no tiene una fecha de origen definida, pero sus ingredientes revelan un mestizaje cultural entre América y Europa. Estudios mencionan que el cerdo fue introducido por los españoles, mientras que la papa es nativa de este continente (de los Andes).

En la época colonial, los Españoles que vivían en Latino América no utilizaban el cuero del cerdo y desechaban. Los indígenas se las ingenieron para aprovechar el cuero que desaprovechaban los Colonos para preparar sus comidas.

Según se cuenta las papas con cuero nacen en Mocha y son la variación de un plato típico el cual usaba como ingredientes: papas con cascara e hígado de cuy, pero para darle un mejor sabor este fue reemplazado por el cuero cocinado del porcino, las papas peladas, y además se le aumentó la famosa salsa de maní.
""",
    mainImagePath: "assets/images/dish_images/ecuador/papas_con_cuero.jpg",
    ingredients: [
      Ingredient(name: "Patatas"),
      Ingredient(name: "Piel de cerdo"),
      Ingredient(name: "Cebolla"),
      Ingredient(name: "Mantequilla", allergens: ["Leche"]),
      Ingredient(name: "Aceite"),
      Ingredient(name: "Leche", allergens: ["Leche"]),
      Ingredient(name: "Ajo"),
      Ingredient(name: "Perejil"),
      Ingredient(name: "Pimienta"),
      Ingredient(name: "Sal"),
      Ingredient(name: "Comino"),
      Ingredient(name: "Orégano"),
    ],
  ),
  Dish(
    name: "Guatita",
    howToEat:
        "Este plato se come caliente. Se recomienda intentar juntar todos los sabores en un mismo bocado. También se puede mezclar el arroz",
    history: """
Es difícil establecer un origen como tal de esta preparación, existen dos teorías. La primera expone que es un plato que nació en la cocina costeña; y en cambio, la segunda teoría afirma que proviene de la Sierra. Lo cierto es que posee ingredientes que se producen en los fructíferos suelos las dos regiones naturales del país.

En España se preparaba por el año 1559 un plato de callos, compuesto por trozos cocinados de panza de vaca o de carnero, que se popularizó a fines del siglo XIX.

Ya en Ecuador; en 1920 se consumía en Guayaquil el mondongo o panza de borrego, que se ofrecía en fondas y que se lo preparaba con trocitos cocinados en sangre de res.

Con los años la guatita ha pasado de ser un plato principal para convertirse en un complemento de otro como la denominada bandera, en el que viene acompañado de cazuela, encebollado o a gusto del cliente.
""",
    description: """
La guatita se considera plato nacional en Ecuador. Consiste en un estofado hecho a base de trozos de estómago de vacuno, a lo que se le llama guatitas (también conocido en otras regiones como mondongo). Se distingue por ser un plato muy calórico.

Es de sabor fuerte debido a la preparación a veces se sirve por esta razón en pequeñas cantidades. La elaboración suele hacerse de tal forma que el mondongo (o librillo) se limpia varias veces en una salmuera con zumo de limón, tras ello se cuece durante mucho tiempo hasta que se ablande la carne y posteriormente se deja enfriar se pica finamente tras la cocción en agua.
""",
    mainImagePath: "assets/images/dish_images/ecuador/guatita.jpg",
    price: 3,
    ingredients: [
      Ingredient(name: "Arroz"),
      Ingredient(name: "Huevo", allergens: ["Huevo"]),
      Ingredient(name: "Aguacate"),
      Ingredient(name: "Tripas de Res"),
      Ingredient(name: "Mantequilla de cacahuete", allergens: ["Cacahuete"]),
      Ingredient(name: "Cebolla morada y blanca"),
      Ingredient(name: "Tomate"),
      Ingredient(name: "Zumo de limón"),
      Ingredient(name: "Leche", allergens: ["Leche"]),
      Ingredient(name: "Mantequilla", allergens: ["Leche"]),
      Ingredient(name: "Pimiento"),
      Ingredient(name: "Especias (Comino, Cilantro, Achiote, Oregano)"),
      Ingredient(name: "Ajo"),
      Ingredient(name: "Agua"),
      Ingredient(name: "Sal y pimienta"),
    ],
  ),
];

List<Dish> spanishDishes = [
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
    description: """
Pollo con salsa pepitoria. La salsa consiste de los jugos obtenidos de la preparación de las carnes enriquecidos con yema de huevo duro y almendras molidas.
    """,
    history: """
Su origen es dudoso, unos lo ponen en Francia, con el argumento de que la palabra "pepitoria" viene del francés antiguo petite-oie que significa guiso de menudillos de ganso, plato medieval que se realizaba con las partes pequeñas de la oca (menudillos y despojos) y que se llamaba hochepot au petite oie. Pero en España preferimos defender sus orígenes árabes, tanto por el método de cocinado como por parte de sus ingredientes (azafrán y frutos secos).
    """,
    price: 7.5,
    mainImagePath: "assets/images/dish_images/spanish/pollo_pepitoria.jpg",
    sideViewImage: "assets/images/dish_images/spanish/pollo_pepitoria_side.jpg",
  ),
];

List<Dish> italianDishes = [
  Dish(
    name: "Arancini italianos",
    ingredients: [
      Ingredient(name: "Arroz arborio o carnaroli(especial risotto)"),
      Ingredient(name: "Mantequilla", allergens: ["Leche"]),
      Ingredient(name: "Vino blanco"),
      Ingredient(name: "Caldo de verduras o pollo"),
      Ingredient(name: "Pimienta negra molida"),
      Ingredient(name: "Queso parmesano rallado", allergens: ["Leche"]),
      Ingredient(name: "Jamón serrano picado"),
      Ingredient(
          name: "Mozarella fresca en pequeños dados", allergens: ["Leche"]),
      Ingredient(
          name: "Harina de trigo (para el empanado)", allergens: ["Gluten"]),
      Ingredient(name: "Huevo (para el empanado)", allergens: ["Huevo"]),
      Ingredient(name: "Pan rallado (para el empanado)", allergens: ["Gluten"]),
      Ingredient(name: "Salsa bolognesa (carne, tomate)"),
      Ingredient(name: "Aceite vegetal para freir"),
      Ingredient(name: "Azafrán"),
      Ingredient(name: "Sal"),
    ],
    howToEat:
        "Este plato se come caliente. Se puede comer con tenedor y cuchillo o también con las manos como si fuese un sandwich o una croqueta",
    description: """
Corqueta de arroz muy típica Siciliana. Las arancini sicilianas son una receta tradicional italiana muy apreciada dentro y fuera de la isla. Recuerdan a nuestras croquetas, pero las arancini son bolas de arroz empanadas y fritas. Van rellenas de queso, principalmente mozzarella.
    """,
    history: """
El nombre de arancini (también denominado arancino, arancinu y arancina), se debe al color que adquieren las bolas de arroz (por el azafrán), parecen una pequeña naranja. En la historia de Italia, el arroz siempre ha sido un alimento muy común. Antiguamente los trabajadores no tenían mucho tiempo ni descansos para comer. A raíz de esto, se crearon una especie de croqueta/sandwich en la cual se introducía arroz y queso. Este menú se fue haciendo más y más popular entre la clase obrera italiana, concretamente en Sicilia, dando nacimiento a los Arancini.
    """,
    mainImagePath: "assets/images/dish_images/italian/arancini.jpg",
    price: 2.6,
    isSoldInUnits: true,
  ),
];

List<Dish> peruanDishes = [
  Dish(
    name: "Chicharrón",
    ingredients: [
      Ingredient(name: "Costillas de cerdo"),
      Ingredient(name: "Patatas"),
      Ingredient(name: "Canchita (maíz tostado)"),
      Ingredient(name: "Cebolla"),
      Ingredient(name: "Tomate"),
      Ingredient(name: "Rocoto"),
      Ingredient(name: "Hierba buena"),
      Ingredient(name: "Limón"),
    ],
    howToEat:
        "Este plato se come caliente. Puedes comer cada cosa por separado, pero nosotros recomendamos comerlo en su forma auténtica. Todos los sabores a la vez, la ensalada, las patatas, la canchita, y el cerdo de un bocado ¡Riquísimo!",
    description: """
Plato para 1 o incluso 2 personas. Es un plato completisimo, tiene de todo.

Fritura de la piel de cerdo con su carne junto con una guarnición de canchita, patatas y ensalada de cebolla y tomate. La canchita son los quicos (maíz tostado) en su versión original.
    """,
    history: """
La historia del chicharrón se inicia con los negros traídos al imperio Inca por los españoles pues esta gente tenía costumbres de criar. El origen del chicharrón se debió al objetivo de proporcionarle al individuo la grasa necesaria para el engrase de sus alimentos, cuyo derivado es la manteca. Pero ¿cuándo se empezó a hacer chicharrón? La venta del chicharrón se inicia en los años 1927 y 1928, durante el gobierno de Horacio Vásquez, para las Fiestas Patronales del Espíritu Santo. Luego en los años 50 se extendió el comercio a pueblos del interior (costa, sierra y selva del Perú) convirtiéndose el chicharrón en uno de los platos típicos del Perú.
    """,
    mainImagePath: "assets/images/dish_images/peru/chicharrón.jpg",
    price: 13,
  ),
];

final List<Dish> frenchDishes = [
  Dish(
    name: "Beouf bourguignon",
    ingredients: [
      Ingredient(name: "Carne de ternera para guisar"),
      Ingredient(name: "Vino tinto"),
      Ingredient(name: "Cebolla"),
      Ingredient(name: "Zanahoria"),
      Ingredient(name: "Perejil"),
      Ingredient(name: "Bacon"),
      Ingredient(name: "Harina de trigo", allergens: ["Gluten"]),
      Ingredient(name: "Mantequilla", allergens: ["Leche"]),
      Ingredient(name: "Champiñones"),
      Ingredient(name: "Caldo de carne"),
      Ingredient(name: "Tomate"),
      Ingredient(name: "Aceite de oliva"),
      Ingredient(name: "Sal"),
      Ingredient(name: "Pimienta negra"),
    ],
    howToEat: "Caliente. Usar tenedor y cuchillo o cuchara",
    description: """
Estofado de ternera tradicional francés que se prepara a fuego lento en vino tinto servido con zanhaoria, patata y champiñones.
    """,
    history: """
El chef Auguste Escoffier, que publicó por primera vez la receta en el principios de los 20 º siglo. Con el tiempo, la receta evolucionó de la comida campesina honesta a la alta cocina, y la receta de 1903 de Escoffier se convirtió en el abanderado, utilizando un trozo entero de ternera en el estofado. Mucho más tarde, Julia Child usó cubos de ternera en lugar de una pieza entera, lo que llevó al boeuf Bourguignon a la atención de toda una nueva generación de cocineros.
""",
    mainImagePath: "assets/images/dish_images/french/boeuf_bourguignon.jpg",
    price: 8.50,
  ),
  Dish(
    name: "Crêpe Paul Bocuse fraise et chocolat",
    ingredients: [
      Ingredient(name: "Mantequilla", allergens: ["Leche"]),
      Ingredient(name: "Harina de trigo", allergens: ["Gluten"]),
      Ingredient(name: "Azúcar glas"),
      Ingredient(name: "Sal"),
      Ingredient(name: "Huevos"),
      Ingredient(name: "Leche", allergens: ["Leche"]),
      Ingredient(name: "Aceite de oliva"),
      Ingredient(name: "Mantequilla", allergens: ["Leche"]),
      Ingredient(name: "Nutella", allergens: ["Frutos secos"]),
      Ingredient(name: "Fresas"),
    ],
    howToEat: "Frío. comer con cuchillo y tenedor.",
    description: """
Masa fina preparada con harina, huevos, mantequilla y leche rellena de fresa y nutella
""",
    history: """
Las crêpes son originarias de la región de Bretaña, al oeste de Francia, en donde se llaman krampouezh; actualmente es un plato consumido a diario en todo el país, especialmente en el Chandeleur o Fiesta de la Candelaria, como parte de la tradición local (habitualmente se sirven acompañados de sidra).
""",
    mainImagePath: "assets/images/dish_images/french/crepe.jpg",
    price: 4,
  ),
];
