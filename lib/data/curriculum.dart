import '../models/unit.dart';
import '../models/question.dart';

Question pregunta(
  String enunciado,
  List<String> opciones,
  int correcta,
  String explicacion, [
  String? fuente,
]) => Question(
  q: enunciado,
  options: opciones,
  correct: correcta,
  exp: explicacion,
  fuente: fuente,
);

Lesson leccion(String id, String titulo, String teoria, List<Question> preguntas) =>
    Lesson(id: id, title: titulo, theoryText: teoria, questions: preguntas);

Unit unidad(
  String id,
  String titulo,
  String icono,
  String descripcion,
  List<Lesson> lecciones,
  List<Question> examen,
) => Unit(
  id: id,
  title: titulo,
  icon: icono,
  desc: descripcion,
  lessons: lecciones,
  exam: examen,
);

final curriculum = <Unit>[
  unidad(
    'u1',
    'Unidad 1: Nociones Generales',
    '📚',
    'Conceptos, ramas y sociedad de la información.',
    [
      leccion(
        'u1l1',
        'Normas jurídicas, derechos humanos y ramas del derecho',
        '''
Una norma jurídica es una regla de conducta obligatoria, exterior, bilateral y coercible. García Máynez, Austin y Kelsen la explican desde distintas perspectivas: Mandato del soberano, norma coercitiva y orden normativo jerárquico respectivamente.

Las normas pueden ser lato sensu (todas las reglas de conducta) o stricto sensu (las dictadas por el Estado). También se clasifican en naturales, positivas, públicas y privadas. El artículo 133 constitucional establece la jerarquía normativa: la Constitución, los tratados y las leyes federales.

Los derechos humanos son inherentes a la persona, universales, inalienables e indivisibles. Se fundamentan en la dignidad humana. Entre las ramas del derecho están la civil, penal, laboral, administrativa y mercantil.
''',
        [
          pregunta(
            '¿Qué es una norma jurídica?',
            ['Una opinión moral', 'Una regla de conducta obligatoria y coercible', 'Un contrato privado', 'Una costumbre sin sanción'],
            1,
            'La norma jurídica es obligatoria, exterior, bilateral y coercible.',
            '1.1.1 Alcances de las normas jurídicas.pdf',
          ),
          pregunta(
            '¿Qué establece el artículo 133 constitucional?',
            ['La libertad de expresión', 'La jerarquía normativa', 'El derecho al trabajo', 'La propiedad intelectual'],
            1,
            'El artículo 133 fija la jerarquía entre Constitución, tratados y leyes.',
            'CPEUM.pdf',
          ),
          pregunta(
            '¿Cuál es una característica esencial de los derechos humanos?',
            ['Son temporales', 'Son inherentes a la persona', 'Dependen del gobierno', 'Solo existen en México'],
            1,
            'Los derechos humanos son inherentes, universales e inalienables.',
            '1.1.2 Claves fundamentales de los derechos humanos.pdf',
          ),
          pregunta(
            '¿Qué rama del derecho regula las relaciones entre particulares?',
            ['Derecho penal', 'Derecho civil', 'Derecho administrativo', 'Derecho internacional público'],
            1,
            'El derecho civil regula personas, bienes y relaciones entre particulares.',
            '1.2 Ramas del derecho.pdf',
          ),
        ],
      ),
      leccion(
        'u1l2',
        'Sociedad de la información y brecha digital',
        '''
La sociedad de la información se caracteriza por el uso intensivo de las tecnologías de la información y la comunicación para crear, almacenar, distribuir y usar datos. Castells la explica como una sociedad organizada en redes; Drucker y Bell destacan el paso de la industria al conocimiento y los servicios.

Información y conocimiento no son iguales: la información son datos organizados; el conocimiento implica comprensión, interpretación y aplicación. La brecha digital es la desigualdad en el acceso, uso y aprovechamiento de las TIC.
''',
        [
          pregunta(
            '¿Cuál es la diferencia entre información y conocimiento?',
            ['Son sinónimos', 'El conocimiento implica comprensión y aplicación', 'La información es siempre privada', 'El conocimiento no se puede compartir'],
            1,
            'La información son datos; el conocimiento requiere interpretación y uso.',
            '1.4 La sociedad de la información y el conocimiento.pdf',
          ),
          pregunta(
            '¿Qué es la brecha digital?',
            ['Un cable roto', 'La desigualdad en el acceso y uso de las TIC', 'Un virus informático', 'Una pantalla antigua'],
            1,
            'La brecha digital separa a quienes tienen acceso a TIC de quienes no.',
            'Presentación 1.4 La sociedad de la información.pdf',
          ),
          pregunta(
            'Según Castells, ¿qué estructura la sociedad actual?',
            ['Las redes', 'Las fábricas', 'Los bancos', 'Las iglesias'],
            0,
            'Castells describe la sociedad red como núcleo de la era de la información.',
            '1.4 La sociedad de la información y el conocimiento.pdf',
          ),
        ],
      ),
      leccion(
        'u1l3',
        'Informática jurídica y derecho informático',
        '''
La informática jurídica es la técnica interdisciplinaria que aplica la computación a la recuperación, elaboración y análisis de información legal. Sus primeros antecedentes están en el Health Law Center de Pittsburgh: en 1959 se grabaron ordenamientos en cintas magnéticas y en 1960 se demostró el sistema ante la American Bar Association.

El derecho informático, en cambio, crea reglas para la tecnología. Entre sus denominaciones históricas están la jurimetría (Lee Loevinger, 1949) y la juscibernética (Mario G. Losano). Se distingue por ser multidisciplinario, dinámico, global, preventivo y sancionador, y por tener objeto propio.
''',
        [
          pregunta(
            '¿Qué es la informática jurídica?',
            ['Reparar computadoras', 'Aplicar la computación a la información legal', 'Crear leyes penales', 'Vender software'],
            1,
            'La informática jurídica usa herramientas computacionales en el ámbito legal.',
            '1.3 Derecho informático e informática jurídica (1).pdf',
          ),
          pregunta(
            '¿Quién creó el término jurimetría en 1949?',
            ['Lee Loevinger', 'Mario Losano', 'Manuel Castells', 'Peter Drucker'],
            0,
            'El juez estadounidense Lee Loevinger acuñó el término jurimetría.',
            '1.3 Derecho informático e informática jurídica (1).pdf',
          ),
          pregunta(
            '¿Cuál es una característica del derecho informático?',
            ['Es estático', 'Es multidisciplinario y dinámico', 'Solo estudia hardware', 'No tiene objeto propio'],
            1,
            'Es multidisciplinario, dinámico, global y de desarrollo continuo.',
            '1.6 Características fundamentales del derecho informático.pdf',
          ),
        ],
      ),
    ],
    [
      pregunta('El acceso a internet es considerado un:', ['Delito', 'Derecho Humano', 'Lujo', 'Software'], 1, 'Es un derecho humano digital indispensable.'),
      pregunta('¿Qué protegen los derechos digitales?', ['Solo computadoras', 'Los derechos humanos en internet', 'El software pirata', 'Las redes wifi'], 1, 'Garantizan la privacidad y libertad en el entorno digital.'),
      pregunta('El Derecho Informático es una rama:', ['Independiente', 'Del Derecho Público/Privado (transversal)', 'Inexistente', 'Solo de la ingeniería'], 1, 'Es transversal, aplica a todas las ramas del derecho.'),
      pregunta('¿Qué es la sociedad de la información?', ['Una red social', 'Una sociedad donde la creación y uso de datos es central', 'Una empresa', 'El internet'], 1, 'Se basa en el uso intensivo de las TIC para generar conocimiento.'),
      pregunta('Los peritos en derecho informático sirven para:', ['Hackear', 'Asesorar y peritar sobre tecnología en juicios', 'Vender PCs', 'Diseñar leyes'], 1, 'Son expertos que explican la tecnología a los jueces.'),
      pregunta('¿A qué se refiere la brecha digital?', ['Un cable roto', 'La desigualdad en el acceso a la tecnología', 'Un virus', 'Un tipo de pantalla'], 1, 'Es la diferencia entre quienes tienen acceso a TIC y quienes no.'),
      pregunta('La Constitución protege la libertad de expresión en internet mediante:', ['El Artículo 1', 'El Artículo 6', 'El Artículo 123', 'El Artículo 27'], 1, 'El Art. 6 garantiza la libre manifestación de ideas.'),
      pregunta('El uso de las TIC en el gobierno se denomina:', ['Gobierno Electrónico', 'Hacking', 'Cibernética', 'Software'], 0, 'Busca facilitar trámites y ser transparente.'),
      pregunta('¿Qué es un dato personal?', ['El clima', 'Cualquier información sobre una persona física identificada', 'Una contraseña', 'El nombre de una empresa'], 1, 'Es toda información que te identifica (nombre, CURP, huella).'),
      pregunta('El fin principal del Derecho Informático es:', ['Frenar la tecnología', 'Regular la tecnología para el bien común', 'Ganar dinero', 'Vender computadoras'], 1, 'Busca un equilibrio entre innovación y protección legal.'),
    ],
  ),

  unidad(
    'u2',
    'Unidad 2: Desafíos y Delitos',
    '💻',
    'Hacking, delitos penales y ética.',
    [
      leccion(
        'u2l1',
        'Derechos digitales y acceso a Internet',
        '''
Los derechos digitales son la proyección de los derechos humanos en el entorno tecnológico. Su base está en la Declaración Universal de Derechos Humanos, el Pacto Internacional de Derechos Civiles y Políticos (artículo 19) y la Convención Americana sobre Derechos Humanos (artículo 13).

El acceso a Internet se ha reconocido como un derecho humano digital: permite ejercer otros derechos, exige obligaciones estatales de respeto, protección y garantía, y debe ser universal, asequible y no discriminatorio.
''',
        [
          pregunta(
            '¿Qué artículo del PIDCP protege la libertad de expresión?',
            ['Artículo 1', 'Artículo 19', 'Artículo 27', 'Artículo 33'],
            1,
            'El artículo 19 del Pacto Internacional de Derechos Civiles y Políticos protege la libertad de expresión.',
            '2.1.2 Derecho en el entorno digital.pdf',
          ),
          pregunta(
            'El acceso a Internet como derecho humano digital implica que el Estado debe:',
            ['Vender banda ancha', 'Respetarlo, protegerlo y garantizarlo', 'Bloquear contenidos', 'Cobrar impuestos especiales'],
            1,
            'Las obligaciones estatales son respeto, protección y garantía.',
            '2.1.3 Derecho de acceso a Internet.pdf',
          ),
          pregunta(
            '¿Qué principio exige que el acceso a Internet no excluya a grupos?',
            ['No discriminación', 'Rentabilidad', 'Exclusividad', 'Censura'],
            0,
            'La no discriminación es parte del contenido esencial del derecho de acceso.',
            '2.1.3 Derecho de acceso a Internet.pdf',
          ),
        ],
      ),
      leccion(
        'u2l2',
        'Libertad de expresión y acceso a la información',
        '''
La libertad de expresión es un derecho humano con dimensión individual y social. Según la CNDH y la UNAM, protege Ideas, opiniones e información, e incluye el derecho a buscar, recibir y difundir informaciones.

Puede limitarse solo por razones legalmente establecidas, necesarias y proporcionales, como el respeto a los derechos de terceros, la seguridad nacional o el orden público. La censura previa está prohibida, pero sí existen responsabilidades ulteriores por abusos.
''',
        [
          pregunta(
            'La libertad de expresión tiene una dimensión:',
            ['Solo individual', 'Solo social', 'Individual y social', 'Solo institucional'],
            2,
            'Es un derecho individual y, a la vez, un elemento esencial de la democracia.',
            '2.1.5 Libertad de expresión (1).pdf',
          ),
          pregunta(
            '¿Qué está prohibida en materia de expresión?',
            ['La responsabilidad ulterior', 'La censura previa', 'La crítica al gobierno', 'La opinión política'],
            1,
            'La censura previa está prohibida; pueden existir responsabilidades posteriores.',
            '2.1.5 Libertad de expresión (1).pdf',
          ),
          pregunta(
            'Las limitaciones a la libertad de expresión deben ser:',
            ['Arbitrarias', 'Legales, necesarias y proporcionales', 'Secretas', 'Permanentes'],
            1,
            'Deben estar previstas en ley, ser necesarias y proporcionales.',
            '2.1.5 Libertad de expresión (1).pdf',
          ),
        ],
      ),
      leccion(
        'u2l3',
        'Delitos informáticos en el Código Penal Federal',
        '''
El Código Penal Federal dedica el Título Noveno, Capítulo II, a la revelación de secretos y al acceso ilícito a sistemas y equipos de informática. El artículo 211 bis 1 sanciona modificar, destruir o provocar pérdida de información sin autorización, así como conocer o copiar información protegida.

Los artículos siguientes distinguen entre sistemas particulares, del Estado y del sistema financiero, y entre acceso sin autorización y acceso autorizado pero indebido. También se estudian figuras como hacker, cracker, phishing, ransomware y grooming.
''',
        [
          pregunta(
            '¿Qué sanciona el artículo 211 bis 1 del CPF?',
            ['Vender computadoras', 'Modificar o destruir información sin autorización', 'Usar internet', 'Crear contratos'],
            1,
            'Sanciona modificar, destruir o provocar pérdida de información sin autorización.',
            '2.2 Delitos Informáticos (1).pdf',
          ),
          pregunta(
            '¿Qué conducta también se castiga en el artículo 211 bis 1?',
            ['Conocer o copiar información protegida sin autorización', 'Enviar correos', 'Descargar software libre', 'Abrir una cuenta'],
            0,
            'Conocer o copiar información de sistemas protegidos sin autorización es delito.',
            '2.2 Delitos Informáticos (1).pdf',
          ),
          pregunta(
            '¿Qué distingue al hacker de sombrero blanco?',
            ['Actúa sin permiso', 'Prueba sistemas con autorización', 'Crea ransomware', 'Hace grooming'],
            1,
            'El hacker ético trabaja con permiso para detectar vulnerabilidades.',
            '2.2 Delitos Informáticos.pdf',
          ),
        ],
      ),
    ],
    [
      pregunta("El 'Grooming' afecta principalmente a:", ['Bancos', 'Menores de edad', 'Gobiernos', 'Empresas'], 1, 'Es el acoso de adultos a niños en internet.'),
      pregunta("El 'Ransomware' se castiga como:", ['Un juego', 'Sabotaje y extorsión', 'Error de sistema', 'Falta administrativa'], 1, 'Secuestrar datos y pedir dinero es extorsión.'),
      pregunta('¿Qué es el derecho al olvido?', ['Olvidar contraseñas', 'Pedir que se borre información personal dañina en internet', 'Borrar la memoria RAM', 'No estudiar'], 1, 'Permite limpiar el historial digital negativo.'),
      pregunta('La suplantación de identidad es:', ['Legal', 'Un delito', 'Un juego', 'Un derecho'], 1, 'Hacerse pasar por otra persona es un delito penal.'),
      pregunta("El 'Ciberacoso' o 'Ciberbullying' es:", ['Un juego de niños', 'Violencia psicológica mediante medios digitales', 'Una red social', 'Un tipo de wifi'], 1, 'Es un delito y un problema grave de salud mental.'),
      pregunta("Un 'Hacker de sombrero blanco' es:", ['Un criminal', 'Un experto en seguridad que prueba sistemas con permiso', 'Un virus', 'Un político'], 1, 'Trabajan éticamente para encontrar fallos y proteger.'),
      pregunta("El 'Sabotaje informático' implica:", ['Dañar sistemas o datos', 'Arreglar PCs', 'Vender software', 'Navegar en internet'], 0, 'Destruir o alterar información ajena es un delito.'),
      pregunta("El 'Spam' es:", ['Correo basura', 'Un virus letal', 'Un hacker', 'Una ley'], 0, 'Aunque molesto, puede ser un delito si es masivo y engañoso.'),
      pregunta("El delito de 'Revelación de secretos' ocurre cuando:", ['Cuentas un chisme', 'Revelas datos confidenciales sin permiso', 'Hablas en clase', 'Publicas una foto'], 1, 'Se castiga la filtración de información confidencial.'),
      pregunta('La ética informática sirve para:', ['Evitar la cárcel', 'Guiar el uso correcto y justo de la tecnología', 'Hackear mejor', 'Ganar dinero'], 1, 'Son los principios morales del uso de la informática.'),
    ],
  ),

  unidad(
    'u3',
    'Unidad 3: Protección de Datos',
    '🔒',
    'LFPDPPP, Aviso de Privacidad y Derechos ARCO.',
    [
      leccion(
        'u3l1',
        'Privacidad, intimidad y derecho al olvido',
        '''
La intimidad protege el ámbito privado de la persona; la privacidad se relaciona con el control sobre la propia información. La protección de datos personales es un derecho humano reconocido en el artículo 16 constitucional y en tratados internacionales.

El habeas data permite al titular conocer, corregir o eliminar información sobre sí. El derecho al olvido digital consiste en suprimir o cancelar datos que ya no son pertinentes o que causan daño, sin desconocer el derecho a la información y la libertad de expresión.
''',
        [
          pregunta(
            '¿Qué es el derecho al olvido digital?',
            ['Borrar toda la historia de internet', 'Suprimir o cancelar información personal dañina o irrelevante', 'Olvidar contraseñas', 'Prohibir internet'],
            1,
            'Permite pedir la supresión de datos personales en ciertos casos.',
            '2.1.6 Derechos de la personalidad (1).pdf',
          ),
          pregunta(
            '¿Qué protege el habeas data?',
            ['El hardware', 'Los datos personales del titular', 'Las patentes', 'El software'],
            1,
            'El habeas data garantiza control sobre la información personal.',
            '2.1.6 Derechos de la personalidad (1).pdf',
          ),
          pregunta(
            'La privacidad se refiere principalmente a:',
            ['La velocidad de internet', 'El control sobre la propia información', 'El precio de los dispositivos', 'La propiedad industrial'],
            1,
            'La privacidad implica autodeterminación informativa.',
            '2.1.6 Derechos de la personalidad (1).pdf',
          ),
        ],
      ),
      leccion(
        'u3l2',
        'LFPDPPP y derechos ARCO',
        '''
La Ley Federal de Protección de Datos Personales en Posesión de los Particulares regula el tratamiento de datos por empresas y personas físicas con fines comerciales o profesionales. Exige un aviso de privacidad que explique qué datos se recaban y para qué se usan.

Los derechos ARCO son Acceso (conocer los datos), Rectificación (corregirlos), Cancelación (borrarlos) y Oposición (negar un uso específico). También existe la revocación del consentimiento. El responsable debe responder la solicitud en un máximo de 20 días hábiles.
''',
        [
          pregunta(
            'La A de los derechos ARCO significa:',
            ['Acceso', 'Aprobación', 'Archivo', 'Auditoría'],
            0,
            'Acceso permite conocer qué datos tiene la empresa sobre ti.',
            '3.1.3 LFPDPPP.pdf',
          ),
          pregunta(
            '¿Qué derecho permite corregir datos inexactos?',
            ['Acceso', 'Rectificación', 'Cancelación', 'Oposición'],
            1,
            'La R de ARCO corresponde a Rectificación.',
            '3.1.3 LFPDPPP.pdf',
          ),
          pregunta(
            '¿En cuánto tiempo debe responder una solicitud ARCO el responsable?',
            ['5 días', '20 días hábiles', '6 meses', '1 año'],
            1,
            'La ley establece un máximo de 20 días hábiles.',
            '3.1.3 LFPDPPP.pdf',
          ),
        ],
      ),
      leccion(
        'u3l3',
        'Transparencia y marco constitucional vigente',
        '''
El artículo 6 constitucional garantiza el derecho de acceso a la información pública y la protección de datos personales. La reforma de 2025 transformó la autoridad en materia de transparencia: el INAI fue extinguido y sus funciones pasaron a la Secretaría Anticorrupción y Buen Gobierno.

La LGPDPPSO, vigente desde 2025, regula la protección de datos en poder de los sujetos obligados, mientras que la LGTAIP regula el acceso a la información. Ambas conviven con la LFPDPPP para el sector privado.
''',
        [
          pregunta(
            '¿Qué artículo constitucional protege el acceso a la información y los datos personales?',
            ['Artículo 1', 'Artículo 6', 'Artículo 27', 'Artículo 123'],
            1,
            'El artículo 6 constitucional reconoce ambos derechos.',
            'CPEUM.pdf',
          ),
          pregunta(
            'Tras la reforma de 2025, ¿qué autoridad asumió funciones de transparencia?',
            ['El INAI', 'La Secretaría Anticorrupción y Buen Gobierno', 'El SAT', 'El IMSS'],
            1,
            'El INAI fue extinguido y sus funciones se trasladaron a la Secretaría Anticorrupción y Buen Gobierno.',
            '3.1.2 LGPDPPSO.pdf',
          ),
          pregunta(
            '¿Qué ley regula los datos en poder de sujetos obligados?',
            ['LFPDPPP', 'LGPDPPSO', 'LFDA', 'LFPPI'],
            1,
            'La LGPDPPSO aplica a los sujetos obligados del sector público.',
            '3.1.2 LGPDPPSO.pdf',
          ),
        ],
      ),
    ],
    [
      pregunta('Los datos de salud o huella digital son:', ['Públicos', 'Datos sensibles', 'Basura', 'Anónimos'], 1, 'Requieren protección especial por ley.'),
      pregunta("El 'Aviso de Privacidad' es:", ['Un correo', 'Documento que explica el uso de tus datos', 'Una ley', 'Una multa'], 1, 'Es obligatorio para las empresas.'),
      pregunta('¿Qué pasa si una empresa filtra tus datos?', ['Nada', 'Debe notificarte y puede ser multada', 'Te dan dinero', 'Es normal'], 1, 'La ley obliga a notificar brechas de seguridad.'),
      pregunta('El derecho a corregir un dato erróneo se llama:', ['Acceso', 'Rectificación', 'Cancelación', 'Oposición'], 1, 'La R de los Derechos ARCO es Rectificación.'),
      pregunta('La LFPDPPP aplica a:', ['Solo al gobierno', 'Empresas privadas', 'Solo a bancos', 'Solo a escuelas públicas'], 1, 'Regula a los particulares.'),
      pregunta("El 'Consentimiento' para usar tus datos debe ser:", ['Falso', 'Expreso e informado', 'Invisible', 'Obligatorio'], 1, 'Debes saber para qué usan tus datos.'),
      pregunta("¿Qué es el 'Derecho de Oposición' (ARCO)?", ['Negarte a que usen tus datos', 'Oponerte a una ley', 'Quejarte del internet', 'Pelear con el jefe'], 0, 'Te permite negar el uso de tus datos para ciertos fines.'),
      pregunta('Los datos personales son:', ['Cualquier información sobre una persona', 'Solo el nombre', 'Solo la CURP', 'Las contraseñas'], 0, 'Es cualquier información que te identifique.'),
      pregunta('La autoridad que regula la LFPDPPP es el:', ['INAI', 'SAT', 'Policía', 'IMSS'], 0, 'El Instituto Nacional de Transparencia (INAI).'),
      pregunta('El manejo de datos debe seguir el principio de:', ['Licitud', 'Mentira', 'Venta', 'Ocultamiento'], 0, 'La licitud significa que debe ser legal.'),
    ],
  ),

  unidad(
    'u4',
    'Unidad 4: Propiedad Intelectual',
    '©️',
    'Derechos de autor, software y piratería.',
    [
      leccion(
        'u4l1',
        'Propiedad intelectual: autor y propiedad industrial',
        '''
La propiedad intelectual se divide en dos grandes ramas: el derecho de autor, que protege obras literarias, artísticas, científicas y programas informáticos, y la propiedad industrial, que protege marcas, patentes y diseños.

En México, la propiedad intelectual ha sido reconocida como derecho humano. Su objetivo es estimular la creación garantizando a los autores e inventores beneficios sobre sus obras, sin desconocer el interés público y el acceso al conocimiento.
''',
        [
          pregunta(
            '¿Cuáles son las dos grandes ramas de la propiedad intelectual?',
            ['Derecho de autor y propiedad industrial', 'Derecho penal y civil', 'Marcas y contratos', 'Patentes y software'],
            0,
            'La propiedad intelectual comprende derecho de autor y propiedad industrial.',
            '2.1.7 Propiedad Intelectual (1).pdf',
          ),
          pregunta(
            '¿Qué protege el derecho de autor?',
            ['Marcas comerciales', 'Obras y programas informáticos', 'Patentes de invención', 'Nombres de dominio'],
            1,
            'Protege obras de autor, incluido el software como obra literaria.',
            '2.1.7 Propiedad Intelectual (1).pdf',
          ),
          pregunta(
            '¿Qué protege la propiedad industrial?',
            ['Obras literarias', 'Marcas y patentes', 'Derechos morales', 'Libertad de expresión'],
            1,
            'Marcas, patentes y diseños industriales son objeto de propiedad industrial.',
            '3.2.1 Ley Federal de Protección a la Propiedad Industrial.pdf',
          ),
        ],
      ),
      leccion(
        'u4l2',
        'Ley Federal de Derechos de Autor',
        '''
La Ley Federal de Derechos de Autor protege las obras desde su creación. El software y los programas con inteligencia artificial se protegen como obras literarias. El registro ante INDAUTOR es opcional pero otorga presunción de titularidad.

Los derechos se dividen en morales, que reconocen la paternidad y la integridad de la obra, y patrimoniales, que permiten reproducir, distribuir, modificar y comunicar la obra. Los derechos patrimoniales duran toda la vida del autor y 100 años más.
''',
        [
          pregunta(
            '¿Cómo se protege el software en México?',
            ['Como una patente', 'Como una obra literaria', 'Como una marca', 'Como un secreto industrial'],
            1,
            'Los programas informáticos se protegen como obras literarias.',
            '3.2.2 Ley Federal de Derechos de Autor.pdf',
          ),
          pregunta(
            '¿Qué institución registra las obras de autor en México?',
            ['IMPI', 'INDAUTOR', 'INAI', 'SAT'],
            1,
            'INDAUTOR es el registro público del derecho de autor.',
            '3.2.2 Ley Federal de Derechos de Autor.pdf',
          ),
          pregunta(
            '¿Cuál es la duración de los derechos patrimoniales en México?',
            ['10 años', '50 años', 'Vida del autor + 100 años', 'Para siempre'],
            2,
            'El plazo es toda la vida del autor y 100 años posteriores a su muerte.',
            '3.2.2 Ley Federal de Derechos de Autor.pdf',
          ),
        ],
      ),
      leccion(
        'u4l3',
        'Propiedad industrial: IMPI, marcas y patentes',
        '''
El Instituto Mexicano de la Propiedad Industrial (IMPI) administra marcas, patentes y modelos de utilidad. Una marca distingue productos o servicios en el mercado; una patente protege una invención técnica nueva, inventiva y susceptible de aplicación industrial.

La Ley Federal de Protección a la Propiedad Industrial prevé procedimientos de inspección y sanciones. La falsificación de marcas y la venta de productos pirateados pueden constituir delitos.
''',
        [
          pregunta(
            '¿Qué institución administra marcas y patentes en México?',
            ['IMPI', 'INDAUTOR', 'SAT', 'CONACYT'],
            0,
            'El IMPI es el Instituto Mexicano de la Propiedad Industrial.',
            '3.2.1 Ley Federal de Protección a la Propiedad Industrial.pdf',
          ),
          pregunta(
            '¿Qué protege una patente?',
            ['Una obra artística', 'Una invención técnica', 'Una marca comercial', 'Un artículo periodístico'],
            1,
            'La patente protege invenciones técnicas nuevas e inventivas.',
            '3.2.1 Ley Federal de Protección a la Propiedad Industrial.pdf',
          ),
          pregunta(
            '¿Qué función cumple una marca?',
            ['Proteger una invención', 'Distinguir productos o servicios', 'Regular datos personales', 'Sancionar delitos'],
            1,
            'La marca identifica y distingue productos o servicios en el mercado.',
            '3.2.1 Ley Federal de Protección a la Propiedad Industrial.pdf',
          ),
        ],
      ),
    ],
    [
      pregunta('El uso de software pirata en una empresa se castiga en el artículo:', ['211 bis', '231 LFDA', '123', '5'], 1, 'El Art. 231 de la LFDA castiga la piratería.'),
      pregunta("Una licencia 'Open Source' (código abierto) significa:", ['Es ilegal', 'Puedes usarlo, modificarlo y distribuirlo libremente', 'Es gratis pero privado', 'Es de pago'], 1, 'Fomenta la colaboración y el acceso al código.'),
      pregunta('Copiar código de GitHub sin respetar la licencia es:', ['Bueno', 'Plagio y violación de derechos de autor', 'Legal', 'Normal'], 1, 'Siempre debes respetar la licencia (MIT, GPL, etc.).'),
      pregunta('El IMPI protege:', ['Derechos de autor', 'Propiedad Industrial (Marcas y Patentes)', 'El internet', 'La piratería'], 1, 'El IMPI se encarga de marcas y patentes.'),
      pregunta('¿Qué es una patente de software?', ['Un código', 'La protección de una invención técnica implementada por software', 'Un virus', 'Una página web'], 1, 'Protege la funcionalidad técnica innovadora.'),
      pregunta("El 'Copyright' protege:", ['La idea', 'La expresión de la idea (el código, el texto)', 'Nada', 'El hardware'], 1, 'No protege ideas, sino cómo las expresas.'),
      pregunta('Comprar un CD de software pirata es:', ['Legal', 'Un delito', 'Un derecho', 'Una estafa'], 1, 'La adquisición de piratería también es sancionada.'),
      pregunta('¿Cuánto dura el derecho patrimonial de autor en México?', ['10 años', '100 años', 'Toda la vida del autor + 100 años', 'Para siempre'], 2, 'Protege a los herederos por 100 años tras la muerte.'),
      pregunta("Una 'Marca' (logo) protege:", ['El código', 'La identidad comercial de un producto', 'El internet', 'Las ideas'], 1, 'Registrada en el IMPI para distinguir productos.'),
      pregunta("El 'Software Libre' significa:", ['Gratis siempre', 'Libertad de uso, estudio y modificación', 'Ilegal', 'Sin autor'], 1, 'Se refiere a la libertad, no al precio (puede ser de pago).'),
    ],
  ),

  unidad(
    'u5',
    'Unidad 5: Ciberseguridad',
    '🛡️',
    'Peritaje, forense y contratos.',
    [
      leccion(
        'u5l1',
        'Ciberseguridad y delitos informáticos',
        '''
Los delitos informáticos pueden ser típicos, cuando están descritos en una norma penal, o atípicos, cuando tus conductas se ajustan a otros delitos tradicionales. Su naturaleza global exige cooperación internacional y medidas de prevención.

Entre las conductas frecuentes están el acceso no autorizado, el sabotaje, la interceptación de datos y el uso de malware. La ciberseguridad combina tecnología, procesos y personas: el factor humano suele ser el eslabón más débil.
''',
        [
          pregunta(
            '¿Qué es un delito informático típico?',
            ['El que no tiene ley', 'El que está descrito en una norma penal', 'El que comete una máquina', 'El que no causa daño'],
            1,
            'Un delito típico tiene una descripción legal precisa.',
            '2.2 Delitos Informáticos (1).pdf',
          ),
          pregunta(
            '¿Cuál es una conducta frecuente en delitos informáticos?',
            ['Acceso no autorizado a sistemas', 'Comprar un libro', 'Enviar una carta', 'Pintar una pared'],
            0,
            'El acceso no autorizado es una de las conductas principales.',
            '2.2 Delitos Informáticos (1).pdf',
          ),
          pregunta(
            '¿Por qué se requiere cooperación internacional?',
            ['Porque los delitos son globales', 'Porque todos usan correo', 'Porque hay pocas leyes', 'Porque el internet es gratis'],
            0,
            'Los delitos informáticos cruzan fronteras y requieren coordinación internacional.',
            '2.2 Delitos Informáticos (1).pdf',
          ),
        ],
      ),
      leccion(
        'u5l2',
        'Peritaje, evidencia digital y contratos',
        '''
El perito informático es un experto que extrae y analiza evidencia digital preservando su integridad. La cadena de custodia documenta quién recolectó, transportó y examinó cada pieza para que la prueba sea válida en juicio.

La evidencia digital es frágil y fácil de alterar. Por eso se usan protocolos estrictos. Los contratos tecnológicos también importan: el SLA define niveles de servicio y responsabilidades, y el NDA protege la confidencialidad.
''',
        [
          pregunta(
            '¿Para qué sirve la cadena de custodia?',
            ['Vender evidencia', 'Garantizar que la evidencia no se altere', 'Borrar datos', 'Acusar sin prueba'],
            1,
            'La cadena de custodia preserva la integridad de la evidencia digital.',
            '2.2 Delitos Informáticos (1).pdf',
          ),
          pregunta(
            '¿Cómo es la evidencia digital?',
            ['Indestructible', 'Frágil y fácil de alterar', 'Siempre visible', 'De papel'],
            1,
            'Por su fragilidad requiere protocolos estrictos de recolección.',
            '2.2 Delitos Informáticos (1).pdf',
          ),
          pregunta(
            '¿Qué regula la norma ISO 27001?',
            ['La seguridad de la información', 'La piratería de software', 'El comercio electrónico', 'Los derechos de autor'],
            0,
            'ISO 27001 es el estándar de gestión de seguridad de la información.',
            '1.8 Asociaciones mexicanas regulatorias.pdf',
          ),
        ],
      ),
      leccion(
        'u5l3',
        'Gobierno electrónico y soberanía digital',
        '''
El gobierno electrónico usa tecnologías digitales para simplificar trámites, mejorar servicios y aumentar la transparencia. Enfrenta brechas territoriales, de capacidades humanas y de confianza.

La soberanía digital alude al control de datos, infraestructura y decisiones tecnológicas de un Estado. Las asociaciones regulatorias y los estándares de ciberseguridad ayudan a ordenar este entorno.
''',
        [
          pregunta(
            '¿Qué busca el gobierno electrónico?',
            ['Hackear ciudadanos', 'Facilitar trámites y ser transparente', 'Vender datos', 'Aumentar impuestos'],
            1,
            'El gobierno electrónico mejora la relación Estado-ciudadano con TIC.',
            'Presentación general.pdf',
          ),
          pregunta(
            '¿Qué es la soberanía digital?',
            ['Tener Many redes sociales', 'Controlar datos, infraestructura y decisiones tecnológicas', 'Usar solo software extranjero', 'Prohibir internet'],
            1,
            'La soberanía digital implica autonomía sobre datos y tecnología.',
            'Presentación general.pdf',
          ),
          pregunta(
            '¿Cuál es una brecha del gobierno electrónico?',
            ['La falta de confianza', 'El exceso de datos', 'La falta de usuarios', 'El precio del papel'],
            0,
            'La confianza, junto con la cobertura y capacidades, es una brecha importante.',
            'Presentación general.pdf',
          ),
        ],
      ),
    ],
    [
      pregunta('El perito informático debe ser:', ['Un hacker', 'Un experto certificado', 'Un juez', 'Un policía'], 1, 'Necesita aval técnico y legal.'),
      pregunta('Un contrato SLA significa:', ['Nivel de Servicio', 'Sistema Legal de Autor', 'Software Libre', 'Seguridad de Alto Nivel'], 0, 'Service Level Agreement (Acuerdo de Nivel de Servicio).'),
      pregunta('El análisis forense se hace sobre:', ['Evidencia digital (discos, RAM, móviles)', 'Papel', 'Personas', 'Edificios'], 0, 'Busca rastros en dispositivos electrónicos.'),
      pregunta('Si una empresa de TI falla en su servicio por un hackeo, el SLA determina:', ['Quién es el culpable y las penalizaciones', 'El clima', 'La velocidad de internet', 'El código'], 0, 'Define las responsabilidades legales y económicas.'),
      pregunta('Un NDA (Non-Disclosure Agreement) sirve para:', ['Proteger secretos comerciales', 'Vender software', 'Hackear', 'Navegar'], 0, 'Es un acuerdo de confidencialidad.'),
      pregunta('La evidencia digital es:', ['Frágil y fácil de alterar', 'Indestructible', 'Inútil', 'De papel'], 0, 'Por eso requiere protocolos estrictos de recolección.'),
      pregunta('El ciberespacio es:', ['Un lugar físico', 'El entorno digital de interconexión', 'Una nube', 'Un servidor'], 1, 'Es el ámbito donde ocurren las interacciones digitales.'),
      pregunta('La norma ISO 27001 regula:', ['La calidad del software', 'La Seguridad de la Información (SGSI)', 'La piratería', 'El internet'], 1, 'Es el estándar internacional de ciberseguridad corporativa.'),
      pregunta("Un 'fallo de seguridad' en una app debe ser:", ['Ocultado', 'Reportado y corregido', 'Vendido', 'Ignorado'], 1, 'La ética exige reportar brechas para proteger a los usuarios.'),
      pregunta("El 'Hackeo Ético' se hace con:", ['Malicia', 'Autorización y contrato', 'Anonimato', 'Dinero falso'], 1, 'Se debe tener permiso escrito para probar sistemas.'),
    ],
  ),

  unidad(
    'u6',
    'Unidad 6: Firma y Comercio',
    '✍️',
    'FIEL, comercio electrónico y LFEA.',
    [
      leccion(
        'u6l1',
        'Teoría: La FIEL y el e-Commerce',
        '''
La Firma Electrónica Avanzada (FIEL) tiene la misma validez que la firma autógrafa conforme a la Ley Federal de Firma Electrónica Avanzada (LFEA, artículo 7). Se tramita principalmente en el SAT y usa criptografía de llave pública y privada.

El comercio electrónico está regulado por el Código de Comercio, que protege al consumidor en compras en línea. Los términos y condiciones forman un contrato de adhesión y el derecho de retracto permite devolver productos en ciertos plazos.
''',
        [
          pregunta('¿La FIEL es válida legalmente?', ['No', 'Sí, tiene plena validez', 'Solo en el SAT', 'Solo en bancos'], 1, 'La LFEA le da efectos jurídicos plenos.'),
          pregunta('La LFEA regula:', ['La Firma Electrónica Avanzada', 'Los delitos informáticos', 'Los derechos de autor', 'El teletrabajo'], 0, 'La Ley Federal de Firma Electrónica Avanzada da validez a la FIEL.'),
          pregunta('Un certificado digital lo emite:', ['Un hacker', 'Una Autoridad Certificadora', 'El usuario', 'Un banco cualquiera'], 1, 'Las autoridades certificadoras validan la identidad.'),
          pregunta('La FIEL se tramita principalmente en el:', ['SAT', 'IMSS', 'INAI', 'Banco'], 0, 'El Servicio de Administración Tributaria la emite.'),
        ],
      ),
      leccion(
        'u6l2',
        'Firma electrónica y certificados digitales',
        '''
La firma electrónica simple, como un escaneo de la firma, ofrece menor seguridad que la FIEL porque no garantiza criptográficamente la identidad. La FIEL usa un certificado digital emitido por una autoridad certificadora.

La criptografía asimétrica emplea una llave privada, que solo conoce el titular, y una llave pública, que permite verificar la firma. Esto da integridad, autenticidad y no repudio.
''',
        [
          pregunta('La FIEL utiliza criptografía de:', ['Llave pública y privada', 'Papel', 'Lápiz', 'Voz'], 0, 'Usa cifrado asimétrico para verificar identidad.'),
          pregunta('La firma electrónica simple es:', ['Más segura que la FIEL', 'Menos segura y con menos validez', 'Igual que la FIEL', 'Ilegal siempre'], 1, 'No garantiza identidad de forma criptográfica.'),
          pregunta('El certificado digital valida:', ['La identidad del titular', 'El precio del producto', 'La velocidad de internet', 'El color de la página'], 0, 'La autoridad certificadora confirma la identidad del titular.'),
        ],
      ),
      leccion(
        'u6l3',
        'Comercio electrónico y protección al consumidor',
        '''
Las compras en línea se rigen por el Código de Comercio y la legislación de protección al consumidor. La publicidad engañosa y el phishing son conductas ilícitas en este entorno.

Los términos y condiciones obligan a la empresa y al usuario porque forman un contrato de adhesión. El derecho de retracto permite al consumidor devolver el producto durante el plazo legal sin necesidad de justificar su decisión.
''',
        [
          pregunta('Comprar en Amazon o Mercado Libre está regulado por:', ['Código de Comercio', 'Código Penal', 'Ley de la Gravedad', 'Ninguna'], 0, 'El Código de Comercio regula el comercio electrónico.'),
          pregunta("El derecho de 'retracto' en compras online permite:", ['Devolver el producto', 'No pagar', 'Hackear la tienda', 'Quejarse'], 0, 'Permite devolver el producto en un plazo determinado.'),
          pregunta('Los términos y condiciones de una web:', ['Son opcionales', 'Obligan a usuario y empresa', 'Son basura', 'Nadie los lee'], 1, 'Forman un contrato de adhesión válido.'),
        ],
      ),
    ],
    [
      pregunta('La LFEA significa:', ['Ley Federal de Firma Electrónica Avanzada', 'Ley de Firmas', 'Ley de Internet', 'Ley de Comercio'], 0, 'Es la ley que regula la FIEL.'),
      pregunta('Comprar en Amazon o Mercado Libre está regulado por:', ['Código de Comercio', 'Código Penal', 'Ley de la Gravedad', 'Ninguna'], 0, 'El Código de Comercio regula el e-commerce.'),
      pregunta('Un certificado digital es emitido por:', ['Un hacker', 'Una Autoridad Certificadora', 'El gobierno', 'El usuario'], 1, 'Empresas autorizadas que validan la identidad.'),
      pregunta("El derecho de 'retracto' en compras online permite:", ['Devolver el producto', 'No pagar', 'Hackear la tienda', 'Quejarse'], 0, 'Puedes devolverlo en un plazo si no te gusta.'),
      pregunta('La firma electrónica simple (ej. un escaneo) es:', ['Más segura que la FIEL', 'Menos segura y con menos validez legal', 'Igual', 'Ilegal'], 1, 'No garantiza la identidad de forma criptográfica.'),
      pregunta('La FIEL utiliza criptografía de:', ['Llave pública y privada', 'Papel', 'Lápiz', 'Voz'], 0, 'Usa cifrado asimétrico (RSA).'),
      pregunta('El phishing en comercio electrónico busca:', ['Robar datos de tarjetas', 'Vender ropa', 'Hacer publicidad', 'Mejorar la app'], 0, 'Se hacen pasar por tiendas reales para robar datos bancarios.'),
      pregunta('Los términos y condiciones de una web:', ['Son opcionales', 'Obligan al usuario y a la empresa (contrato)', 'Son basura', 'Nadie los lee'], 1, 'Forman un contrato de adhesión válido legalmente.'),
      pregunta('Un delito en el comercio electrónico es:', ['Publicidad engañosa', 'Precios bajos', 'Envíos rápidos', 'Buen servicio'], 0, 'Es una violación a la Ley del Consumidor.'),
      pregunta('La FIEL se tramita principalmente en el:', ['SAT', 'IMSS', 'INAI', 'Banco'], 0, 'El Servicio de Administración Tributaria la emite.'),
    ],
  ),

  unidad(
    'u7',
    'Unidad 7: Nuevas Tecnologías',
    '🤖',
    'IA, teletrabajo y gobierno digital.',
    [
      leccion(
        'u7l1',
        'Teoría: IA y Teletrabajo',
        '''
La Inteligencia Artificial es una herramienta: no tiene personalidad jurídica. La responsabilidad por sus errores recae en quienes la diseñan, entrenan, poseen o usan. Los sistemas de caja negra plantean problemas de explicabilidad.

El teletrabajo está regulado en el artículo 311 de la Ley Federal del Trabajo. El patrón debe proveer los medios tecnológicos y respetar la desconexión digital, es decir, el derecho del trabajador a no responder fuera de su jornada.
''',
        [
          pregunta('Si una IA comete un error, ¿quién es responsable legalmente?', ['La IA', 'Los humanos creadores o dueños', 'Nadie', 'El internet'], 1, 'La IA es una herramienta, la responsabilidad es humana.'),
          pregunta('El teletrabajo en la LFT se regula en el artículo:', ['311', '123', '1', '5'], 0, 'El Art. 311 de la LFT regula el teletrabajo.'),
          pregunta('El derecho a no trabajar fuera de horario se llama:', ['Desconexión digital', 'Teletrabajo', 'Sesgo algorítmico', 'Ciberespacio'], 0, 'Protege al trabajador del burnout.'),
          pregunta('La IA no tiene personalidad jurídica, por lo que la responsabilidad es:', ['De la máquina', 'De los humanos', 'Del algoritmo', 'Nula'], 1, 'Quienes crean o usan la herramienta responden por ella.'),
        ],
      ),
      leccion(
        'u7l2',
        'Gobierno electrónico y ciudadanía digital',
        '''
El gobierno electrónico utiliza TIC para acercar servicios, simplificar trámites y fortalecer la transparencia. La ciudadanía digital implica usar la tecnología de forma ética, segura y responsable.

La ciberseguridad ya no es solo responsabilidad del área de TI: todas las personas pueden ser víctimas de ingeniería social. Los algoritmos opacos dificultan comprender decisiones automatizadas.
''',
        [
          pregunta('El Gobierno Electrónico busca:', ['Hackear a los ciudadanos', 'Facilitar trámites y ser transparente', 'Subir impuestos', 'Vender datos'], 1, 'Usa TIC para mejorar la relación Estado-ciudadano.'),
          pregunta("La 'Ciudadanía Digital' implica:", ['Tener redes sociales', 'Uso ético, seguro y responsable de la tecnología', 'Votar online', 'Tener celular'], 1, 'Es un concepto de derechos y deberes en la red.'),
          pregunta('La Ciberseguridad es responsabilidad de:', ['Solo el área de TI', 'Todos', 'Los hackers', 'El gobierno'], 1, 'Las personas son el eslabón más débil ante la ingeniería social.'),
        ],
      ),
      leccion(
        'u7l3',
        'Sesgos, deepfakes y regulación de IA',
        '''
El sesgo algorítmico aparece cuando un sistema reproduce discriminaciones presentes en los datos con los que se entrena. Un deepfake puede violar el honor o la identidad de una persona si se usa para difamar o suplantar.

En México aún no existe una ley específica y general de inteligencia artificial: el tema está en debate y se atiende con marcos éticos y leyes existentes como la LFPDPPP y la LFDA.
''',
        [
          pregunta('El sesgo algorítmico en una IA es:', ['Un bug de programación', 'Discriminación reproducida por datos erróneos', 'Una virtud', 'Un tipo de hardware'], 1, 'La IA aprende de datos históricos que pueden ser discriminatorios.'),
          pregunta('Los algoritmos de caja negra son problemáticos porque:', ['Son rápidos', 'No se puede explicar cómo toman decisiones', 'Son caros', 'Son antiguos'], 1, 'Falta transparencia y explicabilidad.'),
          pregunta("Un 'Deepfake' puede ser un delito si:", ['Se usa para difamar o suplantar', 'Es un video chistoso', 'Se comparte', 'Se vende'], 0, 'Atenta contra el honor y la identidad de las personas.'),
        ],
      ),
    ],
    [
      pregunta("La 'desconexión digital' en el teletrabajo significa:", ['Apagar el wifi', 'Derecho a no trabajar fuera de horario', 'No usar redes sociales', 'No contestar al jefe'], 1, 'Es un derecho para evitar el burnout.'),
      pregunta('El sesgo algorítmico en una IA es:', ['Un bug de programación', 'Discriminación reproducida por datos erróneos', 'Una virtud', 'Un tipo de hardware'], 1, 'La IA aprende de datos históricos que pueden ser discriminatorios.'),
      pregunta('El Gobierno Electrónico busca:', ['Hackear a los ciudadanos', 'Facilitar trámites y ser transparente', 'Subir impuestos', 'Vender datos'], 1, 'Usa TIC para mejorar la relación Estado-ciudadano.'),
      pregunta('La Ciberseguridad es responsabilidad de:', ['Solo el área de TI', 'Todos (humanos son el eslabón más débil)', 'Los hackers', 'El gobierno'], 1, 'La ingeniería social ataca a las personas.'),
      pregunta('Los algoritmos de caja negra en IA son problemáticos porque:', ['Son rápidos', 'No se puede explicar cómo toman decisiones', 'Son caros', 'Son antiguos'], 1, 'Falta transparencia (explicabilidad).'),
      pregunta('La LFT regula el teletrabajo en el artículo:', ['311', '123', '1', '5'], 0, 'El Art. 311 de la LFT regula las condiciones del teletrabajo.'),
      pregunta('El derecho a la privacidad en el trabajo significa:', ['No trabajar', 'Que el jefe no puede espiar tus chats personales', 'Usar el celular', 'Nada'], 1, 'Hay límites a la vigilancia del patrón.'),
      pregunta("La 'Ciudadanía Digital' implica:", ['Tener redes sociales', 'Uso ético, seguro y responsable de la tecnología', 'Votar online', 'Tener celular'], 1, 'Es un concepto de derechos y deberes en la red.'),
      pregunta("Un 'Deepfake' puede ser un delito si:", ['Se usa para difamar o suplantar', 'Es un video chistoso', 'Se comparte', 'Se vende'], 0, 'Atenta contra el honor y la identidad de las personas.'),
      pregunta('La regulación de la IA en México es actualmente:', ['Inexistente y en debate', 'Perfecta', 'Prohibida', 'Muy antigua'], 0, 'Aún no hay una ley específica, se usan marcos éticos y leyes existentes.'),
    ],
  ),
];
