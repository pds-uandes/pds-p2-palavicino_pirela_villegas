# ------------------------------------------------------------------
NumericTemplate.destroy_all
NumericQuestion.destroy_all
MultiChoiceAnswer.destroy_all
MultiChoiceQuestion.destroy_all
Task.destroy_all
Course.destroy_all
UserProgress.destroy_all
User.destroy_all

# --------------------------------- COURSES ---------------------------------
COURSE1 = Course.create(
  name: 'Diagramas de Cuerpo Libre',
  difficulty: 0,
  status: 'in_progress',
  description: '📊 Aprende a representar las fuerzas en un cuerpo en equilibrio con claridad y precisión.'
)

COURSE2 = Course.create(
  name: 'Vínculos Externos e Internos',
  difficulty: 0,
  status: 'in_progress',
  description: '🔗 Conoce los tipos de apoyos y conexiones que afectan el análisis estructural.'
)

COURSE3 = Course.create(
  name: 'Condiciones de Equilibrio y Estabilidad',
  difficulty: 1,
  status: 'in_progress',
  description: '⚖️ Estudia cómo se mantienen los cuerpos en equilibrio y cuándo se desestabilizan.'
)

COURSE4 = Course.create(
  name: 'Tipos de fuerzas más comunes',
  difficulty: 2,
  status: 'in_progress',
  description: '💪 Explora las fuerzas más frecuentes en los sistemas estructurales: peso, tensión, compresión y más.'
)

COURSE5 = Course.create(
  name: 'Rozamiento y Poleas',
  difficulty: 3,
  status: 'in_progress',
  description: '🛞 Aprende sobre la importancia del rozamiento y cómo funcionan las poleas en los sistemas físicos.'
)

# --------------------------------- USERS ---------------------------------
teacher = User.create(
  name: 'Profesor Crocker',
  email: 'profecrocker@miuandes.cl',
  role: 'teacher',
  password: '123456'
)

unless UserProgress.exists?(user: teacher, score: 0)
  UserProgress.create(user: teacher, score: 0)
end


student1 = User.create(
  name: 'Pedro Villegas',
  email: 'ppvillegas@miuandes.cl',
  role: 'student',
  password: '123456'
)

unless UserProgress.exists?(user: student1, score: 0)
  UserProgress.create(user: student1, score: 0)
end

student2 = User.create(
  name: 'Franco Palavicino',
  email: 'fppalavicino@miuandes.cl',
  role: 'student',
  password: '123456'
)

unless UserProgress.exists?(user: student2, score: 0)
  UserProgress.create(user: student2, score: 0)
end

student3 = User.create(
  name: 'Andrés Pirela',
  email: 'aepirela@miuandes.cl',
  role: 'student',
  password: '123456'
)

unless UserProgress.exists?(user: student3, score: 0)
  UserProgress.create(user: student3, score: 0)
end



# --------------------------------- VINCULOS EXTERNOS E INTERNOS (VEI) ---------------------------------
TASK1_VEI = Task.create(
  user_id: teacher.id,
  task_type: 'multi_choice',
  status: 'in_progress',
  name: 'Tarea 1',
  is_finished: false,
  course_id: COURSE2.id
)

MCQ1_TASK1_VEI = MultiChoiceQuestion.create(
  task_id: TASK1_VEI.id,
  difficulty: 0,
  question: 'Un vínculo es una restricción al ______ de un cuerpo, que impide su movimiento respecto de algún grado de libertad.',
  choice_1: '{"value": "Equilibrio", "why_not": "🤔 No del todo. Recuerda que el equilibrio es la condición en la que todas las fuerzas y momentos se compensan mutuamente. Aquí estamos hablando de una restricción."}',
  choice_2: '{"value": "Movimiento", "why_not": ""}',
  choice_3: '{"value": "Peso", "why_not": "🚫 Incorrecto. El peso es simplemente la fuerza debido a la gravedad, no una restricción que impida el movimiento."}',
  choice_4: '{"value": "Fuerza", "why_not": "💪 ¿Fuerza? La fuerza es una interacción que puede cambiar el movimiento, pero en este caso buscamos algo que restrinja el movimiento."}',
  correct_answer: 'Movimiento'
)

MCQ2_TASK1_VEI = MultiChoiceQuestion.create(
  task_id: TASK1_VEI.id,
  difficulty: 0,
  question: 'Un apoyo deslizante restringe el desplazamiento en la dirección ______.',
  choice_1: '{"value": "Horizontal", "why_not": "❌ No es correcto. Un apoyo deslizante permite el movimiento en la dirección horizontal."}',
  choice_2: '{"value": "Vertical", "why_not": ""}',
  choice_3: '{"value": "De giro", "why_not": "🌀 Casi, pero no. Un apoyo deslizante no restringe la rotación del cuerpo."}',
  choice_4: '{"value": "Axial", "why_not": "⬆️ No exactamente. Un apoyo deslizante permite el movimiento axial y no lo restringe."}',
  correct_answer: 'Vertical'
)

MCQ3_TASK1_VEI = MultiChoiceQuestion.create(
  task_id: TASK1_VEI.id,
  difficulty: 0,
  question: '¿Cuál de las siguientes opciones define mejor un apoyo empotrado?',
  choice_1: '{"value": "Restricción del giro, pero no de los desplazamientos.", "why_not": "🔄 Incorrecto. Un apoyo empotrado restringe tanto los giros como los desplazamientos."}',
  choice_2: '{"value": "Restricción de los desplazamientos en ambas direcciones y del giro.", "why_not": ""}',
  choice_3: '{"value": "Permite el giro, pero restringe el desplazamiento en una dirección.", "why_not": "🚫 No es correcto. Un apoyo empotrado no permite ningún giro."}',
  choice_4: '{"value": "Restringe el giro y el desplazamiento.", "why_not": "⚠️ Casi, pero no del todo. Un empotrado restringe los giros y también los desplazamientos en todas las direcciones."}',
  correct_answer: 'Restricción de los desplazamientos en ambas direcciones y del giro.'
)

MCQ4_TASK1_VEI = MultiChoiceQuestion.create(
  task_id: TASK1_VEI.id,
  difficulty: 0,
  question: '¿Qué tipo de conexión permite la transmisión de fuerza axial, pero no permite la transmisión de momento ni de fuerza de corte cuando está orientada en la dirección horizontal?',
  choice_1: '{"value": "Conexión rígida", "why_not": "🔧 Incorrecto. Una conexión rígida permite la transmisión de momentos, fuerzas axiales y de corte."}',
  choice_2: '{"value": "Conexión rotulada", "why_not": "⚙️ No es lo que buscamos. Una conexión rotulada permite el giro y restringe traslaciones, pero no cumple con la condición dada."}',
  choice_3: '{"value": "Biela", "why_not": ""}',
  choice_4: '{"value": "Apoyo deslizante", "why_not": "🎯 Incorrecto. Un apoyo deslizante permite deslizamientos y puede transmitir fuerza axial, pero no está diseñado específicamente para las condiciones dadas."}',
  correct_answer: 'Biela'
)

TASK2_VEI = Task.create(
  user_id: teacher.id,
  task_type: 'numeric',
  status: 'in_progress',
  name: 'Tarea 2',
  is_finished: false,
  course_id: COURSE2.id
)

TASK3_VEI = Task.create(
  user_id: teacher.id,
  task_type: 'numeric',
  status: 'in_progress',
  name: 'Tarea 3',
  is_finished: false,
  course_id: COURSE2.id
)

NQ1_TASK2_VEI = NumericQuestion.create!(
  task: TASK2_VEI,
  difficulty: 1,
  question: '¿Calcule el valor de la fuerza vertical aplicada por el apoyo fijo, dado que el ángulo de inclinación es {A}° y se le está aplicando una fuerza de {B} N perpendicular a la viga?',
  correct_answer: '20',
  tolerance: 0.1,
  unit: 'N',
  hint_1: '¡No olvides! Los apoyos fijos (🔺) ejercen fuerza tanto en el eje horizontal como en el vertical.',
  hint_2: 'Los apoyos deslizantes (⭕️) solo aplican una fuerza. ¿En qué dirección crees que es?',
  hint_3: '¡Recuerda! Las fuerzas diagonales se pueden descomponer en componentes horizontales y verticales. ¿Estás usando el coseno o el seno?',
  created_at: Time.now,
  updated_at: Time.now
)

NQ2_TASK2_VEI = NumericQuestion.create!(
  task: TASK3_VEI,
  difficulty: 1,
  question: '¿Calcule el valor de la fuerza horizontal aplicada por el apoyo fijo, dado que se aplica una fuerza de {B} N a un ángulo de inclinación de {A}° respecto a la viga?',
  correct_answer: '20',
  tolerance: 0.1,
  unit: 'N',
  hint_1: '¡No olvides! Los apoyos fijos (🔺) ejercen fuerza tanto en el eje horizontal como en el vertical.',
  hint_2: 'Los apoyos deslizantes (⭕️) solo aplican una fuerza. ¿En qué dirección crees que es?',
  hint_3: '¡Recuerda! Las fuerzas diagonales se pueden descomponer en componentes horizontales y verticales. ¿Estás usando el coseno o el seno?',
  created_at: Time.now,
  updated_at: Time.now
)

NumericTemplate.create!(
  numeric_question: NQ1_TASK2_VEI,
  diagram_data: 'template1',
  values: '{"angle": [15, 30, 45, 60], "forceMagnitude": [3, 4, 5, 6]}',
  magnitudes: '{"force": "N"}',
  created_at: Time.now,
  updated_at: Time.now
)

NumericTemplate.create!(
  numeric_question: NQ2_TASK2_VEI,
  diagram_data: 'template2',
  values: '{"angle": [15, 30, 45, 60], "forceMagnitude": [3, 4, 5, 6]}',
  magnitudes: '{"force": "N"}',
  created_at: Time.now,
  updated_at: Time.now
)

# ------------------------------- DIAGRAMA DE CUERPO LIBRE (DCL) --------------------------------
TASK1_DCL = Task.create(
  user_id: teacher.id,
  task_type: 'multi_choice',
  status: 'in_progress',
  name: 'Tarea 4',
  is_finished: false,
  course_id: COURSE1.id
)

MCQ1_TASK1_DCL = MultiChoiceQuestion.create(
  task_id: TASK1_DCL.id,
  difficulty: 0,
  question: '¿Qué es un diagrama de cuerpo libre?',
  choice_1: '{"value": "Una representación gráfica de las fuerzas y momentos aplicados a un cuerpo.", "why_not": ""}',
  choice_2: '{"value": "Un método para calcular la masa de un cuerpo rígido.", "why_not": "Este método se relaciona más con el estudio de la mecánica de cuerpos y no es específico de un diagrama de cuerpo libre."}',
  choice_3: '{"value": "Un sistema para restringir los grados de libertad de un cuerpo.", "why_not": "Aunque la restricción de grados de libertad es importante en el análisis estructural, no es lo que define un diagrama de cuerpo libre."}',
  choice_4: '{"value": "Una técnica para resolver ecuaciones diferenciales en cuerpos rígidos.", "why_not": "Esta técnica es más avanzada y no se relaciona directamente con la representación gráfica de fuerzas."}',
  correct_answer: 'Una representación gráfica de las fuerzas y momentos aplicados a un cuerpo.'
)

MCQ2_TASK1_DCL = MultiChoiceQuestion.create(
  task_id: TASK1_DCL.id,
  difficulty: 0,
  question: 'Un diagrama de cuerpo libre es una representación gráfica que muestra todas las ______ que actúan sobre un cuerpo o sistema.',
  choice_1: '{"value": "Fuerzas", "why_not": ""}',
  choice_2: '{"value": "Velocidades", "why_not": "Las velocidades son la tasa de cambio de posición, pero no son relevantes para un diagrama de cuerpo libre."}',
  choice_3: '{"value": "Distancias", "why_not": "Las distancias son magnitudes espaciales que no determinan las interacciones que se muestran en un DCL."}',
  choice_4: '{"value": "Áreas", "why_not": "Las áreas no representan las fuerzas o momentos en un sistema."}',
  correct_answer: 'Fuerzas'
)

MCQ3_TASK1_DCL = MultiChoiceQuestion.create(
  task_id: TASK1_DCL.id,
  difficulty: 0,
  question: 'En un diagrama de cuerpo libre, las fuerzas se representan como vectores que tienen magnitud, dirección y ______.',
  choice_1: '{"value": "Punto de aplicación", "why_not": "Aunque el punto de aplicación es crucial en la física de fuerzas, no es lo que se completa en esta oración."}',
  choice_2: '{"value": "Sentido", "why_not": ""}',
  choice_3: '{"value": "Color", "why_not": "El color no tiene relevancia en la representación física de las fuerzas."}',
  choice_4: '{"value": "Densidad", "why_not": "La densidad es una propiedad de los materiales, no de las fuerzas o su representación."}',
  correct_answer: 'Sentido'
)

MCQ4_TASK1_DCL = MultiChoiceQuestion.create(
  task_id: TASK1_DCL.id,
  difficulty: 0,
  question: 'Para dibujar un DCL correctamente, se deben eliminar todos los ______ del entorno y reemplazarlos con las fuerzas que ejercen.',
  choice_1: '{"value": "Ejes", "why_not": "Los ejes son útiles para orientar el análisis del problema, no se eliminan."}',
  choice_2: '{"value": "Apoyos", "why_not": ""}',
  choice_3: '{"value": "Ángulos", "why_not": "Los ángulos pueden ser importantes para calcular las fuerzas, pero no se eliminan."}',
  choice_4: '{"value": "Dimensiones", "why_not": "Las dimensiones no afectan directamente la creación de un DCL."}',
  correct_answer: 'Apoyos'
)

MCQ5_TASK1_DCL = MultiChoiceQuestion.create(
  task_id: TASK1_DCL.id,
  difficulty: 0,
  question: 'El primer paso para construir un diagrama de cuerpo libre es aislar el cuerpo o ______ que se está analizando.',
  choice_1: '{"value": "Vector", "why_not": "Los vectores representan fuerzas y no el cuerpo que se analiza."}',
  choice_2: '{"value": "Partícula", "why_not": "Una partícula se refiere a un modelo simplificado del cuerpo, pero no siempre es aplicable en cuerpos rígidos."}',
  choice_3: '{"value": "Sistema", "why_not": ""}',
  choice_4: '{"value": "Punto", "why_not": "Un punto es una representación matemática que no corresponde necesariamente al cuerpo completo."}',
  correct_answer: 'Sistema'
)

MCQ6_TASK2_CEE = MultiChoiceQuestion.create(
  task_id: TASK1_DCL.id,
  difficulty: 0,
  question: 'Las reacciones en los apoyos se representan en el DCL como ______ que equilibran las fuerzas externas aplicadas al cuerpo.',
  choice_1: '{"value": "Momentos", "why_not": "Aunque los momentos son importantes, no representan las reacciones en los apoyos de manera directa."}',
  choice_2: '{"value": "Áreas", "why_not": "Las áreas no son formas de representar las fuerzas o reacciones."}',
  choice_3: '{"value": "Vectores", "why_not": ""}',
  choice_4: '{"value": "Coordenadas", "why_not": "Las coordenadas indican posición, pero no representan fuerzas."}',
  correct_answer: 'Vectores'
)

MCQ7_TASK1_DCL = MultiChoiceQuestion.create(
  task_id: TASK1_DCL.id,
  difficulty: 0,
  question: '¿Qué información NO se debe incluir en un diagrama de cuerpo libre?',
  choice_1: '{"value": "Las fuerzas externas aplicadas al cuerpo.", "why_not": "Las fuerzas externas son esenciales en un DCL para entender las interacciones."}',
  choice_2: '{"value": "Las dimensiones del cuerpo.", "why_not": ""}',
  choice_3: '{"value": "Las reacciones en los apoyos.", "why_not": "Las reacciones en los apoyos son fundamentales para entender cómo el cuerpo responde a las fuerzas externas."}',
  choice_4: '{"value": "Los momentos aplicados al cuerpo.", "why_not": "Los momentos son fuerzas rotacionales que también deben estar en el DCL."}',
  correct_answer: 'Las dimensiones del cuerpo.'
)

MCQ8_TASK1_DCL = MultiChoiceQuestion.create(
  task_id: TASK1_DCL.id,
  difficulty: 0,
  question: '¿Cuál de los siguientes elementos es esencial para un diagrama de cuerpo libre?',
  choice_1: '{"value": "La masa del cuerpo.", "why_not": "La masa es importante en el análisis, pero no es un elemento que se represente directamente en el diagrama."}',
  choice_2: '{"value": "La velocidad del cuerpo.", "why_not": "La velocidad no se incluye en el diagrama, ya que se centra en fuerzas y momentos en un instante específico."}',
  choice_3: '{"value": "Las fuerzas aplicadas al cuerpo.", "why_not": ""}',
  choice_4: '{"value": "La posición inicial del cuerpo.", "why_not": "La posición inicial puede ser relevante en otros contextos, pero no es esencial en un diagrama de cuerpo libre."}',
  correct_answer: 'Las fuerzas aplicadas al cuerpo.'
)

MCQ9_TASK1_DCL = MultiChoiceQuestion.create(
  task_id: TASK1_DCL.id,
  difficulty: 0,
  question: 'En un diagrama de cuerpo libre, ¿cómo se representa un momento aplicado al cuerpo?',
  choice_1: '{"value": "Como una fuerza en dirección opuesta.", "why_not": "Un momento no se puede representar simplemente como una fuerza opuesta; requiere una representación diferente."}',
  choice_2: '{"value": "Como una flecha curva alrededor de un punto.", "why_not": ""}',
  choice_3: '{"value": "Como un vector perpendicular al plano.", "why_not": "Un vector perpendicular puede representar fuerzas, pero no captura la naturaleza de un momento aplicado."}',
  choice_4: '{"value": "Como un punto sin dirección.", "why_not": "Un punto sin dirección no proporciona información útil sobre la aplicación de un momento."}',
  correct_answer: 'Como una flecha curva alrededor de un punto.'
)

# ------------------------------- CONDICIONES DE EQUILIBRIO Y ESTABILIDAD (CEE) --------------------------------
TASK1_CEE = Task.create(
  user_id: teacher.id,
  task_type: 'multi_choice',
  status: 'in_progress',
  name: 'Tarea 5',
  is_finished: false,
  course_id: COURSE3.id
)

TASK2_CEE = Task.create(
  user_id: teacher.id,
  task_type: 'multi_choice',
  status: 'in_progress',
  name: 'Tarea 6',
  is_finished: false,
  course_id: COURSE3.id
)

TASK3_CEE = Task.create(
  user_id: teacher.id,
  task_type: 'numeric',
  status: 'in_progress',
  name: 'Tarea 7',
  is_finished: false,
  course_id: COURSE3.id
)

MCQ1_TASK1_CEE = MultiChoiceQuestion.create(
  task_id: TASK1_CEE.id,
  difficulty: 0,
  question: 'Un cuerpo se encuentra en equilibrio cuando la suma de fuerzas y _______ es igual a cero.',
  choice_1: '{"value": "Masa", "why_not": "La masa es una medida de inercia y no se suma como una fuerza en el equilibrio."}',
  choice_2: '{"value": "Momentos", "why_not": ""}',
  choice_3: '{"value": "Distancia", "why_not": "La distancia es una medida geométrica, no un factor de equilibrio en un DCL."}',
  choice_4: '{"value": "Área", "why_not": "El área no está relacionada directamente con las fuerzas o momentos en equilibrio."}',
  correct_answer: 'Momentos'
)

MCQ2_TASK1_CEE = MultiChoiceQuestion.create(
  task_id: TASK1_CEE.id,
  difficulty: 0,
  question: 'En un sistema isostático, el número de ecuaciones es _______ al número de incógnitas.',
  choice_1: '{"value": "Mayor", "why_not": "Si el número de ecuaciones fuera mayor, el sistema sería hiperestático, no isostático."}',
  choice_2: '{"value": "Menor", "why_not": "Si el número de ecuaciones fuera menor, el sistema sería inestable o indeterminado."}',
  choice_3: '{"value": "Igual", "why_not": ""}',
  choice_4: '{"value": "Diferente", "why_not": "Si fuera diferente, el sistema no sería isostático, sino hiperestático o inestable."}',
  correct_answer: 'Igual'
)

MCQ3_TASK1_CEE = MultiChoiceQuestion.create(
  task_id: TASK1_CEE.id,
  difficulty: 0,
  question: 'En un sistema de dos dimensiones, se usan _______ ecuaciones de equilibrio para resolver un problema estático.',
  choice_1: '{"value": "Tres", "why_not": ""}',
  choice_2: '{"value": "Dos", "why_not": "Aunque dos ecuaciones pueden resolver algunos problemas, no son suficientes para un análisis completo en 2D."}',
  choice_3: '{"value": "Cuatro", "why_not": "Cuatro ecuaciones no son necesarias en un sistema bidimensional."}',
  choice_4: '{"value": "Una", "why_not": "Una ecuación no puede resolver todos los aspectos de equilibrio en 2D."}',
  correct_answer: 'Tres'
)

MCQ4_TASK1_CEE = MultiChoiceQuestion.create(
  task_id: TASK1_CEE.id,
  difficulty: 0,
  question: 'Un sistema estructural se dice que es inestable si el número de incógnitas es _______ al número de ecuaciones.',
  choice_1: '{"value": "Mayor", "why_not": "Si las incógnitas fueran mayores, sería un sistema hiperestático, no inestable."}',
  choice_2: '{"value": "Menor", "why_not": ""}',
  choice_3: '{"value": "Igual", "why_not": "Si fueran iguales, el sistema sería isostático, no inestable"}',
  choice_4: '{"value": "Proporcional", "why_not": "Proporcionalidad no es una relación suficiente para describir estabilidad estructural."}',
  correct_answer: 'Menor'
)

MCQ5_TASK1_CEE = MultiChoiceQuestion.create(
  task_id: TASK1_CEE.id,
  difficulty: 0,
  question: 'La resultante de fuerzas en un sistema en equilibrio es igual a _______. ',
  choice_1: '{"value": "Uno", "why_not": "La resultante de fuerzas en equilibrio no puede ser un número cualquiera."}',
  choice_2: '{"value": "Cero", "why_not": ""}',
  choice_3: '{"value": "Su peso", "why_not": "El peso es una fuerza, pero no la resultante de todas las fuerzas."}',
  choice_4: '{"value": "La mitad de las fuerzas internas", "why_not": "No existe tal relación en el equilibrio entre fuerzas internas y externas."}',
  correct_answer: 'Cero'
)

MCQ6_TASK1_CEE = MultiChoiceQuestion.create(
  task_id: TASK1_CEE.id,
  difficulty: 0,
  question: 'La resultante de fuerzas en un sistema en equilibrio es igual a _______.',
  choice_1: '{"value": "Uno", "why_not": "La resultante de fuerzas en equilibrio no puede ser un número cualquiera."}',
  choice_2: '{"value": "Cero", "why_not": ""}',
  choice_3: '{"value": "Su peso", "why_not": "El peso es una fuerza, pero no la resultante de todas las fuerzas."}',
  choice_4: '{"value": "La mitad de las fuerzas internas", "why_not": "No existe tal relación en el equilibrio entre fuerzas internas y externas."}',
  correct_answer: 'Cero'
)

MCQ1_TASK2_CEE = MultiChoiceQuestion.create(
  task_id: TASK2_CEE.id,
  difficulty: 0,
  question: '¿Cuál de las siguientes afirmaciones es correcta respecto a las condiciones de equilibrio de un cuerpo rígido?',
  choice_1: '{"value": "La resultante de fuerzas puede no ser cero, pero la de momentos sí.", "why_not": "Para que un cuerpo esté en equilibrio, la resultante de fuerzas de momentos no debe ser distinta de cero."}',
  choice_2: '{"value": "La resultante de fuerzas y momentos debe ser cero.", "why_not": ""}',
  choice_3: '{"value": "Solo la resultante de fuerzas debe ser cero.", "why_not": "El peso es una fuerza, pero no la resultante de todas las fuerzas."}',
  choice_4: '{"value": "Solo la resultante de momentos debe ser cero.", "why_not": "Un cuerpo puede tener momentos equilibrados, pero las fuerzas deben cumplir una condición especial."}',
  correct_answer: 'La resultante de fuerzas y momentos debe ser cero.'
)

MCQ2_TASK2_CEE = MultiChoiceQuestion.create(
  task_id: TASK2_CEE.id,
  difficulty: 0,
  question: '¿Qué condición debe cumplirse para que un sistema sea isostático?',
  choice_1: '{"value": "El número de ecuaciones es mayor al número de incógnitas.", "why_not": "Si hay más ecuaciones que incógnitas, el sistema es sobreespecificado y puede ser inestable."}',
  choice_2: '{"value": "El número de incógnitas es mayor al número de ecuaciones.", "why_not": "Esto implicaría que el sistema es indeterminado y no se puede resolver adecuadamente."}',
  choice_3: '{"value": "El número de ecuaciones es igual al número de incógnitas.", "why_not": ""}',
  choice_4: '{"value": "No hay fuerzas actuando sobre el sistema.", "why_not": "Aunque un sistema sin fuerzas puede ser estático, no cumple con la definición de isostaticidad."}',
  correct_answer: 'El número de ecuaciones es igual al número de incógnitas.'
)

MCQ3_TASK2_CEE = MultiChoiceQuestion.create(
  task_id: TASK2_CEE.id,
  difficulty: 0,
  question: '¿Cuántas ecuaciones de equilibrio se pueden utilizar en un problema en tres dimensiones?',
  choice_1: '{"value": "Dos", "why_not": "Solo hay dos ecuaciones para equilibrio en dos dimensiones; en tres dimensiones, se necesitan más."}',
  choice_2: '{"value": "Tres", "why_not": "Esto solo aplica a sistemas en dos dimensiones, donde se usan tres fuerzas."}',
  choice_3: '{"value": "Seis", "why_not": ""}',
  choice_4: '{"value": "Nueve", "why_not": "No se necesitan tantas, ya que corresponden a las direcciones espaciales (x, y, z) y los momentos en cada una."}',
  correct_answer: 'Seis.'
)

MCQ4_TASK2_CEE = MultiChoiceQuestion.create(
  task_id: TASK2_CEE.id,
  difficulty: 0,
  question: 'En un sistema hiperestático, ¿cuál es la relación entre incógnitas y ecuaciones?',
  choice_1: '{"value": "Hay más incógnitas que ecuaciones.", "why_not": ""}',
  choice_2: '{"value": "Hay más ecuaciones que incógnitas.", "why_not": "Si hay más ecuaciones, el sistema se vuelve sobreespecificado, lo que no define un sistema hiperestático."}',
  choice_3: '{"value": "El número de incógnitas es igual al de ecuaciones.", "why_not": "Esto definiría un sistema isostático, no hiperestático."}',
  choice_4: '{"value": "No hay incógnitas.", "why_not": "Siempre hay incógnitas en un sistema hiperestático."}',
  correct_answer: 'Hay más incógnitas que ecuaciones.'
)

MCQ5_TASK2_CEE = MultiChoiceQuestion.create(
  task_id: TASK2_CEE.id,
  difficulty: 0,
  question: '¿Qué fuerza se usa para reemplazar una carga distribuida en un análisis de equilibrio?',
  choice_1: '{"value": "Momento", "why_not": "Aunque el momento puede estar relacionado, no es la forma correcta de reemplazar una carga distribuida."}',
  choice_2: '{"value": "Fuerza axial", "why_not": "La fuerza axial se refiere a la tensión o compresión en miembros estructurales, pero no es adecuada para cargas distribuidas."}',
  choice_3: '{"value": "Fuerza equivalente", "why_not": ""}',
  choice_4: '{"value": "Tensión", "why_not": "La tensión es un tipo específico de fuerza y no se usa para reemplazar cargas distribuidas en general."}',
  correct_answer: 'Fuerza equivalente.'
)

NQ1_TASK3_CEE = NumericQuestion.create!(
  task: TASK3_CEE,
  difficulty: 1,
  question: 'Una viga horizontal de 10 metros de longitud soporta una carga puntual de {B} N aplicada a {A} metros desde el incio. Encuentra las reacciones en los apoyos en ambos extremos de la viga.' ,
  correct_answer: '20',
  tolerance: 0.1,
  unit: 'N',
  hint_1: '¡No olvides! Los apoyos fijos (🔺) ejercen fuerza tanto en el eje horizontal como en el vertical.',
  hint_2: 'Los apoyos deslizantes (⭕️) solo aplican una fuerza. ¿En qué dirección crees que es?',
  hint_3: '¡Recuerda! Las fuerzas diagonales se pueden descomponer en componentes horizontales y verticales. ¿Estás usando el coseno o el seno?',
  created_at: Time.now,
  updated_at: Time.now
)

NumericTemplate.create!(
  numeric_question: NQ1_TASK3_CEE,
  diagram_data: 'template7',
  values: '{"forcePosition": [2, 4, 6], "forceMagnitude": [3, 4, 5]}',
  magnitudes: '{"force": "N"}',
  created_at: Time.now,
  updated_at: Time.now
)

# ------------------------------- TIPOS DE FUERZAS MÁS COMUNES (TFC) --------------------------------
TASK1_TFC = Task.create(
  user_id: teacher.id,
  task_type: 'multi_choice',
  status: 'in_progress',
  name: 'Tarea 7',
  is_finished: false,
  course_id: COURSE4.id
)

TASK2_TFC = Task.create(
  user_id: teacher.id,
  task_type: 'multi_choice',
  status: 'in_progress',
  name: 'Tarea 8',
  is_finished: false,
  course_id: COURSE4.id
)

TASK3_TFC = Task.create(
  user_id: teacher.id,
  task_type: 'numeric',
  status: 'in_progress',
  name: 'Tarea 9',
  is_finished: false,
  course_id: COURSE4.id
)

TASK4_TFC = Task.create(
  user_id: teacher.id,
  task_type: 'numeric',
  status: 'in_progress',
  name: 'Tarea 10',
  is_finished: false,
  course_id: COURSE4.id
)

MCQ1_TASK1_TFC = MultiChoiceQuestion.create(
  task_id: TASK1_TFC.id,
  difficulty: 0,
  question: '¿Qué es una fuerza puntual?',
  choice_1: '{"value": "Una fuerza que actúa sobre todo el volumen del cuerpo.", "why_not": "Esto describe una fuerza distribuida."}',
  choice_2: '{"value": "Una fuerza aplicada en un único punto del cuerpo.", "why_not": ""}',
  choice_3: '{"value": "Una fuerza distribuida uniformemente en toda la superficie.", "why_not": "Esto también se refiere a una fuerza distribuida y no a una puntual."}',
  choice_4: '{"value": "Una fuerza que se aplica a lo largo de una línea.", "why_not": "Esto describe un tipo de fuerza diferente, no una fuerza puntual."}',
  correct_answer: 'Una fuerza aplicada en un único punto del cuerpo.'
)

MCQ2_TASK1_TFC = MultiChoiceQuestion.create(
  task_id: TASK1_TFC.id,
  difficulty: 0,
  question: '¿Cuál de los siguientes es un ejemplo de fuerza distribuida?',
  choice_1: '{"value": "Peso", "why_not": "Aunque el peso puede ser considerado como una carga distribuida, en sí mismo es una fuerza puntual si se aplica a un solo punto."}',
  choice_2: '{"value": "Carga puntual", "why_not": "Una carga puntual no se distribuye, actúa en un único punto."}',
  choice_3: '{"value": "Carga distribuida sobre un área", "why_not": ""}',
  choice_4: '{"value": "Momento puntual", "why_not": "Un momento puntual es una fuerza en un punto, no una carga distribuida."}',
  correct_answer: 'Carga distribuida sobre un área.'
)

MCQ3_TASK1_TFC = MultiChoiceQuestion.create(
  task_id: TASK1_TFC.id,
  difficulty: 0,
  question: '¿Qué tipo de fuerza actúa sobre el largo de una viga?',
  choice_1: '{"value": "Fuerza distribuida.", "why_not": ""}',
  choice_2: '{"value": "Fuerza puntual.", "why_not": "Esto se refiere a una fuerza aplicada en un solo punto, no a lo largo de toda la viga."}',
  choice_3: '{"value": "Momento puntual.", "why_not": "Un momento puntual actúa en un punto específico, no a lo largo de la viga."}',
  choice_4: '{"value": "Fuerza axial.", "why_not": "La fuerza axial puede actuar a lo largo de una viga, pero no describe la acción a lo largo de toda su longitud."}',
  correct_answer: 'Fuerza distribuida.'
)

MCQ4_TASK1_TFC = MultiChoiceQuestion.create(
  task_id: TASK1_TFC.id,
  difficulty: 0,
  question: '¿Qué es un momento puntual?',
  choice_1: '{"value": "Una fuerza aplicada en un punto específico.", "why_not": "Esto describe una fuerza, no un momento."}',
  choice_2: '{"value": "Un torque que actúa sobre un cuerpo en un punto específico.", "why_not": ""}',
  choice_3: '{"value": "Una fuerza distribuida que actúa en toda la superficie del cuerpo.", "why_not": "Esto no se relaciona con un momento."}',
  choice_4: '{"value": "Una carga distribuida a lo largo del largo de un cuerpo.", "why_not": "Esto describe otra forma de carga, no un momento puntual."}',
  correct_answer: 'Un torque que actúa sobre un cuerpo en un punto específico.'
)

MCQ5_TASK1_TFC = MultiChoiceQuestion.create(
  task_id: TASK1_TFC.id,
  difficulty: 0,
  question: '¿Qué sucede con una fuerza distribuida al ser reemplazada por una fuerza equivalente?',
  choice_1: '{"value": "Se mantiene la distribución de fuerzas internas.", "why_not": "Al reemplazar, la distribución interna no se conserva; se simplifica a una fuerza puntual."}',
  choice_2: '{"value": "Solo cambia la magnitud de la fuerza.", "why_not": "También se cambia la forma en que se aplica la fuerza, no sólo su magnitud."}',
  choice_3: '{"value": "Solo se mantiene el mismo efecto global sobre el sistema.", "why_not": ""}',
  choice_4: '{"value": "Desaparecen las reacciones en los apoyos.", "why_not": "Las reacciones en los apoyos dependen de las fuerzas aplicadas, y no desaparecen por el reemplazo."}',
  correct_answer: 'Solo se mantiene el mismo efecto global sobre el sistema.'
)

MCQ6_TASK1_TFC = MultiChoiceQuestion.create(
  task_id: TASK1_TFC.id,
  difficulty: 0,
  question: '¿Cuál de los siguientes tipos de cargas puede variar a lo largo del cuerpo?',
  choice_1: '{"value": "Carga puntual.", "why_not": "Las cargas puntuales no varían; actúan en un solo punto."}',
  choice_2: '{"value": "Carga uniforme.", "why_not": "Las cargas uniformes son constantes a lo largo de la longitud del cuerpo."}',
  choice_3: '{"value": "Carga trapezoidal.", "why_not": ""}',
  choice_4: '{"value": "Momento puntual.", "why_not": "Un momento puntual actúa en un solo punto y no varía a lo largo de un cuerpo."}',
  correct_answer: 'Carga trapezoidal.'
)

MCQ7_TASK1_TFC = MultiChoiceQuestion.create(
  task_id: TASK1_TFC.id,
  difficulty: 0,
  question: '¿Cómo se expresa una carga distribuida a lo largo de un cuerpo unidimensional?',
  choice_1: '{"value": "N/m².", "why_not": "Esta unidad se utiliza para cargas distribuidas sobre un área, no sobre una línea."}',
  choice_2: '{"value": "N.", "why_not": "Esta es una unidad de fuerza total, no de carga distribuida."}',
  choice_3: '{"value": "N/m.", "why_not": ""}',
  choice_4: '{"value": "N/m³.", "why_not": "Esta unidad se refiere a una densidad de carga, no a una carga distribuida a lo largo de un cuerpo unidimensional."}',
  correct_answer: 'N/m.'
)

MCQ8_TASK1_TFC = MultiChoiceQuestion.create(
  task_id: TASK1_TFC.id,
  difficulty: 0,
  question: '¿Qué tipo de momento actúa en toda la longitud de un cuerpo?',
  choice_1: '{"value": "Momento puntual.", "why_not": "Un momento puntual se aplica en un solo punto."}',
  choice_2: '{"value": "Momento axial.", "why_not": "Esto no describe un momento que actúa en toda la longitud."}',
  choice_3: '{"value": "Momento distribuido.", "why_not": ""}',
  choice_4: '{"value": "Momento torsional.", "why_not": "El momento torsional describe un tipo específico de momento, pero no abarca toda la longitud de un cuerpo."}',
  correct_answer: 'Momento distribuido.'
)

MCQ9_TASK1_TFC = MultiChoiceQuestion.create(
  task_id: TASK1_TFC.id,
  difficulty: 0,
  question: '¿Cuál es la fórmula correcta para calcular una fuerza equivalente para una carga distribuida uniformemente?',
  choice_1: '{"value": "Fuerza = carga total / longitud.", "why_not": "Esta fórmula no representa correctamente la relación entre carga total y fuerza equivalente."}',
  choice_2: '{"value": "Fuerza = carga total * longitud.", "why_not": ""}',
  choice_3: '{"value": "Fuerza = (carga total / área).", "why_not": "Esto no se aplica a una carga distribuida uniformemente."}',
  choice_4: '{"value": "Fuerza = (carga total * longitud / 2).", "why_not": "Esta fórmula no representa la forma correcta de calcular la fuerza equivalente."}',
  correct_answer: 'Fuerza = carga total * longitud.'
)

MCQ10_TASK1_TFC = MultiChoiceQuestion.create(
  task_id: TASK1_TFC.id,
  difficulty: 0,
  question: '¿Qué tipo de fuerza es independiente del área de contacto?',
  choice_1: '{"value": "Fuerza de corte.", "why_not": "La fuerza de corte sí depende del área de contacto, especialmente en materiales."}',
  choice_2: '{"value": "Fuerza de rozamiento.", "why_not": ""}',
  choice_3: '{"value": "Fuerza puntual.", "why_not": "Aunque se aplica en un solo punto, su efecto puede depender del área de contacto."}',
  choice_4: '{"value": "Momento puntual.", "why_not": "Un momento puntual no se refiere a un área de contacto, sino a una acción en un punto específico."}',
  correct_answer: 'Fuerza de rozamiento.'
)

MCQ11_TASK1_TFC = MultiChoiceQuestion.create(
  task_id: TASK1_TFC.id,
  difficulty: 0,
  question: '¿Cuál de las siguientes es una característica de la fuerza de rozamiento dinámico?',
  choice_1: '{"value": "Es mayor que la fuerza de rozamiento estático.", "why_not": "Por lo general, la fuerza de rozamiento estático es mayor que la dinámica."}',
  choice_2: '{"value": "Es proporcional a la velocidad.", "why_not": "La fuerza de rozamiento dinámico no es directamente proporcional a la velocidad; depende de otros factores."}',
  choice_3: '{"value": "Es independiente del área de contacto.", "why_not": ""}',
  choice_4: '{"value": "Disminuye con el tiempo.", "why_not": "La fuerza de rozamiento dinámico puede variar dependiendo de las condiciones, pero no necesariamente disminuye con el tiempo."}',
  correct_answer: 'Es independiente del área de contacto.'
)

MCQ1_TASK2_TFC = MultiChoiceQuestion.create(
  task_id: TASK2_TFC.id,
  difficulty: 0,
  question: 'Una _______ es una fuerza que actúa en un solo punto de un cuerpo.',
  choice_1: '{"value": "Carga distribuida", "why_not": "Esto describe una fuerza que se aplica en varias partes, no en un solo punto."}',
  choice_2: '{"value": "Fuerza puntual", "why_not": ""}',
  choice_3: '{"value": "Fuerza de corte", "why_not": "Una fuerza de corte actúa en una línea, no en un solo punto."}',
  choice_4: '{"value": "Fuerza axial", "why_not": "Una fuerza axial actúa a lo largo de un eje, no en un solo punto."}',
  correct_answer: 'Fuerza puntual'
)

MCQ2_TASK2_TFC = MultiChoiceQuestion.create(
  task_id: TASK2_TFC.id,
  difficulty: 0,
  question: 'Una _______ se distribuye a lo largo de una parte o toda la longitud de un cuerpo.',
  choice_1: '{"value": "Fuerza puntual", "why_not": "Esta fuerza actúa en un único punto, no se distribuye."}',
  choice_2: '{"value": "Fuerza axial", "why_not": "Aunque se refiere a fuerzas a lo largo de un eje, no se distribuye."}',
  choice_3: '{"value": "Fuerza distribuida", "why_not": ""}',
  choice_4: '{"value": "Fuerza normal", "why_not": "Una fuerza axial actúa a lo largo de un eje, no en un solo punto."}',
  correct_answer: 'Fuerza distribuida'
)

MCQ3_TASK2_TF = MultiChoiceQuestion.create(
  task_id: TASK2_TFC.id,
  difficulty: 0,
  question: 'Las fuerzas _______ actúan sobre el volumen de un cuerpo tridimensional.',
  choice_1: '{"value": "Axiales", "why_not": "Las fuerzas axiales actúan a lo largo de un eje, no sobre el volumen."}',
  choice_2: '{"value": "Distribuidas", "why_not": ""}',
  choice_3: '{"value": "Puntuales", "why_not": "Las fuerzas puntuales actúan en un solo punto, no sobre un volumen."}',
  choice_4: '{"value": "Gravitatorias", "why_not": "Aunque las fuerzas gravitatorias pueden considerarse en un volumen, no describen las fuerzas en general que actúan sobre todo el volumen."}',
  correct_answer: 'Distribuidas'
)

MCQ4_TASK2_TFC = MultiChoiceQuestion.create(
  task_id: TASK2_TFC.id,
  difficulty: 0,
  question: 'El _______ es un tipo de fuerza que se genera cuando un cuerpo rota alrededor de un punto fijo.',
  choice_1: '{"value": "Momento", "why_not": ""}',
  choice_2: '{"value": "Peso", "why_not": "El peso es una fuerza que actúa hacia abajo debido a la gravedad, no es específico de la rotación."}',
  choice_3: '{"value": "Esfuerzo", "why_not": "El esfuerzo se refiere a la fuerza interna en un material, no a la rotación."}',
  choice_4: '{"value": "Desplazamiento", "why_not": "El desplazamiento se refiere a un cambio de posición, no a una fuerza."}',
  correct_answer: 'Momento'
)

MCQ5_TASK2_TFC = MultiChoiceQuestion.create(
  task_id: TASK2_TFC.id,
  difficulty: 0,
  question: 'Las cargas distribuidas sobre un área se miden en _______.',
  choice_1: '{"value": "N/m²", "why_not": ""}',
  choice_2: '{"value": "N/m³", "why_not": "Esta unidad se refiere a la densidad, no a cargas distribuidas."}',
  choice_3: '{"value": "N/m", "why_not": "Esta unidad se utiliza para cargas distribuidas a lo largo de una línea, no de un área."}',
  choice_4: '{"value": "N", "why_not": "Esta es la unidad de fuerza total, no de carga distribuida."}',
  correct_answer: 'N/m²'
)

MCQ6_TASK2_TFC = MultiChoiceQuestion.create(
  task_id: TASK2_TFC.id,
  difficulty: 0,
  question: 'Las fuerzas que se pueden reemplazar por una fuerza equivalente producen el mismo _______ global sobre el sistema.',
  choice_1: '{"value": "Desplazamiento", "why_not": "Aunque puede haber un desplazamiento, la equivalencia se refiere al efecto global."}',
  choice_2: '{"value": "Efecto", "why_not": ""}',
  choice_3: '{"value": "Momento", "why_not": "El momento puede cambiar dependiendo de cómo se aplique la fuerza, no se refiere a un efecto global."}',
  choice_4: '{"value": "Peso", "why_not": "El peso es una medida de fuerza, pero no describe el efecto global de la fuerza equivalente."}',
  correct_answer: 'Efecto'
)

NQ1_TASK3_TFC = NumericQuestion.create!(
  task: TASK3_TFC,
  difficulty: 1,
  question: 'Determina la fuerza equivalente para una carga triangular que actúa en una segmento de {A} metros de longitud sobre la viga, con una intensidad máxima de {B} N/m en un extremo.' ,
  correct_answer: '20',
  tolerance: 0.1,
  unit: 'N',
  hint_1: '¡No olvides! Los apoyos fijos (🔺) ejercen fuerza tanto en el eje horizontal como en el vertical.',
  hint_2: 'Los apoyos deslizantes (⭕️) solo aplican una fuerza. ¿En qué dirección crees que es?',
  hint_3: '¡Recuerda! Las fuerzas diagonales se pueden descomponer en componentes horizontales y verticales. ¿Estás usando el coseno o el seno?',
  created_at: Time.now,
  updated_at: Time.now
)

NumericTemplate.create!(
  numeric_question: NQ1_TASK3_TFC,
  diagram_data: 'template4',
  values: '{"longitud": [3, 4, 5], "forceMagnitude": [300, 500, 600]}',
  magnitudes: '{"force": "N"}',
  created_at: Time.now,
  updated_at: Time.now
)

NQ2_TASK4_TFC = NumericQuestion.create!(
  task: TASK4_TFC,
  difficulty: 1,
  question: 'Calcula el momento generado por una fuerza de {A} N aplicada a {B} metros del eje de rotación.' ,
  correct_answer: '20',
  tolerance: 0.1,
  unit: 'N',
  hint_1: '¡No olvides! Los apoyos fijos (🔺) ejercen fuerza tanto en el eje horizontal como en el vertical.',
  hint_2: 'Los apoyos deslizantes (⭕️) solo aplican una fuerza. ¿En qué dirección crees que es?',
  hint_3: '¡Recuerda! Las fuerzas diagonales se pueden descomponer en componentes horizontales y verticales. ¿Estás usando el coseno o el seno?',
  created_at: Time.now,
  updated_at: Time.now
)

NumericTemplate.create!(
  numeric_question: NQ2_TASK4_TFC,
  diagram_data: 'template3',
  values: '{"forceMagnitude": [150, 200, 300], "longitud": [2, 3, 4]}',
  magnitudes: '{"force": "N"}',
  created_at: Time.now,
  updated_at: Time.now
)
# ------------------------------- ROZAMIENTO Y POLEAS (RZP) --------------------------------

TASK1_RZP = Task.create(
  user_id: teacher.id,
  task_type: 'multi_choice',
  status: 'in_progress',
  name: 'Tarea 9',
  is_finished: false,
  course_id: COURSE5.id
)

TASK2_RZP = Task.create(
  user_id: teacher.id,
  task_type: 'multi_choice',
  status: 'in_progress',
  name: 'Tarea 10',
  is_finished: false,
  course_id: COURSE5.id
)

TASK3_RZP = Task.create(
  user_id: teacher.id,
  task_type: 'numeric',
  status: 'in_progress',
  name: 'Tarea 11',
  is_finished: false,
  course_id: COURSE5.id
)

TASK4_RZP = Task.create(
  user_id: teacher.id,
  task_type: 'numeric',
  status: 'in_progress',
  name: 'Tarea 12',
  is_finished: false,
  course_id: COURSE5.id
)

MCQ1_TASK1_RZP = MultiChoiceQuestion.create(
  task_id: TASK1_RZP.id,
  difficulty: 0,
  question: '¿Qué tipo de rozamiento ocurre cuando un cuerpo se desliza respecto de otro?',
  choice_1: '{"value": "Rozamiento estático", "why_not": "El rozamiento estático se produce cuando un cuerpo está en reposo respecto al otro, no al deslizarse."}',
  choice_2: '{"value": "Rozamiento dinámico", "why_not": ""}',
  choice_3: '{"value": "Rozamiento por rodadura", "why_not": "Este tipo de rozamiento ocurre cuando un cuerpo rueda sobre otro, no cuando se desliza."}',
  choice_4: '{"value": "Rozamiento viscoso", "why_not": "El rozamiento viscoso se refiere a la resistencia en fluidos, no al deslizamiento entre superficies sólidas."}',
  correct_answer: 'Rozamiento dinámico'
)

MCQ2_TASK1_RZP = MultiChoiceQuestion.create(
  task_id: TASK1_RZP.id,
  difficulty: 0,
  question: '¿Cómo es el coeficiente de rozamiento dinámico en comparación con el estático?',
  choice_1: '{"value": "Mayor", "why_not": "El coeficiente de rozamiento dinámico nunca es mayor."}',
  choice_2: '{"value": "Menor", "why_not": ""}',
  choice_3: '{"value": "Igual", "why_not": "No son iguales, ya que representan diferentes condiciones de contacto."}',
  choice_4: '{"value": "Depende de la velocidad", "why_not": "Aunque la velocidad puede influir en el rozamiento, no define la relación entre los coeficientes dinámico y estático."}',
  correct_answer: 'Menor'
)

MCQ3_TASK1_RZP = MultiChoiceQuestion.create(
  task_id: TASK1_RZP.id,
  difficulty: 0,
  question: '¿Qué condición debe cumplirse para que se inicie el movimiento entre dos superficies en contacto?',
  choice_1: '{"value": "La fuerza aplicada debe ser mayor que la fuerza de rozamiento estático.", "why_not": ""}',
  choice_2: '{"value": "La fuerza aplicada debe ser menor que la fuerza de rozamiento dinámico.", "why_not": "Esto no permitiría que el movimiento comenzara, ya que el rozamiento dinámico solo se aplica una vez que el cuerpo ya se desliza."}',
  choice_3: '{"value": "La fuerza normal debe ser cero.", "why_not": "Si la fuerza normal es cero, no puede haber fuerza de rozamiento en absoluto."}',
  choice_4: '{"value": "La fuerza aplicada debe ser mayor que la fuerza de rozamiento dinámico.", "why_not": "Esta condición no se aplica antes de que el movimiento comience; el rozamiento dinámico solo actúa cuando ya hay deslizamiento."}',
  correct_answer: 'La fuerza aplicada debe ser mayor que la fuerza de rozamiento estático.'
)

MCQ4_TASK1_RZP = MultiChoiceQuestion.create(
  task_id: TASK1_RZP.id,
  difficulty: 0,
  question: '¿Cómo se calcula la fuerza de rozamiento?',
  choice_1: '{"value": "Fuerza de rozamiento = masa * gravedad", "why_not": "Esta fórmula calcula el peso del objeto, no la fuerza de rozamiento."}',
  choice_2: '{"value": "Fuerza de rozamiento = coeficiente de rozamiento * fuerza normal", "why_not": ""}',
  choice_3: '{"value": "Fuerza de rozamiento = masa * coeficiente de rozamiento", "why_not": "Esta fórmula no considera la fuerza normal, que es esencial para calcular el rozamiento."}',
  choice_4: '{"value": "Fuerza de rozamiento = coeficiente de rozamiento / fuerza normal", "why_not": "Esta relación no es válida, ya que el coeficiente de rozamiento no se divide por la fuerza normal."}',
  correct_answer: 'Fuerza de rozamiento = coeficiente de rozamiento * fuerza normal'
)

MCQ5_TASK1_RZP = MultiChoiceQuestion.create(
  task_id: TASK1_RZP.id,
  difficulty: 0,
  question: '¿Qué fuerza mantiene en equilibrio a un cuerpo sobre una pendiente cuando aún no ha comenzado a deslizar?',
  choice_1: '{"value": "Fuerza normal", "why_not": "Aunque la fuerza normal actúa sobre el cuerpo, no es la que impide el deslizamiento en este contexto."}',
  choice_2: '{"value": "Fuerza de rozamiento estático", "why_not": ""}',
  choice_3: '{"value": "Fuerza de rozamiento dinámico", "why_not": "Esta fuerza solo se aplica cuando el cuerpo ya está en movimiento."}',
  choice_4: '{"value": "Peso", "why_not": "El peso actúa hacia abajo y no impide el deslizamiento por sí mismo."}',
  correct_answer: 'Fuerza de rozamiento estático'
)

MCQ6_TASK1_RZP = MultiChoiceQuestion.create(
  task_id: TASK1_RZP.id,
  difficulty: 0,
  question: '¿Qué sucede cuando el coeficiente de rozamiento es cero?',
  choice_1: '{"value": "No hay resistencia al movimiento.", "why_not": ""}',
  choice_2: '{"value": "El cuerpo no puede moverse.", "why_not": "Si no hay resistencia, el cuerpo podría moverse libremente."}',
  choice_3: '{"value": "La fuerza de rozamiento aumenta.", "why_not": "Si el coeficiente es cero, no puede haber fuerza de rozamiento."}',
  choice_4: '{"value": "La fuerza normal se vuelve infinita.", "why_not": "La fuerza normal depende del peso y no se relaciona directamente con el coeficiente de rozamiento."}',
  correct_answer: 'No hay resistencia al movimiento.'
)

MCQ7_TASK1_RZP = MultiChoiceQuestion.create(
  task_id: TASK1_RZP.id,
  difficulty: 0,
  question: '¿Cómo afecta el coeficiente de rozamiento a la fuerza de rozamiento?',
  choice_1: '{"value": "La aumenta.", "why_not": ""}',
  choice_2: '{"value": "La disminuye.", "why_not": "Un coeficiente más bajo resultaría en una menor fuerza de rozamiento."}',
  choice_3: '{"value": "No la afecta.", "why_not": "El coeficiente de rozamiento es un factor determinante en el cálculo de la fuerza de rozamiento."}',
  choice_4: '{"value": "La invierte.", "why_not": "No existe un escenario donde el coeficiente de rozamiento invierta la dirección de la fuerza."}',
  correct_answer: 'La aumenta.'
)

MCQ8_TASK1_RZP = MultiChoiceQuestion.create(
  task_id: TASK1_RZP.id,
  difficulty: 0,
  question: '¿Qué fuerza actúa entre dos cuerpos que están en contacto y se mueven uno respecto del otro?',
  choice_1: '{"value": "Fuerza normal", "why_not": "La fuerza normal actúa perpendicularmente a las superficies de contacto, no en la dirección del movimiento."}',
  choice_2: '{"value": "Fuerza de rozamiento dinámico", "why_not": ""}',
  choice_3: '{"value": "Fuerza axial", "why_not": "La fuerza axial se refiere a fuerzas a lo largo de un eje, no a la interacción entre cuerpos en movimiento."}',
  choice_4: '{"value": "Fuerza de compresión", "why_not": "Esta fuerza actúa al comprimir cuerpos, no al deslizarse."}',
  correct_answer: 'Fuerza de rozamiento dinámico'
)

MCQ9_TASK1_RZP = MultiChoiceQuestion.create(
  task_id: TASK1_RZP.id,
  difficulty: 0,
  question: '¿Cómo se relaciona el rozamiento estático con la velocidad?',
  choice_1: '{"value": "Es proporcional a la velocidad.", "why_not": "El rozamiento estático no depende de la velocidad hasta que se inicie el movimiento."}',
  choice_2: '{"value": "No depende de la velocidad.", "why_not": ""}',
  choice_3: '{"value": "Disminuye a medida que aumenta la velocidad.", "why_not": "Esto no es cierto, ya que el rozamiento estático no se ve afectado por la velocidad hasta que comienza a deslizarse."}',
  choice_4: '{"value": "Aumenta con la velocidad.", "why_not": "El rozamiento estático permanece constante hasta que se supera."}',
  correct_answer: 'No depende de la velocidad.'
)

MCQ10_TASK1_RZP = MultiChoiceQuestion.create(
  task_id: TASK1_RZP.id,
  difficulty: 0,
  question: '¿Cuál es la función principal de una polea?',
  choice_1: '{"value": "Aumentar la velocidad.", "why_not": "Aunque puede cambiar la velocidad, su función principal no es aumentar la velocidad en sí misma."}',
  choice_2: '{"value": "Aumentar la fuerza necesaria.", "why_not": "La polea puede reducir la fuerza necesaria para levantar un objeto, no aumentarla."}',
  choice_3: '{"value": "Cambiar la dirección de la fuerza.", "why_not": ""}',
  choice_4: '{"value": "Aumentar el coeficiente de rozamiento.", "why_not": "La polea no está diseñada para afectar el coeficiente de rozamiento."}',
  correct_answer: 'Cambiar la dirección de la fuerza.'
)

MCQ1_TASK2_RZP = MultiChoiceQuestion.create(
  task_id: TASK2_RZP.id,
  difficulty: 0,
  question: 'La fuerza de _______ se opone al movimiento relativo entre dos superficies en contacto.',
  choice_1: '{"value": "Peso", "why_not": "La fuerza de peso actúa hacia abajo debido a la gravedad y no se opone al movimiento relativo."}',
  choice_2: '{"value": "Rozamiento", "why_not": ""}',
  choice_3: '{"value": "Torsión", "why_not": "La torsión se refiere a la rotación alrededor de un eje y no se relaciona directamente con el movimiento entre superficies."}',
  choice_4: '{"value": "Momento", "why_not": "Un momento se refiere a una fuerza que causa rotación, no a la resistencia al movimiento."}',
  correct_answer: 'Rozamiento'
)

MCQ2_TASK2_RZP = MultiChoiceQuestion.create(
  task_id: TASK2_RZP.id,
  difficulty: 0,
  question: 'El _______ de rozamiento estático es mayor que el dinámico.',
  choice_1: '{"value": "Coeficiente", "why_not": ""}',
  choice_2: '{"value": "Área", "why_not": "El área de contacto no determina la comparación entre los coeficientes de rozamiento estático y dinámico."}',
  choice_3: '{"value": "Volumen", "why_not": "El volumen no tiene relación con las fuerzas de rozamiento."}',
  choice_4: '{"value": "Punto", "why_not": "El punto no es una medida relacionada con el rozamiento."}',
  correct_answer: 'Coeficiente'
)

MCQ3_TASK2_RZP = MultiChoiceQuestion.create(
  task_id: TASK2_RZP.id,
  difficulty: 0,
  question: 'El rozamiento _______ ocurre cuando un objeto rueda sobre una superficie.',
  choice_1: '{"value": "Estático", "why_not": "El rozamiento estático ocurre cuando el objeto no se mueve respecto a la superficie."}',
  choice_2: '{"value": "Dinámico", "why_not": "El rozamiento dinámico se refiere al deslizamiento, no a la rodadura."}',
  choice_3: '{"value": "Por rodadura", "why_not": ""}',
  choice_4: '{"value": "Viscoso", "why_not": "El rozamiento viscoso se refiere a la resistencia en fluidos, no a la interacción entre superficies sólidas."}',
  correct_answer: 'Por rodadura'
)

MCQ4_TASK2_RZP = MultiChoiceQuestion.create(
  task_id: TASK2_RZP.id,
  difficulty: 0,
  question: 'La fuerza de rozamiento dinámico es proporcional a la _______ normal.',
  choice_1: '{"value": "Fuerza", "why_not": ""}',
  choice_2: '{"value": "Velocidad", "why_not": "La fuerza de rozamiento dinámico no es proporcional a la velocidad."}',
  choice_3: '{"value": "Área", "why_not": "Aunque el área puede influir, no es la principal"}',
  choice_4: '{"value": "Tensión", "why_not": "La tensión se refiere a fuerzas en cuerdas o materiales, no al rozamiento en superficies."}',
  correct_answer: 'Fuerza'
)

MCQ5_TASK2_RZP = MultiChoiceQuestion.create(
  task_id: TASK2_RZP.id,
  difficulty: 0,
  question: 'En una polea, el _______ ayuda a cambiar la dirección de la fuerza aplicada.',
  choice_1: '{"value": "Peso", "why_not": "El peso del objeto no afecta directamente el mecanismo de la polea."}',
  choice_2: '{"value": "Rozamiento", "why_not": "El rozamiento se relaciona con la resistencia al movimiento, no con la función de la polea."}',
  choice_3: '{"value": "Ángulo", "why_not": "El ángulo puede influir en la mecánica, pero no es el principal responsable de cambiar la dirección."}',
  choice_4: '{"value": "Sistema", "why_not": ""}',
  correct_answer: 'Sistema'
)

MCQ6_TASK2_RZP = MultiChoiceQuestion.create(
  task_id: TASK2_RZP.id,
  difficulty: 0,
  question: 'Si no hay _______ entre dos superficies, no habrá fuerza de rozamiento.',
  choice_1: '{"value": "Velocidad", "why_not": "La velocidad no es un requisito para que exista rozamiento."}',
  choice_2: '{"value": "Contacto", "why_not": ""}',
  choice_3: '{"value": "Fuerza", "why_not": "La fuerza es necesaria, pero no lo fundamental."}',
  choice_4: '{"value": "Movimiento", "why_not": "El movimiento no es necesario para que exista fuerza de rozamiento."}',
  correct_answer: 'Contacto'
)

MCQ7_TASK2_RZP = MultiChoiceQuestion.create(
  task_id: TASK2_RZP.id,
  difficulty: 0,
  question: 'La fórmula para calcular la fuerza de rozamiento es _______ por el coeficiente de rozamiento.',
  choice_1: '{"value": "Masa", "why_not": "La masa por sí sola no se relaciona directamente con la fuerza de rozamiento."}',
  choice_2: '{"value": "Área", "why_not": "El área no es un factor en la fórmula para calcular la fuerza de rozamiento."}',
  choice_3: '{"value": "Fuerza normal", "why_not": ""}',
  choice_4: '{"value": "Aceleración", "why_not": "La aceleración no se utiliza para calcular la fuerza de rozamiento en este contexto."}',
  correct_answer: 'Fuerza normal'
)

NQ1_TASK3_RZP = NumericQuestion.create!(
  task: TASK3_RZP,
  difficulty: 1,
  question: 'Un bloque de {A} kg está en reposo en una pendiente con un ángulo de {B}°. El coeficiente de rozamiento estático es {C}. ¿Cuál es la fuerza mínima necesaria para iniciar el movimiento?' ,
  correct_answer: '20',
  tolerance: 0.1,
  unit: 'N',
  hint_1: '¡No olvides! Los apoyos fijos (🔺) ejercen fuerza tanto en el eje horizontal como en el vertical.',
  hint_2: 'Los apoyos deslizantes (⭕️) solo aplican una fuerza. ¿En qué dirección crees que es?',
  hint_3: '¡Recuerda! Las fuerzas diagonales se pueden descomponer en componentes horizontales y verticales. ¿Estás usando el coseno o el seno?',
  created_at: Time.now,
  updated_at: Time.now
)

NumericTemplate.create!(
  numeric_question: NQ1_TASK3_RZP,
  diagram_data: 'template5',
  values: '{"masa": [3, 4, 5], "angle": [15, 30, 45], "roce": [0.2, 0.4, 0.6]} ',
  magnitudes: '{"force": "N"}',
  created_at: Time.now,
  updated_at: Time.now
)

NQ2_TASK4_RZP = NumericQuestion.create!(
  task: TASK4_RZP,
  difficulty: 1,
  question: 'Un bloque de {A} kg se encuentra en reposo sobre una superficie con un coeficiente de rozamiento estático de {B}. Determina la magnitud de la fuerza P necesaria para que una polea, con un coeficiente de rozamiento de {C}, comience a girar.' ,
  correct_answer: '20',
  tolerance: 0.1,
  unit: 'N',
  hint_1: '¡No olvides! Los apoyos fijos (🔺) ejercen fuerza tanto en el eje horizontal como en el vertical.',
  hint_2: 'Los apoyos deslizantes (⭕️) solo aplican una fuerza. ¿En qué dirección crees que es?',
  hint_3: '¡Recuerda! Las fuerzas diagonales se pueden descomponer en componentes horizontales y verticales. ¿Estás usando el coseno o el seno?',
  created_at: Time.now,
  updated_at: Time.now
)

NumericTemplate.create!(
  numeric_question: NQ2_TASK4_RZP,
  diagram_data: 'template6',
  values: '{"masa": [3, 4, 5], "roce": [0.2, 0.4, 0.6], "roce_polea": [0.1, 0.2, 0.3]} ',
  magnitudes: '{"force": "N"}',
  created_at: Time.now,
  updated_at: Time.now
)

# ------------------------------------------------------------------
# Para que los 3 estudiantes inicialmente tengan progreso 0 en los courses.
# Esto se hace también cada vez que se crea un nuevo user en su modelo.

[student1, student2, student3].each do |student|
  Course.all.each do |crs|
    unless UserCourse.exists?(user: student, course: crs)
      UserCourse.create(user: student, course: crs, progress: 0)
    end
  end
end
