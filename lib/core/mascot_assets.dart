enum MascotEstado {
  inicio, derecho, aprendiendo, estudiando, concentrado, unidad,
  quiz, quizUnidad, quizFinal, correcto, incorrecto, sinVidas,
  descanso, recompensa, logro, nuevaUnidad, seguir, finalizado, situacion,
}

const Map<MascotEstado, String> mascotAssets = {
  MascotEstado.inicio:     'assets/images/bienvenido.png',
  MascotEstado.derecho:    'assets/images/bien-hecho.png',
  MascotEstado.aprendiendo:'assets/images/aprendiendo.png',
  MascotEstado.estudiando: 'assets/images/estudiando.png',
  MascotEstado.concentrado:'assets/images/listo-practicar.png',
  MascotEstado.unidad:     'assets/images/continuar-unidad.png',
  MascotEstado.quiz:       'assets/images/quiz.png',
  MascotEstado.quizUnidad: 'assets/images/quiz-unidad.png',
  MascotEstado.quizFinal:  'assets/images/desbloquear-nuevo-quiz.png',
  MascotEstado.correcto:   'assets/images/respuesta-correcta.png',
  MascotEstado.incorrecto: 'assets/images/respuesta-incorrecta.png',
  MascotEstado.sinVidas:   'assets/images/sin-vidas.png',
  MascotEstado.descanso:   'assets/images/descanso.png',
  MascotEstado.recompensa: 'assets/images/ganaste-monedas.png',
  MascotEstado.logro:      'assets/images/logro-completado.png',
  MascotEstado.nuevaUnidad:'assets/images/nueva-unidad.png',
  MascotEstado.seguir:     'assets/images/seguir-practicando.png',
  MascotEstado.finalizado: 'assets/images/terminado.png',
  MascotEstado.situacion:  'assets/images/seguir-aprendiendo.png',
};
