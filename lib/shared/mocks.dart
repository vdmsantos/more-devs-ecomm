final List<Map<String, dynamic>> categoriesJson = [
  {'name': 'Frutas', 'imageUrl': 'https://i.postimg.cc/SNX7hc6F/Image.png'},
  {
    'name': 'Verduras',
    'imageUrl': 'https://i.postimg.cc/8PFBSLh2/Image-(1).png',
  },
  {'name': 'Padaria', 'imageUrl': 'https://i.postimg.cc/xTky2LvV/Image-1.png'},
  {
    'name': 'Importados',
    'imageUrl': 'https://i.postimg.cc/Yq4fHQ6w/Image-2.png',
  },
];

final List<Map<String, dynamic>> productsJson = [
  {
    'brand': 'Natural da terra',
    'name': 'Rabanete',
    'imageUrl': 'https://i.postimg.cc/8Pt82Qmf/Image-1.png',
    'price': 10.99,
    'category': 'Verduras',
    'description':
        'O rabanete é uma raiz crocante e levemente picante, ótima para saladas e '
        'pratos frescos. Rico em vitamina C e fibras, ajuda na digestão e traz '
        'um toque especial para o dia a dia.',
  },
  {
    'brand': 'Natural da terra',
    'name': 'Cogumelo',
    'imageUrl': 'https://i.postimg.cc/RVP8P1vw/Image-2.png',
    'price': 12.19,
    'category': 'Verduras',
    'description':
        'Cogumelos frescos, macios e cheios de sabor. Excelente fonte de '
        'proteína vegetal e vitaminas do complexo B, ideais para refogados, '
        'risotos e molhos.',
  },
  {
    'brand': 'Natural da terra',
    'name': 'Alface',
    'imageUrl': 'https://i.postimg.cc/RVP8P1vw/Image-2.png',
    'price': 4.50,
    'category': 'Verduras',
    'description':
        'Alface fresquinha e crocante, colhida diariamente. Rica em água e '
        'fibras, perfeita para saladas leves e sanduíches do dia a dia.',
  },
  {
    'brand': 'Akatsu',
    'name': 'Acerola',
    'imageUrl': 'https://i.postimg.cc/BQMWr9B8/Image.png',
    'price': 7.99,
    'category': 'Frutas',
    'description':
        'A acerola é uma fruta tropical conhecida pelo seu sabor refrescante, '
        'levemente ácido e naturalmente adocicado. Rica em vitamina C e muito '
        'versátil, pode ser consumida in natura, utilizada em sucos, vitaminas, '
        'sobremesas e diversas receitas.\nIdeal para quem busca uma opção '
        'saborosa e nutritiva para o dia a dia. Produto selecionado para '
        'garantir qualidade, frescor e sabor.',
  },
  {
    'brand': 'Akatsu',
    'name': 'Banana',
    'imageUrl': 'https://i.postimg.cc/BQMWr9B8/Image.png',
    'price': 6.29,
    'category': 'Frutas',
    'description':
        'Banana doce e energética, colhida no ponto certo de maturação. Fonte '
        'natural de potássio, ótima para o pré-treino ou um lanche rápido a '
        'qualquer hora do dia.',
  },
  {
    'brand': 'Akatsu',
    'name': 'Morango',
    'imageUrl': 'https://i.postimg.cc/BQMWr9B8/Image.png',
    'price': 9.90,
    'category': 'Frutas',
    'description':
        'Morangos suculentos e adocicados, selecionados com todo cuidado. '
        'Perfeitos para consumir puros, em sobremesas, sucos ou vitaminas.',
  },
  {
    'brand': 'Pão & Cia',
    'name': 'Pão francês',
    'imageUrl': 'https://i.postimg.cc/8Pt82Qmf/Image-1.png',
    'price': 15.00,
    'category': 'Padaria',
    'description':
        'Pão francês fresquinho, assado diariamente, com casca crocante e '
        'miolo macio. O clássico companheiro do café da manhã brasileiro.',
  },
  {
    'brand': 'Pão & Cia',
    'name': 'Baguete',
    'imageUrl': 'https://i.postimg.cc/8Pt82Qmf/Image-1.png',
    'price': 8.75,
    'category': 'Padaria',
    'description':
        'Baguete artesanal de casca crocante e miolo aerado, feita com '
        'fermentação lenta para um sabor mais encorpado.',
  },
  {
    'brand': 'La Frontera',
    'name': 'Queijo Manchego',
    'imageUrl': 'https://i.postimg.cc/RVP8P1vw/Image-2.png',
    'price': 45.90,
    'category': 'Importados',
    'description':
        'Queijo Manchego espanhol, produzido com leite de ovelha e maturado '
        'para um sabor marcante e levemente adocicado. Ótimo para tábuas de '
        'frios e harmonizações.',
  },
  {
    'brand': 'La Frontera',
    'name': 'Chocolate Belga',
    'imageUrl': 'https://i.postimg.cc/BQMWr9B8/Image.png',
    'price': 32.00,
    'category': 'Importados',
    'description':
        'Chocolate belga de alta qualidade, com textura suave e sabor intenso. '
        'Perfeito para presentear ou para um momento especial de indulgência.',
  },

  // ----- Verduras -----
  {
    'brand': 'Horta Viva',
    'name': 'Rúcula',
    'imageUrl': 'https://i.postimg.cc/RVP8P1vw/Image-2.png',
    'price': 5.20,
    'category': 'Verduras',
    'description':
        'Rúcula de folhas tenras e sabor levemente picante. Combina bem com '
        'saladas, pizzas e massas, trazendo um toque marcante ao prato.',
  },
  {
    'brand': 'Horta Viva',
    'name': 'Couve manteiga',
    'imageUrl': 'https://i.postimg.cc/RVP8P1vw/Image-2.png',
    'price': 4.80,
    'category': 'Verduras',
    'description':
        'Couve manteiga fresca, de folhas verdes e macias. Rica em ferro e '
        'cálcio, é ótima refogada, em sucos verdes ou como acompanhamento.',
  },
  {
    'brand': 'Terra Nossa',
    'name': 'Espinafre',
    'imageUrl': 'https://i.postimg.cc/8Pt82Qmf/Image-1.png',
    'price': 6.90,
    'category': 'Verduras',
    'description':
        'Espinafre orgânico de folhas viçosas. Fonte de ferro e antioxidantes, '
        'perfeito para refogados, tortas e recheios.',
  },
  {
    'brand': 'Terra Nossa',
    'name': 'Brócolis ninja',
    'imageUrl': 'https://i.postimg.cc/8Pt82Qmf/Image-1.png',
    'price': 8.49,
    'category': 'Verduras',
    'description':
        'Brócolis ninja de talo tenro e floretes firmes. Versátil e nutritivo, '
        'vai bem no vapor, salteado no alho e óleo ou em gratinados.',
  },
  {
    'brand': 'Natural da terra',
    'name': 'Cenoura',
    'imageUrl': 'https://i.postimg.cc/RVP8P1vw/Image-2.png',
    'price': 5.99,
    'category': 'Verduras',
    'description':
        'Cenoura doce e crocante, colhida no ponto. Rica em betacaroteno, '
        'ótima ralada em saladas, em sopas, purês e bolos.',
  },

  // ----- Frutas -----
  {
    'brand': 'Sítio do Vale',
    'name': 'Manga Palmer',
    'imageUrl': 'https://i.postimg.cc/BQMWr9B8/Image.png',
    'price': 8.90,
    'category': 'Frutas',
    'description':
        'Manga Palmer madura, de polpa firme e sem fiapos. Doçura equilibrada '
        'e aroma intenso, ideal para consumo in natura, sucos e sobremesas.',
  },
  {
    'brand': 'Sítio do Vale',
    'name': 'Abacaxi pérola',
    'imageUrl': 'https://i.postimg.cc/BQMWr9B8/Image.png',
    'price': 11.50,
    'category': 'Frutas',
    'description':
        'Abacaxi pérola suculento, com equilíbrio entre doce e ácido. Refrescante '
        'puro, em sucos, caipirinhas ou grelhado.',
  },
  {
    'brand': 'Frutará',
    'name': 'Uva Thompson',
    'imageUrl': 'https://i.postimg.cc/BQMWr9B8/Image.png',
    'price': 14.90,
    'category': 'Frutas',
    'description':
        'Uva Thompson sem sementes, doce e crocante. Perfeita para lanches '
        'rápidos, saladas de frutas e tábuas de queijos.',
  },
  {
    'brand': 'Frutará',
    'name': 'Mamão papaya',
    'imageUrl': 'https://i.postimg.cc/BQMWr9B8/Image.png',
    'price': 7.30,
    'category': 'Frutas',
    'description':
        'Mamão papaya de polpa alaranjada e macia. Doce na medida certa, ótimo '
        'no café da manhã, com granola ou em vitaminas.',
  },
  {
    'brand': 'Akatsu',
    'name': 'Maçã Gala',
    'imageUrl': 'https://i.postimg.cc/BQMWr9B8/Image.png',
    'price': 9.20,
    'category': 'Frutas',
    'description':
        'Maçã Gala de casca vermelha e polpa crocante. Sabor adocicado e '
        'suculento, ideal para lanches, saladas e assados.',
  },

  // ----- Padaria -----
  {
    'brand': 'Forno de Minas',
    'name': 'Pão de queijo',
    'imageUrl': 'https://i.postimg.cc/8Pt82Qmf/Image-1.png',
    'price': 18.90,
    'category': 'Padaria',
    'description':
        'Pão de queijo tradicional mineiro, quentinho, com casca dourada e '
        'interior macio e puxento. Perfeito com café passado na hora.',
  },
  {
    'brand': 'Forno de Minas',
    'name': 'Broa de milho',
    'imageUrl': 'https://i.postimg.cc/8Pt82Qmf/Image-1.png',
    'price': 12.40,
    'category': 'Padaria',
    'description':
        'Broa de fubá levemente adocicada, com erva-doce e miolo úmido. '
        'Companhia clássica do cafezinho da tarde.',
  },
  {
    'brand': 'Vovó Palmira',
    'name': 'Bolo de fubá cremoso',
    'imageUrl': 'https://i.postimg.cc/8Pt82Qmf/Image-1.png',
    'price': 22.00,
    'category': 'Padaria',
    'description':
        'Bolo de fubá cremoso feito com receita de família. Massa úmida, sabor '
        'de milho verde e aquele aconchego de padaria de bairro.',
  },
  {
    'brand': 'Vovó Palmira',
    'name': 'Sonho de creme',
    'imageUrl': 'https://i.postimg.cc/8Pt82Qmf/Image-1.png',
    'price': 6.50,
    'category': 'Padaria',
    'description':
        'Sonho fofinho recheado com creme de baunilha e polvilhado com açúcar. '
        'Feito diariamente para o lanche da tarde.',
  },
  {
    'brand': 'Pão & Cia',
    'name': 'Pão integral',
    'imageUrl': 'https://i.postimg.cc/8Pt82Qmf/Image-1.png',
    'price': 13.90,
    'category': 'Padaria',
    'description':
        'Pão integral com grãos e sementes, de fermentação natural. Fonte de '
        'fibras, ideal para sanduíches e torradas do café da manhã.',
  },

  // ----- Importados -----
  {
    'brand': 'Mercato Italiano',
    'name': 'Azeite Extra Virgem',
    'imageUrl': 'https://i.postimg.cc/RVP8P1vw/Image-2.png',
    'price': 54.90,
    'category': 'Importados',
    'description':
        'Azeite de oliva extra virgem italiano, de acidez baixa e sabor '
        'frutado. Ideal para finalizar pratos, saladas e massas.',
  },
  {
    'brand': 'Mercato Italiano',
    'name': 'Massa Grano Duro',
    'imageUrl': 'https://i.postimg.cc/RVP8P1vw/Image-2.png',
    'price': 21.50,
    'category': 'Importados',
    'description':
        'Massa italiana de sêmola de grano duro, que mantém o ponto al dente e '
        'segura bem o molho. Base perfeita para receitas clássicas.',
  },
  {
    'brand': 'Le Gourmet',
    'name': 'Geleia de Frutas Vermelhas',
    'imageUrl': 'https://i.postimg.cc/BQMWr9B8/Image.png',
    'price': 28.90,
    'category': 'Importados',
    'description':
        'Geleia francesa de frutas vermelhas, com pedaços da fruta e menos '
        'açúcar. Ótima com torradas, queijos e sobremesas.',
  },
  {
    'brand': 'Le Gourmet',
    'name': 'Mostarda Dijon',
    'imageUrl': 'https://i.postimg.cc/BQMWr9B8/Image.png',
    'price': 24.00,
    'category': 'Importados',
    'description':
        'Mostarda Dijon tradicional, encorpada e picante na medida. Realça '
        'molhos, vinagretes, carnes e sanduíches.',
  },
  {
    'brand': 'La Frontera',
    'name': 'Jamón Serrano',
    'imageUrl': 'https://i.postimg.cc/RVP8P1vw/Image-2.png',
    'price': 89.90,
    'category': 'Importados',
    'description':
        'Jamón Serrano espanhol curado por longo período, de sabor intenso e '
        'textura macia. Indispensável em tábuas de frios e tapas.',
  },
];
