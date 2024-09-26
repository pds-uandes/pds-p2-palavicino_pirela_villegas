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

# Easy task 1 - Difficulty 0 (multi_choice)
EASY1_VEI = Task.create(
  user_id: teacher.id,
  task_type: 'multi_choice',
  status: 'in_progress',
  name: 'EASY_1_VEI',
  is_finished: false,
  course_id: COURSE2.id,
  difficulty: 0
)

# Easy task 2 - Difficulty 1 (multi_choice)
EASY2_VEI = Task.create(
  user_id: teacher.id,
  task_type: 'multi_choice',
  status: 'in_progress',
  name: 'EASY_2_VEI',
  is_finished: false,
  course_id: COURSE2.id,
  difficulty: 1
)

# Medium task 1 - Difficulty 2 (multi_choice)
MID1_VEI = Task.create(
  user_id: teacher.id,
  task_type: 'multi_choice',
  status: 'in_progress',
  name: 'MID_1_VEI',
  is_finished: false,
  course_id: COURSE2.id,
  difficulty: 2
)

# Medium task 2 - Difficulty 3 (multi_choice)
MID2_VEI = Task.create(
  user_id: teacher.id,
  task_type: 'multi_choice',
  status: 'in_progress',
  name: 'MID_2_VEI',
  is_finished: false,
  course_id: COURSE2.id,
  difficulty: 3
)

# Task 5 - Difficulty 4 (numeric)
TASK5_VEI = Task.create(
  user_id: teacher.id,
  task_type: 'numeric',
  status: 'in_progress',
  name: 'Tarea 5',
  is_finished: false,
  course_id: COURSE2.id,
  difficulty: 4
)

# Task 6 - Difficulty 5 (numeric)
TASK6_VEI = Task.create(
  user_id: teacher.id,
  task_type: 'numeric',
  status: 'in_progress',
  name: 'Tarea 6',
  is_finished: false,
  course_id: COURSE2.id,
  difficulty: 5
)

# Preguntas Multi-choice para EASY1_VEI (Dificultad 0)
MCQ1_EASY1_VEI = MultiChoiceQuestion.create(
  task_id: EASY1_VEI.id,
  difficulty: 0,
  question: '¿Cuál de las siguientes opciones define mejor un apoyo empotrado?',
  choice_1: '{"value": "Restricción del giro, pero no de los desplazamientos.", "why_not": "🔄 Incorrecto. Un apoyo empotrado restringe tanto los giros como los desplazamientos."}',
  choice_2: '{"value": "Restricción de los desplazamientos en ambas direcciones y del giro.", "why_not": ""}',
  choice_3: '{"value": "Permite el giro, pero restringe el desplazamiento en una dirección.", "why_not": "🚫 No es correcto. Un apoyo empotrado no permite ningún giro."}',
  choice_4: '{"value": "Restringe el giro y el desplazamiento.", "why_not": "⚠️ Casi, pero no del todo. Un empotrado restringe los giros y también los desplazamientos en todas las direcciones."}',
  correct_answer: 'Restricción de los desplazamientos en ambas direcciones y del giro.'
)

MCQ2_EASY1_VEI = MultiChoiceQuestion.create(
  task_id: EASY1_VEI.id,
  difficulty: 0,
  question: '¿Qué tipo de conexión permite la transmisión de fuerza axial, pero no permite la transmisión de momento ni de fuerza de corte cuando está orientada en la dirección horizontal?',
  choice_1: '{"value": "Conexión rígida", "why_not": "🔧 Incorrecto. Una conexión rígida permite la transmisión de momentos, fuerzas axiales y de corte."}',
  choice_2: '{"value": "Conexión rotulada", "why_not": "⚙️ No es lo que buscamos. Una conexión rotulada permite el giro y restringe traslaciones, pero no cumple con la condición dada."}',
  choice_3: '{"value": "Biela", "why_not": ""}',
  choice_4: '{"value": "Apoyo deslizante", "why_not": "🎯 Incorrecto. Un apoyo deslizante permite deslizamientos y puede transmitir fuerza axial, pero no está diseñado específicamente para las condiciones dadas."}',
  correct_answer: 'Biela'
)

MCQ3_EASY1_VEI = MultiChoiceQuestion.create(
  task_id: EASY1_VEI.id,
  difficulty: 0,
  question: '¿Qué es una biela en el contexto de vínculos?',
  choice_1: '{"value": "Un tipo de conexión que permite el movimiento en todas las direcciones.", "why_not": "Una biela no permite movimiento en todas las direcciones"}',
  choice_2: '{"value": "Una restricción que solo permite el desplazamiento longitudinal en la dirección de la biela.", "why_not": ""}',
  choice_3: '{"value": "Un tipo de apoyo que restringe el giro pero permite el desplazamiento.", "why_not": "Una biela no está diseñada para restringir el giro"}',
  choice_4: '{"value": "Un dispositivo que restringe todos los grados de libertad de un cuerpo.", "why_not": "Una biela no restringe todos los grados de libertad"}',
  correct_answer: 'Una restricción que solo permite el desplazamiento longitudinal en la dirección de la biela.'
)

# Preguntas Multi-choice para EASY2_VEI (Dificultad 1)
MCQ1_EASY2_VEI = MultiChoiceQuestion.create(
  task_id: EASY2_VEI.id,
  difficulty: 1,
  question: 'Un vínculo es una restricción al ______ de un cuerpo, que impide su movimiento respecto de algún grado de libertad.',
  choice_1: '{"value": "Equilibrio", "why_not": "🤔 No del todo. Recuerda que el equilibrio es la condición en la que todas las fuerzas y momentos se compensan mutuamente. Aquí estamos hablando de una restricción."}',
  choice_2: '{"value": "Movimiento", "why_not": ""}',
  choice_3: '{"value": "Peso", "why_not": "🚫 Incorrecto. El peso es simplemente la fuerza debido a la gravedad, no una restricción que impida el movimiento."}',
  choice_4: '{"value": "Fuerza", "why_not": "💪 ¿Fuerza? La fuerza es una interacción que puede cambiar el movimiento, pero en este caso buscamos algo que restrinja el movimiento."}',
  correct_answer: 'Movimiento'
)

MCQ2_EASY2_VEI = MultiChoiceQuestion.create(
  task_id: EASY2_VEI.id,
  difficulty: 1,
  question: 'Un apoyo deslizante restringe el desplazamiento en la dirección ______.',
  choice_1: '{"value": "Horizontal", "why_not": "❌ No es correcto. Un apoyo deslizante permite el movimiento en la dirección horizontal."}',
  choice_2: '{"value": "Vertical", "why_not": ""}',
  choice_3: '{"value": "De giro", "why_not": "🌀 Casi, pero no. Un apoyo deslizante no restringe la rotación del cuerpo."}',
  choice_4: '{"value": "Axial", "why_not": "⬆️ No exactamente. Un apoyo deslizante permite el movimiento axial y no lo restringe."}',
  correct_answer: 'Vertical'
)

MCQ3_EASY2_VEI = MultiChoiceQuestion.create(
  task_id: EASY2_VEI.id,
  difficulty: 1,
  question: 'Una conexión rotulada genera ______ vínculos pero permite el giro.',
  choice_1: '{"value": "Uno", "why_not": "Una conexión rotulada no restringe únicamente un grado de libertad; más bien, afecta dos direcciones del movimiento."}',
  choice_2: '{"value": "Dos", "why_not": ""}',
  choice_3: '{"value": "Tres", "why_not": "Una conexión rotulada no restringe tres grados de libertad; se limita a dos."}',
  choice_4: '{"value": "Ningún", "why_not": "Una conexión rotulada no está diseñada para no generar vínculos; efectivamente genera restricciones en los desplazamientos."}',
  correct_answer: 'Dos'
)

# Preguntas Multi-choice para MID1_VEI (Dificultad 2)
MCQ1_MID1_VEI = MultiChoiceQuestion.create(
  task_id: MID1_VEI.id,
  difficulty: 2,
  question: '¿Cuál de las siguientes conexiones permite el giro pero restringe los desplazamientos?',
  choice_1: '{"value": "Conexión rígida", "why_not": "Una conexión rígida restringe tanto el giro como los desplazamientos."}',
  choice_2: '{"value": "Conexión rotulada", "why_not": ""}',
  choice_3: '{"value": "Biela", "why_not": "Una biela permite desplazamiento longitudinal, pero no restringe giros."}',
  choice_4: '{"value": "Apoyo deslizante", "why_not": "Un apoyo deslizante permite el deslizamiento en una dirección y restringe el desplazamiento en otra."}',
  correct_answer: 'Conexión rotulada'
)

MCQ2_MID1_VEI = MultiChoiceQuestion.create(
  task_id: MID1_VEI.id,
  difficulty: 2,
  question: 'En una conexión rotulada, ¿cuántos grados de libertad se restringen?',
  choice_1: '{"value": "Uno", "why_not": "La conexión rotulada no restringe solo un grado de libertad; afecta dos direcciones del movimiento."}',
  choice_2: '{"value": "Dos", "why_not": ""}',
  choice_3: '{"value": "Tres", "why_not": "La conexión rotulada no restringe tres grados de libertad, se limita a dos."}',
  choice_4: '{"value": "Ninguno", "why_not": "Una conexión rotulada genera restricciones en los desplazamientos."}',
  correct_answer: 'Dos'
)

MCQ3_MID1_VEI = MultiChoiceQuestion.create(
  task_id: MID1_VEI.id,
  difficulty: 2,
  question: '¿Qué tipo de apoyo permite el desplazamiento en una dirección pero restringe el giro?',
  choice_1: '{"value": "Apoyo empotrado", "why_not": "El apoyo empotrado restringe tanto los giros como los desplazamientos."}',
  choice_2: '{"value": "Apoyo deslizante", "why_not": ""}',
  choice_3: '{"value": "Conexión rotulada", "why_not": "La conexión rotulada permite el giro, no lo restringe."}',
  choice_4: '{"value": "Biela", "why_not": "Una biela no está diseñada para restringir giros; solo restringe desplazamientos en una dirección."}',
  correct_answer: 'Apoyo deslizante'
)

# Preguntas Multi-choice para MID2_VEI (Dificultad 3)
MCQ1_MID2_VEI = MultiChoiceQuestion.create(
  task_id: MID2_VEI.id,
  difficulty: 3,
  question: '¿Cuál es la característica principal de un apoyo empotrado?',
  choice_1: '{"value": "Permite el giro pero restringe el desplazamiento.", "why_not": "Un apoyo empotrado restringe tanto el giro como el desplazamiento."}',
  choice_2: '{"value": "Restringe el giro y el desplazamiento en todas las direcciones.", "why_not": ""}',
  choice_3: '{"value": "Permite el desplazamiento en todas las direcciones, pero restringe el giro.", "why_not": "Un apoyo empotrado no permite ningún desplazamiento."}',
  choice_4: '{"value": "Permite el giro en una dirección y el desplazamiento en otra.", "why_not": "El apoyo empotrado restringe completamente tanto giros como desplazamientos."}',
  correct_answer: 'Restringe el giro y el desplazamiento en todas las direcciones.'
)

MCQ2_MID2_VEI = MultiChoiceQuestion.create(
  task_id: MID2_VEI.id,
  difficulty: 3,
  question: '¿Qué tipo de conexión permite el giro pero no permite ningún desplazamiento?',
  choice_1: '{"value": "Conexión rotulada", "why_not": ""}',
  choice_2: '{"value": "Apoyo empotrado", "why_not": "Un apoyo empotrado no permite ni giro ni desplazamiento."}',
  choice_3: '{"value": "Biela", "why_not": "Una biela permite el desplazamiento longitudinal pero no restringe el giro."}',
  choice_4: '{"value": "Apoyo deslizante", "why_not": "Un apoyo deslizante permite el deslizamiento en una dirección y restringe en otra, pero no permite giro."}',
  correct_answer: 'Conexión rotulada'
)

MCQ3_MID2_VEI = MultiChoiceQuestion.create(
  task_id: MID2_VEI.id,
  difficulty: 3,
  question: 'En un sistema con un apoyo empotrado, ¿cuántos grados de libertad se restringen?',
  choice_1: '{"value": "Uno", "why_not": "Un apoyo empotrado restringe más de un grado de libertad."}',
  choice_2: '{"value": "Dos", "why_not": "El apoyo empotrado restringe tanto el giro como los desplazamientos, por lo que restringe más de dos grados de libertad."}',
  choice_3: '{"value": "Tres", "why_not": ""}',
  choice_4: '{"value": "Ninguno", "why_not": "Un apoyo empotrado genera restricciones en el giro y los desplazamientos, por lo que restringe grados de libertad."}',
  correct_answer: 'Tres'
)

# Preguntas numéricas para TASK5_VEI (Dificultad 4)
NQ1_TASK5_VEI = NumericQuestion.create!(
  task: TASK5_VEI,
  difficulty: 4,
  question: 'Calcule el valor de la fuerza vertical aplicada por el apoyo fijo, dado que el ángulo de inclinación es {A}° y se le está aplicando una fuerza de {B} N perpendicular a la viga.',
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
  numeric_question: NQ1_TASK5_VEI,
  diagram_data: 'template1',
  values: '{"angle": [15, 30, 45, 60], "forceMagnitude": [3, 4, 5, 6]}',
  magnitudes: '{"force": "N"}',
  created_at: Time.now,
  updated_at: Time.now
)

# Preguntas numéricas para TASK6_VEI (Dificultad 5)
NQ2_TASK6_VEI = NumericQuestion.create!(
  task: TASK6_VEI,
  difficulty: 5,
  question: 'Calcule el valor de la fuerza horizontal aplicada por el apoyo fijo, dado que se aplica una fuerza de {B} N a un ángulo de inclinación de {A}° respecto a la viga.',
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
  numeric_question: NQ2_TASK6_VEI,
  diagram_data: 'template2',
  values: '{"angle": [15, 30, 45, 60], "forceMagnitude": [3, 4, 5, 6]}',
  magnitudes: '{"force": "N"}',
  created_at: Time.now,
  updated_at: Time.now
)


# ------------------------------- DIAGRAMA DE CUERPO LIBRE (DCL) --------------------------------

EASY1_DCL = Task.create(
  user_id: teacher.id,
  task_type: 'multi_choice',
  status: 'in_progress',
  name: 'EASY_1_DCL',
  is_finished: false,
  course_id: COURSE1.id,
  difficulty: 0
)

EASY2_DCL = Task.create(
  user_id: teacher.id,
  task_type: 'multi_choice',
  status: 'in_progress',
  name: 'EASY_2_DCL',
  is_finished: false,
  course_id: COURSE1.id,
  difficulty: 1
)

MID1_DCL = Task.create(
  user_id: teacher.id,
  task_type: 'multi_choice',
  status: 'in_progress',
  name: 'MID_1_DCL',
  is_finished: false,
  course_id: COURSE1.id,
  difficulty: 2
)

MID2_DCL = Task.create(
  user_id: teacher.id,
  task_type: 'multi_choice',
  status: 'in_progress',
  name: 'MID_2_DCL',
  is_finished: false,
  course_id: COURSE1.id,
  difficulty: 3
)


TASK2_DCL = Task.create(
  user_id: teacher.id,
  task_type: 'numeric',
  status: 'in_progress',
  name: 'Tarea 5',
  is_finished: false,
  course_id: COURSE1.id,
  difficulty: 4
)

TASK3_DCL = Task.create(
  user_id: teacher.id,
  task_type: 'numeric',
  status: 'in_progress',
  name: 'Tarea 6',
  is_finished: false,
  course_id: COURSE1.id,
  difficulty: 5
)

MCQ1_EASY1_DCL = MultiChoiceQuestion.create(
  task_id: EASY1_DCL.id,
  difficulty: 0,
  question: '¿Qué es un diagrama de cuerpo libre?',
  choice_1: '{"value": "Una representación gráfica de las fuerzas y momentos aplicados a un cuerpo.", "why_not": ""}',
  choice_2: '{"value": "Un método para calcular la masa de un cuerpo rígido.", "why_not": "Este método se relaciona más con el estudio de la mecánica de cuerpos y no es específico de un diagrama de cuerpo libre."}',
  choice_3: '{"value": "Un sistema para restringir los grados de libertad de un cuerpo.", "why_not": "Aunque la restricción de grados de libertad es importante en el análisis estructural, no es lo que define un diagrama de cuerpo libre."}',
  choice_4: '{"value": "Una técnica para resolver ecuaciones diferenciales en cuerpos rígidos.", "why_not": "Esta técnica es más avanzada y no se relaciona directamente con la representación gráfica de fuerzas."}',
  correct_answer: 'Una representación gráfica de las fuerzas y momentos aplicados a un cuerpo.'
)

MCQ1_MID1_DCL = MultiChoiceQuestion.create(
  task_id: MID1_DCL.id,
  difficulty: 1,
  question: 'Un diagrama de cuerpo libre es una representación gráfica que muestra todas las ______ que actúan sobre un cuerpo o sistema.',
  choice_1: '{"value": "Fuerzas", "why_not": ""}',
  choice_2: '{"value": "Velocidades", "why_not": "Las velocidades son la tasa de cambio de posición, pero no son relevantes para un diagrama de cuerpo libre."}',
  choice_3: '{"value": "Distancias", "why_not": "Las distancias son magnitudes espaciales que no determinan las interacciones que se muestran en un DCL."}',
  choice_4: '{"value": "Áreas", "why_not": "Las áreas no representan las fuerzas o momentos en un sistema."}',
  correct_answer: 'Fuerzas'
)

MCQ2_MID1_DCL = MultiChoiceQuestion.create(
  task_id: MID1_DCL.id,
  difficulty: 1,
  question: 'En un diagrama de cuerpo libre, las fuerzas se representan como vectores que tienen magnitud, dirección y ______.',
  choice_1: '{"value": "Punto de aplicación", "why_not": "Aunque el punto de aplicación es crucial en la física de fuerzas, no es lo que se completa en esta oración."}',
  choice_2: '{"value": "Sentido", "why_not": ""}',
  choice_3: '{"value": "Color", "why_not": "El color no tiene relevancia en la representación física de las fuerzas."}',
  choice_4: '{"value": "Densidad", "why_not": "La densidad es una propiedad de los materiales, no de las fuerzas o su representación."}',
  correct_answer: 'Sentido'
)

MCQ3_MID1_DCL = MultiChoiceQuestion.create(
  task_id: MID1_DCL.id,
  difficulty: 1,
  question: 'Para dibujar un DCL correctamente, se deben eliminar todos los ______ del entorno y reemplazarlos con las fuerzas que ejercen.',
  choice_1: '{"value": "Ejes", "why_not": "Los ejes son útiles para orientar el análisis del problema, no se eliminan."}',
  choice_2: '{"value": "Apoyos", "why_not": ""}',
  choice_3: '{"value": "Ángulos", "why_not": "Los ángulos pueden ser importantes para calcular las fuerzas, pero no se eliminan."}',
  choice_4: '{"value": "Dimensiones", "why_not": "Las dimensiones no afectan directamente la creación de un DCL."}',
  correct_answer: 'Apoyos'
)

MCQ1_MID2_DCL = MultiChoiceQuestion.create(
  task_id: MID2_DCL.id,
  difficulty: 1,
  question: 'El primer paso para construir un diagrama de cuerpo libre es aislar el cuerpo o ______ que se está analizando.',
  choice_1: '{"value": "Vector", "why_not": "Los vectores representan fuerzas y no el cuerpo que se analiza."}',
  choice_2: '{"value": "Partícula", "why_not": "Una partícula se refiere a un modelo simplificado del cuerpo, pero no siempre es aplicable en cuerpos rígidos."}',
  choice_3: '{"value": "Sistema", "why_not": ""}',
  choice_4: '{"value": "Punto", "why_not": "Un punto es una representación matemática que no corresponde necesariamente al cuerpo completo."}',
  correct_answer: 'Sistema'
)

MCQ2_MID2_DCL = MultiChoiceQuestion.create(
  task_id: MID2_DCL.id,
  difficulty: 1,
  question: 'Las reacciones en los apoyos se representan en el DCL como ______ que equilibran las fuerzas externas aplicadas al cuerpo.',
  choice_1: '{"value": "Momentos", "why_not": "Aunque los momentos son importantes, no representan las reacciones en los apoyos de manera directa."}',
  choice_2: '{"value": "Áreas", "why_not": "Las áreas no son formas de representar las fuerzas o reacciones."}',
  choice_3: '{"value": "Vectores", "why_not": ""}',
  choice_4: '{"value": "Coordenadas", "why_not": "Las coordenadas indican posición, pero no representan fuerzas."}',
  correct_answer: 'Vectores'
)

MCQ2_EASY1_DCL = MultiChoiceQuestion.create(
  task_id: EASY1_DCL.id,
  difficulty: 0,
  question: '¿Qué información NO se debe incluir en un diagrama de cuerpo libre?',
  choice_1: '{"value": "Las fuerzas externas aplicadas al cuerpo.", "why_not": "Las fuerzas externas son esenciales en un DCL para entender las interacciones."}',
  choice_2: '{"value": "Las dimensiones del cuerpo.", "why_not": ""}',
  choice_3: '{"value": "Las reacciones en los apoyos.", "why_not": "Las reacciones en los apoyos son fundamentales para entender cómo el cuerpo responde a las fuerzas externas."}',
  choice_4: '{"value": "Los momentos aplicados al cuerpo.", "why_not": "Los momentos son fuerzas rotacionales que también deben estar en el DCL."}',
  correct_answer: 'Las dimensiones del cuerpo.'
)

MCQ3_EASY1_DCL = MultiChoiceQuestion.create(
  task_id: EASY1_DCL.id,
  difficulty: 0,
  question: '¿Cuál de los siguientes elementos es esencial para un diagrama de cuerpo libre?',
  choice_1: '{"value": "La masa del cuerpo.", "why_not": "La masa es importante en el análisis, pero no es un elemento que se represente directamente en el diagrama."}',
  choice_2: '{"value": "La velocidad del cuerpo.", "why_not": "La velocidad no se incluye en el diagrama, ya que se centra en fuerzas y momentos en un instante específico."}',
  choice_3: '{"value": "Las fuerzas aplicadas al cuerpo.", "why_not": ""}',
  choice_4: '{"value": "La posición inicial del cuerpo.", "why_not": "La posición inicial puede ser relevante en otros contextos, pero no es esencial en un diagrama de cuerpo libre."}',
  correct_answer: 'Las fuerzas aplicadas al cuerpo.'
)

MCQ1_EASY2_DCL = MultiChoiceQuestion.create(
  task_id: EASY2_DCL.id,
  difficulty: 0,
  question: 'En un diagrama de cuerpo libre, ¿cómo se representa un momento aplicado al cuerpo?',
  choice_1: '{"value": "Como una fuerza en dirección opuesta.", "why_not": "Un momento no se puede representar simplemente como una fuerza opuesta; requiere una representación diferente."}',
  choice_2: '{"value": "Como una flecha curva alrededor de un punto.", "why_not": ""}',
  choice_3: '{"value": "Como un vector perpendicular al plano.", "why_not": "Un vector perpendicular puede representar fuerzas, pero no captura la naturaleza de un momento aplicado."}',
  choice_4: '{"value": "Como un punto sin dirección.", "why_not": "Un punto sin dirección no proporciona información útil sobre la aplicación de un momento."}',
  correct_answer: 'Como una flecha curva alrededor de un punto.'
)

MCQ2_EASY2_DCL = MultiChoiceQuestion.create(
  task_id: EASY2_DCL.id,
  difficulty: 0,
  question: 'En un diagrama de cuerpo libre, ¿qué se debe tener en cuenta al representar las fuerzas? ',
  choice_1: '{"value": "La dirección y el color de las fuerzas.", "why_not": "El color no tiene relevancia física en un diagrama de cuerpo libre (DCL)."}',
  choice_2: '{"value": "Sólo la magnitud de las fuerzas.", "why_not": "En un DCL, no solo es importante la magnitud de las fuerzas."}',
  choice_3: '{"value": "La magnitud, dirección y punto de aplicación de las fuerzas.", "why_not": ""}',
  choice_4: '{"value": "El momento angular asociado a cada fuerza.", "why_not": "Los momentos angulares son importantes en ciertos análisis dinámicos, pero en un DCL no."}',
  correct_answer: 'La magnitud, dirección y punto de aplicación de las fuerzas.'
)

NQ1_TASK2_DCL = NumericQuestion.create!(
  task: TASK2_DCL,
  difficulty: 2,
  question: 'Realiza un diagrama de cuerpo libre (DCL) y calcula la fuerza normal que actúa sobre el cuerpo, sabiendo que tiene una masa de {A} kg. (Considere gravedad = 9.8 m/s2)',
  correct_answer: '20',
  tolerance: 0.1,
  unit: 'N',
  hint_1: 'Recuerda realizar el DCL con todas las fuerzas presentes en el sistema.',
  hint_2: 'Recuerda que la fuerza normal siempre es perpendicular a la superficie.',
  hint_3: '¡No lo olvides! la fórmula del peso es P = masa x gravedad.',
  created_at: Time.now,
  updated_at: Time.now
)

NumericTemplate.create!(
  numeric_question: NQ1_TASK2_DCL,
  diagram_data: 'template9',
  values: '{"masa": [30, 40, 50], "forceMagnitude": [3, 4, 5]}',
  magnitudes: '{"force": "N"}',
  created_at: Time.now,
  updated_at: Time.now
)

NQ2_TASK3_DCL = NumericQuestion.create!(
  task: TASK3_DCL,
  difficulty: 2,
  question: 'Realiza un DCL y calcula el valor de la componente vertical (Y) de la fuerza peso, sabiendo que el cuerpo, con una masa de {A} kg, se encuentra sobre un plano inclinado a {B}°. (Considere gravedad = 9.8 m/s2)',
  correct_answer: '20',
  tolerance: 0.1,
  unit: 'N',
  hint_1: '¡No olvides! La fórmula del peso es P = masa x gravedad.',
  hint_2: 'Recuerda definir tus ejes coordenados en la dirección del movimiento del ejercicio',
  hint_3: 'Puedes descomponer la fuerza del peso en 2 componentes.',
  created_at: Time.now,
  updated_at: Time.now
)

NumericTemplate.create!(
  numeric_question: NQ2_TASK3_DCL,
  diagram_data: 'template10',
  values: '{"masa": [30, 40, 50], "angle": [15, 30, 45]}',
  magnitudes: '{"force": "N"}',
  created_at: Time.now,
  updated_at: Time.now
)


# ------------------------------- CONDICIONES DE EQUILIBRIO Y ESTABILIDAD (CEE) --------------------------------

# Easy task 1 - Difficulty 0 (multi_choice)
EASY1_CEE = Task.create(
  user_id: teacher.id,
  task_type: 'multi_choice',
  status: 'in_progress',
  name: 'EASY_1_CEE',
  is_finished: false,
  course_id: COURSE3.id,
  difficulty: 0
)

# Easy task 2 - Difficulty 1 (multi_choice)
EASY2_CEE = Task.create(
  user_id: teacher.id,
  task_type: 'multi_choice',
  status: 'in_progress',
  name: 'EASY_2_CEE',
  is_finished: false,
  course_id: COURSE3.id,
  difficulty: 1
)

# Medium task 1 - Difficulty 2 (multi_choice)
MID1_CEE = Task.create(
  user_id: teacher.id,
  task_type: 'multi_choice',
  status: 'in_progress',
  name: 'MID_1_CEE',
  is_finished: false,
  course_id: COURSE3.id,
  difficulty: 2
)

# Medium task 2 - Difficulty 3 (multi_choice)
MID2_CEE = Task.create(
  user_id: teacher.id,
  task_type: 'multi_choice',
  status: 'in_progress',
  name: 'MID_2_CEE',
  is_finished: false,
  course_id: COURSE3.id,
  difficulty: 3
)

# Task 5 - Difficulty 4 (numeric)
TASK5_CEE = Task.create(
  user_id: teacher.id,
  task_type: 'numeric',
  status: 'in_progress',
  name: 'Tarea 5',
  is_finished: false,
  course_id: COURSE3.id,
  difficulty: 4
)

# Task 6 - Difficulty 5 (numeric)
TASK6_CEE = Task.create(
  user_id: teacher.id,
  task_type: 'numeric',
  status: 'in_progress',
  name: 'Tarea 6',
  is_finished: false,
  course_id: COURSE3.id,
  difficulty: 5
)

# Preguntas Multi-choice para EASY1_CEE (Dificultad 0)
MCQ1_EASY1_CEE = MultiChoiceQuestion.create(
  task_id: EASY1_CEE.id,
  difficulty: 0,
  question: '¿Qué condición debe cumplirse para que un sistema esté en equilibrio?',
  choice_1: '{"value": "La suma de fuerzas y momentos debe ser cero.", "why_not": ""}',
  choice_2: '{"value": "La suma de fuerzas debe ser mayor que cero.", "why_not": "En equilibrio, la suma de fuerzas y momentos debe ser exactamente cero."}',
  choice_3: '{"value": "Solo la suma de momentos debe ser cero.", "why_not": "Ambas, la suma de fuerzas y momentos, deben ser cero."}',
  choice_4: '{"value": "La suma de fuerzas debe ser cero, pero los momentos pueden variar.", "why_not": "Ambas magnitudes deben ser cero para que el sistema esté en equilibrio."}',
  correct_answer: 'La suma de fuerzas y momentos debe ser cero.'
)

MCQ2_EASY1_CEE = MultiChoiceQuestion.create(
  task_id: EASY1_CEE.id,
  difficulty: 0,
  question: '¿Cuántas ecuaciones de equilibrio se pueden usar en un sistema en dos dimensiones?',
  choice_1: '{"value": "Dos", "why_not": "Aunque dos ecuaciones son necesarias, en realidad se usan tres en total para resolver un sistema en 2D."}',
  choice_2: '{"value": "Tres", "why_not": ""}',
  choice_3: '{"value": "Una", "why_not": "No es suficiente con una ecuación; se necesitan tres."}',
  choice_4: '{"value": "Cuatro", "why_not": "Cuatro ecuaciones se utilizarían en un sistema tridimensional, no en dos dimensiones."}',
  correct_answer: 'Tres'
)

MCQ3_EASY1_CEE = MultiChoiceQuestion.create(
  task_id: EASY1_CEE.id,
  difficulty: 0,
  question: 'En un sistema estáticamente determinado, ¿cuántas incógnitas hay respecto a las ecuaciones disponibles?',
  choice_1: '{"value": "Más incógnitas que ecuaciones.", "why_not": "Si hay más incógnitas que ecuaciones, el sistema es indeterminado."}',
  choice_2: '{"value": "Menos incógnitas que ecuaciones.", "why_not": "En este caso, el sistema sería sobreconstrainado."}',
  choice_3: '{"value": "El mismo número de incógnitas y ecuaciones.", "why_not": ""}',
  choice_4: '{"value": "Ninguna relación entre incógnitas y ecuaciones.", "why_not": "Siempre debe haber una relación entre las incógnitas y las ecuaciones en sistemas estáticamente determinados."}',
  correct_answer: 'El mismo número de incógnitas y ecuaciones.'
)

# Preguntas Multi-choice para EASY2_CEE (Dificultad 1)
MCQ1_EASY2_CEE = MultiChoiceQuestion.create(
  task_id: EASY2_CEE.id,
  difficulty: 1,
  question: 'Un sistema estructural es isostático cuando...',
  choice_1: '{"value": "El número de ecuaciones es igual al número de incógnitas.", "why_not": ""}',
  choice_2: '{"value": "El número de incógnitas es mayor que el número de ecuaciones.", "why_not": "Esto sería un sistema hiperestático o indeterminado."}',
  choice_3: '{"value": "El número de ecuaciones es mayor que el número de incógnitas.", "why_not": "En este caso, el sistema sería sobreconstrainado."}',
  choice_4: '{"value": "No hay incógnitas en el sistema.", "why_not": "Un sistema isostático tiene el mismo número de ecuaciones e incógnitas."}',
  correct_answer: 'El número de ecuaciones es igual al número de incógnitas.'
)

MCQ2_EASY2_CEE = MultiChoiceQuestion.create(
  task_id: EASY2_CEE.id,
  difficulty: 1,
  question: '¿Qué tipo de equilibrio ocurre cuando un cuerpo vuelve a su posición original después de ser ligeramente desplazado?',
  choice_1: '{"value": "Equilibrio estable", "why_not": ""}',
  choice_2: '{"value": "Equilibrio inestable", "why_not": "En equilibrio inestable, el cuerpo no regresa a su posición inicial después de ser desplazado."}',
  choice_3: '{"value": "Equilibrio neutro", "why_not": "En el equilibrio neutro, el cuerpo permanece en su nueva posición tras el desplazamiento."}',
  choice_4: '{"value": "Equilibrio dinámico", "why_not": "El equilibrio dinámico implica movimiento continuo."}',
  correct_answer: 'Equilibrio estable'
)

MCQ3_EASY2_CEE = MultiChoiceQuestion.create(
  task_id: EASY2_CEE.id,
  difficulty: 1,
  question: 'En un cuerpo rígido en equilibrio, ¿qué se puede decir de la suma de momentos?',
  choice_1: '{"value": "Es mayor que cero.", "why_not": "La suma de momentos debe ser cero en equilibrio, no mayor que cero."}',
  choice_2: '{"value": "Es menor que cero.", "why_not": "No puede ser menor que cero. Debe ser exactamente cero para que haya equilibrio."}',
  choice_3: '{"value": "Es igual a cero.", "why_not": ""}',
  choice_4: '{"value": "Es igual a la mitad de la fuerza aplicada.", "why_not": "La suma de momentos no está relacionada de esta manera con la fuerza aplicada."}',
  correct_answer: 'Es igual a cero.'
)

# Preguntas Multi-choice para MID1_CEE (Dificultad 2)
MCQ1_MID1_CEE = MultiChoiceQuestion.create(
  task_id: MID1_CEE.id,
  difficulty: 2,
  question: '¿Cuál de las siguientes afirmaciones describe un sistema inestable?',
  choice_1: '{"value": "Un sistema en el que las ecuaciones son menores que las incógnitas.", "why_not": ""}',
  choice_2: '{"value": "Un sistema en el que las ecuaciones son mayores que las incógnitas.", "why_not": "Esto describiría un sistema sobreconstrainado, no inestable."}',
  choice_3: '{"value": "Un sistema en el que las incógnitas son iguales a las ecuaciones.", "why_not": "Esto describiría un sistema isostático, no inestable."}',
  choice_4: '{"value": "Un sistema en el que no hay fuerzas actuando.", "why_not": "Un sistema sin fuerzas no necesariamente es inestable."}',
  correct_answer: 'Un sistema en el que las ecuaciones son menores que las incógnitas.'
)

MCQ2_MID1_CEE = MultiChoiceQuestion.create(
  task_id: MID1_CEE.id,
  difficulty: 2,
  question: 'Un sistema está en equilibrio si...',
  choice_1: '{"value": "La suma de las fuerzas es mayor que cero.", "why_not": "La suma de las fuerzas y momentos debe ser cero para que un sistema esté en equilibrio."}',
  choice_2: '{"value": "La suma de las fuerzas es igual a cero y la suma de los momentos es igual a cero.", "why_not": ""}',
  choice_3: '{"value": "La suma de los momentos es mayor que cero.", "why_not": "Tanto las fuerzas como los momentos deben sumarse a cero para que haya equilibrio."}',
  choice_4: '{"value": "La suma de las fuerzas es cero, pero los momentos pueden variar.", "why_not": "Ambas condiciones deben cumplirse para que el sistema esté en equilibrio."}',
  correct_answer: 'La suma de las fuerzas es igual a cero y la suma de los momentos es igual a cero.'
)

MCQ3_MID1_CEE = MultiChoiceQuestion.create(
  task_id: MID1_CEE.id,
  difficulty: 2,
  question: 'En un sistema tridimensional, ¿cuántas ecuaciones de equilibrio existen?',
  choice_1: '{"value": "Tres", "why_not": "Tres ecuaciones son para sistemas bidimensionales, no tridimensionales."}',
  choice_2: '{"value": "Seis", "why_not": ""}',
  choice_3: '{"value": "Cuatro", "why_not": "No hay cuatro ecuaciones en sistemas tridimensionales; son seis."}',
  choice_4: '{"value": "Cinco", "why_not": "No hay cinco ecuaciones de equilibrio en un sistema tridimensional."}',
  correct_answer: 'Seis'
)

# Preguntas Multi-choice para MID2_CEE (Dificultad 3)
MCQ1_MID2_CEE = MultiChoiceQuestion.create(
  task_id: MID2_CEE.id,
  difficulty: 3,
  question: 'En un sistema hiperestático, ¿qué relación existe entre ecuaciones e incógnitas?',
  choice_1: '{"value": "Hay más incógnitas que ecuaciones.", "why_not": ""}',
  choice_2: '{"value": "Hay más ecuaciones que incógnitas.", "why_not": "Esto describiría un sistema sobreconstrainado."}',
  choice_3: '{"value": "El número de ecuaciones es igual al número de incógnitas.", "why_not": "Esto describiría un sistema isostático."}',
  choice_4: '{"value": "No hay ecuaciones.", "why_not": "Siempre hay ecuaciones en un sistema, incluso si es indeterminado."}',
  correct_answer: 'Hay más incógnitas que ecuaciones.'
)

MCQ2_MID2_CEE = MultiChoiceQuestion.create(
  task_id: MID2_CEE.id,
  difficulty: 3,
  question: 'Cuando una estructura tiene más restricciones de las necesarias, se dice que es...',
  choice_1: '{"value": "Isostática", "why_not": "Una estructura isostática tiene el número justo de restricciones."}',
  choice_2: '{"value": "Hiperestática", "why_not": ""}',
  choice_3: '{"value": "Inestable", "why_not": "Una estructura inestable tiene menos restricciones de las necesarias."}',
  choice_4: '{"value": "Equilibrada", "why_not": "El equilibrio no implica tener más restricciones de las necesarias."}',
  correct_answer: 'Hiperestática'
)

MCQ3_MID2_CEE = MultiChoiceQuestion.create(
  task_id: MID2_CEE.id,
  difficulty: 3,
  question: '¿Qué es un sistema inestable?',
  choice_1: '{"value": "Un sistema con más incógnitas que ecuaciones.", "why_not": ""}',
  choice_2: '{"value": "Un sistema en el que las ecuaciones son iguales a las incógnitas.", "why_not": "Esto sería un sistema isostático, no inestable."}',
  choice_3: '{"value": "Un sistema con más ecuaciones que incógnitas.", "why_not": "Esto sería un sistema sobreconstrainado, no inestable."}',
  choice_4: '{"value": "Un sistema sin restricciones.", "why_not": "Un sistema inestable aún tiene restricciones, pero insuficientes."}',
  correct_answer: 'Un sistema con más incógnitas que ecuaciones.'
)

# Preguntas numéricas para TASK5_CEE (Dificultad 4)
NQ1_TASK5_CEE = NumericQuestion.create!(
  task: TASK5_CEE,
  difficulty: 4,
  question: 'Calcule la fuerza en el apoyo fijo de una viga de 5 metros con una carga puntual de {B} N a {A} metros del extremo.',
  correct_answer: '20',
  tolerance: 0.1,
  unit: 'N',
  hint_1: 'Recuerda que un apoyo fijo (🔺) tiene una reacción vertical y horizontal.',
  hint_2: 'Usa las ecuaciones de equilibrio para resolver el sistema.',
  hint_3: 'Descompón la fuerza en componentes y aplica el momento en el punto adecuado.',
  created_at: Time.now,
  updated_at: Time.now
)

NumericTemplate.create!(
  numeric_question: NQ1_TASK5_CEE,
  diagram_data: 'template7',
  values: '{"forcePosition": [2, 3, 4], "forceMagnitude": [500, 600, 700]}',
  magnitudes: '{"force": "N"}',
  created_at: Time.now,
  updated_at: Time.now
)

# Preguntas numéricas para TASK6_CEE (Dificultad 5)
NQ2_TASK6_CEE = NumericQuestion.create!(
  task: TASK6_CEE,
  difficulty: 5,
  question: 'Calcule la reacción en el apoyo deslizante de una estructura con una carga distribuida de {A} N/m sobre una viga de {B} metros.',
  correct_answer: '20',
  tolerance: 0.1,
  unit: 'N',
  hint_1: 'El apoyo deslizante (⭕️) tiene solo una reacción vertical.',
  hint_2: 'Convierte la carga distribuida en una fuerza puntual equivalente.',
  hint_3: 'Aplica las ecuaciones de equilibrio para resolver el problema.',
  created_at: Time.now,
  updated_at: Time.now
)

NumericTemplate.create!(
  numeric_question: NQ2_TASK6_CEE,
  diagram_data: 'template8',
  values: '{"length": [3, 4, 5], "forceMagnitude": [300, 400, 500]}',
  magnitudes: '{"force": "N"}',
  created_at: Time.now,
  updated_at: Time.now
)


# ------------------------------- TIPOS DE FUERZAS MÁS COMUNES (TFC) --------------------------------

# Easy task 1 - Difficulty 0 (multi_choice)
EASY1_TFC = Task.create(
  user_id: teacher.id,
  task_type: 'multi_choice',
  status: 'in_progress',
  name: 'EASY_1_TFC',
  is_finished: false,
  course_id: COURSE4.id,
  difficulty: 0
)

# Easy task 2 - Difficulty 1 (multi_choice)
EASY2_TFC = Task.create(
  user_id: teacher.id,
  task_type: 'multi_choice',
  status: 'in_progress',
  name: 'EASY_2_TFC',
  is_finished: false,
  course_id: COURSE4.id,
  difficulty: 1
)

# Medium task 1 - Difficulty 2 (multi_choice)
MID1_TFC = Task.create(
  user_id: teacher.id,
  task_type: 'multi_choice',
  status: 'in_progress',
  name: 'MID_1_TFC',
  is_finished: false,
  course_id: COURSE4.id,
  difficulty: 2
)

# Medium task 2 - Difficulty 3 (multi_choice)
MID2_TFC = Task.create(
  user_id: teacher.id,
  task_type: 'multi_choice',
  status: 'in_progress',
  name: 'MID_2_TFC',
  is_finished: false,
  course_id: COURSE4.id,
  difficulty: 3
)

# Task 5 - Difficulty 4 (numeric)
TASK5_TFC = Task.create(
  user_id: teacher.id,
  task_type: 'numeric',
  status: 'in_progress',
  name: 'Tarea 5',
  is_finished: false,
  course_id: COURSE4.id,
  difficulty: 4
)

# Task 6 - Difficulty 5 (numeric)
TASK6_TFC = Task.create(
  user_id: teacher.id,
  task_type: 'numeric',
  status: 'in_progress',
  name: 'Tarea 6',
  is_finished: false,
  course_id: COURSE4.id,
  difficulty: 5
)

# Preguntas Multi-choice para EASY1_TFC (Dificultad 0)
MCQ1_EASY1_TFC = MultiChoiceQuestion.create(
  task_id: EASY1_TFC.id,
  difficulty: 0,
  question: '¿Qué es una fuerza puntual?',
  choice_1: '{"value": "Una fuerza que actúa sobre todo el volumen del cuerpo.", "why_not": "Esto describe una fuerza distribuida."}',
  choice_2: '{"value": "Una fuerza aplicada en un único punto del cuerpo.", "why_not": ""}',
  choice_3: '{"value": "Una fuerza distribuida uniformemente en toda la superficie.", "why_not": "Esto también se refiere a una fuerza distribuida y no a una puntual."}',
  choice_4: '{"value": "Una fuerza que se aplica a lo largo de una línea.", "why_not": "Esto describe un tipo de fuerza diferente, no una fuerza puntual."}',
  correct_answer: 'Una fuerza aplicada en un único punto del cuerpo.'
)

MCQ2_EASY1_TFC = MultiChoiceQuestion.create(
  task_id: EASY1_TFC.id,
  difficulty: 0,
  question: '¿Cuál de los siguientes es un ejemplo de fuerza distribuida?',
  choice_1: '{"value": "Peso", "why_not": "Aunque el peso puede ser considerado como una carga distribuida, en sí mismo es una fuerza puntual si se aplica a un solo punto."}',
  choice_2: '{"value": "Carga puntual", "why_not": "Una carga puntual no se distribuye, actúa en un único punto."}',
  choice_3: '{"value": "Carga distribuida sobre un área", "why_not": ""}',
  choice_4: '{"value": "Momento puntual", "why_not": "Un momento puntual es una fuerza en un punto, no una carga distribuida."}',
  correct_answer: 'Carga distribuida sobre un área.'
)

MCQ3_EASY1_TFC = MultiChoiceQuestion.create(
  task_id: EASY1_TFC.id,
  difficulty: 0,
  question: '¿Qué tipo de fuerza actúa sobre el largo de una viga?',
  choice_1: '{"value": "Fuerza distribuida.", "why_not": ""}',
  choice_2: '{"value": "Fuerza puntual.", "why_not": "Esto se refiere a una fuerza aplicada en un solo punto, no a lo largo de toda la viga."}',
  choice_3: '{"value": "Momento puntual.", "why_not": "Un momento puntual actúa en un punto específico, no a lo largo de la viga."}',
  choice_4: '{"value": "Fuerza axial.", "why_not": "La fuerza axial puede actuar a lo largo de una viga, pero no describe la acción a lo largo de toda su longitud."}',
  correct_answer: 'Fuerza distribuida.'
)

# Preguntas Multi-choice para EASY2_TFC (Dificultad 1)
MCQ1_EASY2_TFC = MultiChoiceQuestion.create(
  task_id: EASY2_TFC.id,
  difficulty: 1,
  question: 'Una _______ es una fuerza que actúa en un solo punto de un cuerpo.',
  choice_1: '{"value": "Carga distribuida", "why_not": "Esto describe una fuerza que se aplica en varias partes, no en un solo punto."}',
  choice_2: '{"value": "Fuerza puntual", "why_not": ""}',
  choice_3: '{"value": "Fuerza de corte", "why_not": "Una fuerza de corte actúa en una línea, no en un solo punto."}',
  choice_4: '{"value": "Fuerza axial", "why_not": "Una fuerza axial actúa a lo largo de un eje, no en un solo punto."}',
  correct_answer: 'Fuerza puntual'
)

MCQ2_EASY2_TFC = MultiChoiceQuestion.create(
  task_id: EASY2_TFC.id,
  difficulty: 1,
  question: 'Una _______ se distribuye a lo largo de una parte o toda la longitud de un cuerpo.',
  choice_1: '{"value": "Fuerza puntual", "why_not": "Esta fuerza actúa en un único punto, no se distribuye."}',
  choice_2: '{"value": "Fuerza axial", "why_not": "Aunque se refiere a fuerzas a lo largo de un eje, no se distribuye."}',
  choice_3: '{"value": "Fuerza distribuida", "why_not": ""}',
  choice_4: '{"value": "Fuerza normal", "why_not": "Una fuerza axial actúa a lo largo de un eje, no en un solo punto."}',
  correct_answer: 'Fuerza distribuida'
)

MCQ3_EASY2_TFC = MultiChoiceQuestion.create(
  task_id: EASY2_TFC.id,
  difficulty: 1,
  question: 'El _______ es un tipo de fuerza que se genera cuando un cuerpo rota alrededor de un punto fijo.',
  choice_1: '{"value": "Momento", "why_not": ""}',
  choice_2: '{"value": "Peso", "why_not": "El peso es una fuerza que actúa hacia abajo debido a la gravedad, no es específico de la rotación."}',
  choice_3: '{"value": "Esfuerzo", "why_not": "El esfuerzo se refiere a la fuerza interna en un material, no a la rotación."}',
  choice_4: '{"value": "Desplazamiento", "why_not": "El desplazamiento se refiere a un cambio de posición, no a una fuerza."}',
  correct_answer: 'Momento'
)

# Preguntas Multi-choice para MID1_TFC (Dificultad 2)
MCQ1_MID1_TFC = MultiChoiceQuestion.create(
  task_id: MID1_TFC.id,
  difficulty: 2,
  question: '¿Qué sucede con una fuerza distribuida al ser reemplazada por una fuerza equivalente?',
  choice_1: '{"value": "Se mantiene la distribución de fuerzas internas.", "why_not": "Al reemplazar, la distribución interna no se conserva; se simplifica a una fuerza puntual."}',
  choice_2: '{"value": "Solo cambia la magnitud de la fuerza.", "why_not": "También se cambia la forma en que se aplica la fuerza, no sólo su magnitud."}',
  choice_3: '{"value": "Solo se mantiene el mismo efecto global sobre el sistema.", "why_not": ""}',
  choice_4: '{"value": "Desaparecen las reacciones en los apoyos.", "why_not": "Las reacciones en los apoyos dependen de las fuerzas aplicadas, y no desaparecen por el reemplazo."}',
  correct_answer: 'Solo se mantiene el mismo efecto global sobre el sistema.'
)

MCQ2_MID1_TFC = MultiChoiceQuestion.create(
  task_id: MID1_TFC.id,
  difficulty: 2,
  question: 'Las fuerzas _______ actúan sobre el volumen de un cuerpo tridimensional.',
  choice_1: '{"value": "Axiales", "why_not": "Las fuerzas axiales actúan a lo largo de un eje, no sobre el volumen."}',
  choice_2: '{"value": "Distribuidas", "why_not": ""}',
  choice_3: '{"value": "Puntuales", "why_not": "Las fuerzas puntuales actúan en un solo punto, no sobre un volumen."}',
  choice_4: '{"value": "Gravitatorias", "why_not": "Aunque las fuerzas gravitatorias pueden considerarse en un volumen, no describen las fuerzas en general que actúan sobre todo el volumen."}',
  correct_answer: 'Distribuidas'
)

MCQ3_MID1_TFC = MultiChoiceQuestion.create(
  task_id: MID1_TFC.id,
  difficulty: 2,
  question: 'Las cargas distribuidas sobre un área se miden en _______.',
  choice_1: '{"value": "N/m²", "why_not": ""}',
  choice_2: '{"value": "N/m³", "why_not": "Esta unidad se refiere a la densidad, no a cargas distribuidas."}',
  choice_3: '{"value": "N/m", "why_not": "Esta unidad se utiliza para cargas distribuidas a lo largo de una línea, no de un área."}',
  choice_4: '{"value": "N", "why_not": "Esta es la unidad de fuerza total, no de carga distribuida."}',
  correct_answer: 'N/m²'
)

# Preguntas Multi-choice para MID2_TFC (Dificultad 3)
MCQ1_MID2_TFC = MultiChoiceQuestion.create(
  task_id: MID2_TFC.id,
  difficulty: 3,
  question: '¿Qué tipo de momento actúa en toda la longitud de un cuerpo?',
  choice_1: '{"value": "Momento puntual.", "why_not": "Un momento puntual se aplica en un solo punto."}',
  choice_2: '{"value": "Momento axial.", "why_not": "Esto no describe un momento que actúa en toda la longitud."}',
  choice_3: '{"value": "Momento distribuido.", "why_not": ""}',
  choice_4: '{"value": "Momento torsional.", "why_not": "El momento torsional describe un tipo específico de momento, pero no abarca toda la longitud de un cuerpo."}',
  correct_answer: 'Momento distribuido.'
)

MCQ2_MID2_TFC = MultiChoiceQuestion.create(
  task_id: MID2_TFC.id,
  difficulty: 3,
  question: '¿Cuál es la fórmula correcta para calcular una fuerza equivalente para una carga distribuida uniformemente?',
  choice_1: '{"value": "Fuerza = carga total / longitud.", "why_not": "Esta fórmula no representa correctamente la relación entre carga total y fuerza equivalente."}',
  choice_2: '{"value": "Fuerza = carga total * longitud.", "why_not": ""}',
  choice_3: '{"value": "Fuerza = (carga total / área).", "why_not": "Esto no se aplica a una carga distribuida uniformemente."}',
  choice_4: '{"value": "Fuerza = (carga total * longitud / 2).", "why_not": "Esta fórmula no representa la forma correcta de calcular la fuerza equivalente."}',
  correct_answer: 'Fuerza = carga total * longitud.'
)

MCQ3_MID2_TFC = MultiChoiceQuestion.create(
  task_id: MID2_TFC.id,
  difficulty: 3,
  question: '¿Qué tipo de fuerza es independiente del área de contacto?',
  choice_1: '{"value": "Fuerza de corte.", "why_not": "La fuerza de corte sí depende del área de contacto, especialmente en materiales."}',
  choice_2: '{"value": "Fuerza de rozamiento.", "why_not": ""}',
  choice_3: '{"value": "Fuerza puntual.", "why_not": "Aunque se aplica en un solo punto, su efecto puede depender del área de contacto."}',
  choice_4: '{"value": "Momento puntual.", "why_not": "Un momento puntual no se refiere a un área de contacto, sino a una acción en un punto específico."}',
  correct_answer: 'Fuerza de rozamiento.'
)

# Preguntas numéricas para TASK5_TFC (Dificultad 4)
NQ1_TASK5_TFC = NumericQuestion.create!(
  task: TASK5_TFC,
  difficulty: 4,
  question: 'Determina la fuerza equivalente para una carga triangular que actúa en un segmento de {A} metros de longitud sobre la viga, con una intensidad máxima de {B} N/m en un extremo.' ,
  correct_answer: '20',
  tolerance: 0.1,
  unit: 'N',
  hint_1: '¡No olvides! En una carga triangular (🔺) la intensidad mínima siempre es 0 N/m.',
  hint_2: ' Considera la base del triángulo como la distancia desde donde comienza hasta donde termina la carga.',
  hint_3: '¡Recuerda! Calcula como si estuvieras calculando el área de un triángulo.',
  created_at: Time.now,
  updated_at: Time.now
)

NumericTemplate.create!(
  numeric_question: NQ1_TASK5_TFC,
  diagram_data: 'template4',
  values: '{"longitud": [3, 4, 5], "forceMagnitude": [300, 500, 600]}',
  magnitudes: '{"force": "N"}',
  created_at: Time.now,
  updated_at: Time.now
)

# Preguntas numéricas para TASK6_TFC (Dificultad 5)
NQ2_TASK6_TFC = NumericQuestion.create!(
  task: TASK6_TFC,
  difficulty: 5,
  question: 'Calcula el momento generado por una fuerza de {A} N aplicada a {B} metros del eje de rotación.' ,
  correct_answer: '20',
  tolerance: 0.1,
  unit: 'NM',
  hint_1: '¡No olvides! El momento es una medida de la tendencia de una fuerza a hacer girar un objeto alrededor de un punto o eje.',
  hint_2: 'El momento se calcula multiplicando la fuerza aplicada por la distancia perpendicular desde el punto donde se aplica la fuerza hasta el eje de rotación.',
  hint_3: '¡Recuerda! Calcula el valor para obtener el momento en Newton-metros (Nm).',
  created_at: Time.now,
  updated_at: Time.now
)

NumericTemplate.create!(
  numeric_question: NQ2_TASK6_TFC,
  diagram_data: 'template3',
  values: '{"forceMagnitude": [150, 200, 300], "longitud": [2, 3, 4]}',
  magnitudes: '{"force": "N"}',
  created_at: Time.now,
  updated_at: Time.now
)

# ------------------------------- ROZAMIENTO Y POLEAS (RZP) --------------------------------

# Easy task 1 - Difficulty 0 (multi_choice)
EASY1_RZP = Task.create(
  user_id: teacher.id,
  task_type: 'multi_choice',
  status: 'in_progress',
  name: 'EASY_1_RZP',
  is_finished: false,
  course_id: COURSE5.id,
  difficulty: 0
)

# Easy task 2 - Difficulty 1 (multi_choice)
EASY2_RZP = Task.create(
  user_id: teacher.id,
  task_type: 'multi_choice',
  status: 'in_progress',
  name: 'EASY_2_RZP',
  is_finished: false,
  course_id: COURSE5.id,
  difficulty: 1
)

# Medium task 1 - Difficulty 2 (multi_choice)
MID1_RZP = Task.create(
  user_id: teacher.id,
  task_type: 'multi_choice',
  status: 'in_progress',
  name: 'MID_1_RZP',
  is_finished: false,
  course_id: COURSE5.id,
  difficulty: 2
)

# Medium task 2 - Difficulty 3 (multi_choice)
MID2_RZP = Task.create(
  user_id: teacher.id,
  task_type: 'multi_choice',
  status: 'in_progress',
  name: 'MID_2_RZP',
  is_finished: false,
  course_id: COURSE5.id,
  difficulty: 3
)

# Task 5 - Difficulty 4 (numeric)
TASK5_RZP = Task.create(
  user_id: teacher.id,
  task_type: 'numeric',
  status: 'in_progress',
  name: 'Tarea 5',
  is_finished: false,
  course_id: COURSE5.id,
  difficulty: 4
)

# Task 6 - Difficulty 5 (numeric)
TASK6_RZP = Task.create(
  user_id: teacher.id,
  task_type: 'numeric',
  status: 'in_progress',
  name: 'Tarea 6',
  is_finished: false,
  course_id: COURSE5.id,
  difficulty: 5
)

# Preguntas Multi-choice para EASY1_RZP (Dificultad 0)
MCQ1_EASY1_RZP = MultiChoiceQuestion.create(
  task_id: EASY1_RZP.id,
  difficulty: 0,
  question: '¿Qué tipo de rozamiento ocurre cuando un cuerpo se desliza respecto de otro?',
  choice_1: '{"value": "Rozamiento estático", "why_not": "El rozamiento estático se produce cuando un cuerpo está en reposo respecto al otro, no al deslizarse."}',
  choice_2: '{"value": "Rozamiento dinámico", "why_not": ""}',
  choice_3: '{"value": "Rozamiento por rodadura", "why_not": "Este tipo de rozamiento ocurre cuando un cuerpo rueda sobre otro, no cuando se desliza."}',
  choice_4: '{"value": "Rozamiento viscoso", "why_not": "El rozamiento viscoso se refiere a la resistencia en fluidos, no al deslizamiento entre superficies sólidas."}',
  correct_answer: 'Rozamiento dinámico'
)

MCQ2_EASY1_RZP = MultiChoiceQuestion.create(
  task_id: EASY1_RZP.id,
  difficulty: 0,
  question: '¿Cómo es el coeficiente de rozamiento dinámico en comparación con el estático?',
  choice_1: '{"value": "Mayor", "why_not": "El coeficiente de rozamiento dinámico nunca es mayor."}',
  choice_2: '{"value": "Menor", "why_not": ""}',
  choice_3: '{"value": "Igual", "why_not": "No son iguales, ya que representan diferentes condiciones de contacto."}',
  choice_4: '{"value": "Depende de la velocidad", "why_not": "Aunque la velocidad puede influir en el rozamiento, no define la relación entre los coeficientes dinámico y estático."}',
  correct_answer: 'Menor'
)

MCQ3_EASY1_RZP = MultiChoiceQuestion.create(
  task_id: EASY1_RZP.id,
  difficulty: 0,
  question: '¿Qué condición debe cumplirse para que se inicie el movimiento entre dos superficies en contacto?',
  choice_1: '{"value": "La fuerza aplicada debe ser mayor que la fuerza de rozamiento estático.", "why_not": ""}',
  choice_2: '{"value": "La fuerza aplicada debe ser menor que la fuerza de rozamiento dinámico.", "why_not": "Esto no permitiría que el movimiento comenzara, ya que el rozamiento dinámico solo se aplica una vez que el cuerpo ya se desliza."}',
  choice_3: '{"value": "La fuerza normal debe ser cero.", "why_not": "Si la fuerza normal es cero, no puede haber fuerza de rozamiento en absoluto."}',
  choice_4: '{"value": "La fuerza aplicada debe ser mayor que la fuerza de rozamiento dinámico.", "why_not": "Esta condición no se aplica antes de que el movimiento comience; el rozamiento dinámico solo actúa cuando ya hay deslizamiento."}',
  correct_answer: 'La fuerza aplicada debe ser mayor que la fuerza de rozamiento estático.'
)

# Preguntas Multi-choice para EASY2_RZP (Dificultad 1)
MCQ1_EASY2_RZP = MultiChoiceQuestion.create(
  task_id: EASY2_RZP.id,
  difficulty: 1,
  question: 'La fuerza de _______ se opone al movimiento relativo entre dos superficies en contacto.',
  choice_1: '{"value": "Peso", "why_not": "La fuerza de peso actúa hacia abajo debido a la gravedad y no se opone al movimiento relativo."}',
  choice_2: '{"value": "Rozamiento", "why_not": ""}',
  choice_3: '{"value": "Torsión", "why_not": "La torsión se refiere a la rotación alrededor de un eje y no se relaciona directamente con el movimiento entre superficies."}',
  choice_4: '{"value": "Momento", "why_not": "Un momento se refiere a una fuerza que causa rotación, no a la resistencia al movimiento."}',
  correct_answer: 'Rozamiento'
)

MCQ2_EASY2_RZP = MultiChoiceQuestion.create(
  task_id: EASY2_RZP.id,
  difficulty: 1,
  question: 'El _______ de rozamiento estático es mayor que el dinámico.',
  choice_1: '{"value": "Coeficiente", "why_not": ""}',
  choice_2: '{"value": "Área", "why_not": "El área de contacto no determina la comparación entre los coeficientes de rozamiento estático y dinámico."}',
  choice_3: '{"value": "Volumen", "why_not": "El volumen no tiene relación con las fuerzas de rozamiento."}',
  choice_4: '{"value": "Punto", "why_not": "El punto no es una medida relacionada con el rozamiento."}',
  correct_answer: 'Coeficiente'
)

MCQ3_EASY2_RZP = MultiChoiceQuestion.create(
  task_id: EASY2_RZP.id,
  difficulty: 1,
  question: 'El rozamiento _______ ocurre cuando un objeto rueda sobre una superficie.',
  choice_1: '{"value": "Estático", "why_not": "El rozamiento estático ocurre cuando el objeto no se mueve respecto a la superficie."}',
  choice_2: '{"value": "Dinámico", "why_not": "El rozamiento dinámico se refiere al deslizamiento, no a la rodadura."}',
  choice_3: '{"value": "Por rodadura", "why_not": ""}',
  choice_4: '{"value": "Viscoso", "why_not": "El rozamiento viscoso se refiere a la resistencia en fluidos, no a la interacción entre superficies sólidas."}',
  correct_answer: 'Por rodadura'
)

# Preguntas Multi-choice para MID1_RZP (Dificultad 2)
MCQ1_MID1_RZP = MultiChoiceQuestion.create(
  task_id: MID1_RZP.id,
  difficulty: 2,
  question: '¿Cómo se calcula la fuerza de rozamiento?',
  choice_1: '{"value": "Fuerza de rozamiento = masa * gravedad", "why_not": "Esta fórmula calcula el peso del objeto, no la fuerza de rozamiento."}',
  choice_2: '{"value": "Fuerza de rozamiento = coeficiente de rozamiento * fuerza normal", "why_not": ""}',
  choice_3: '{"value": "Fuerza de rozamiento = masa * coeficiente de rozamiento", "why_not": "Esta fórmula no considera la fuerza normal, que es esencial para calcular el rozamiento."}',
  choice_4: '{"value": "Fuerza de rozamiento = coeficiente de rozamiento / fuerza normal", "why_not": "Esta relación no es válida, ya que el coeficiente de rozamiento no se divide por la fuerza normal."}',
  correct_answer: 'Fuerza de rozamiento = coeficiente de rozamiento * fuerza normal'
)

MCQ2_MID1_RZP = MultiChoiceQuestion.create(
  task_id: MID1_RZP.id,
  difficulty: 2,
  question: '¿Qué sucede cuando el coeficiente de rozamiento es cero?',
  choice_1: '{"value": "No hay resistencia al movimiento.", "why_not": ""}',
  choice_2: '{"value": "El cuerpo no puede moverse.", "why_not": "Si no hay resistencia, el cuerpo podría moverse libremente."}',
  choice_3: '{"value": "La fuerza de rozamiento aumenta.", "why_not": "Si el coeficiente es cero, no puede haber fuerza de rozamiento."}',
  choice_4: '{"value": "La fuerza normal se vuelve infinita.", "why_not": "La fuerza normal depende del peso y no se relaciona directamente con el coeficiente de rozamiento."}',
  correct_answer: 'No hay resistencia al movimiento.'
)

MCQ3_MID1_RZP = MultiChoiceQuestion.create(
  task_id: MID1_RZP.id,
  difficulty: 2,
  question: '¿Qué fuerza actúa entre dos cuerpos que están en contacto y se mueven uno respecto del otro?',
  choice_1: '{"value": "Fuerza normal", "why_not": "La fuerza normal actúa perpendicularmente a las superficies de contacto, no en la dirección del movimiento."}',
  choice_2: '{"value": "Fuerza de rozamiento dinámico", "why_not": ""}',
  choice_3: '{"value": "Fuerza axial", "why_not": "La fuerza axial se refiere a fuerzas a lo largo de un eje, no a la interacción entre cuerpos en movimiento."}',
  choice_4: '{"value": "Fuerza de compresión", "why_not": "Esta fuerza actúa al comprimir cuerpos, no al deslizarse."}',
  correct_answer: 'Fuerza de rozamiento dinámico'
)

# Preguntas Multi-choice para MID2_RZP (Dificultad 3)
MCQ1_MID2_RZP = MultiChoiceQuestion.create(
  task_id: MID2_RZP.id,
  difficulty: 3,
  question: '¿Cuál es la función principal de una polea?',
  choice_1: '{"value": "Aumentar la velocidad.", "why_not": "Aunque puede cambiar la velocidad, su función principal no es aumentar la velocidad en sí misma."}',
  choice_2: '{"value": "Aumentar la fuerza necesaria.", "why_not": "La polea puede reducir la fuerza necesaria para levantar un objeto, no aumentarla."}',
  choice_3: '{"value": "Cambiar la dirección de la fuerza.", "why_not": ""}',
  choice_4: '{"value": "Aumentar el coeficiente de rozamiento.", "why_not": "La polea no está diseñada para afectar el coeficiente de rozamiento."}',
  correct_answer: 'Cambiar la dirección de la fuerza.'
)

MCQ2_MID2_RZP = MultiChoiceQuestion.create(
  task_id: MID2_RZP.id,
  difficulty: 3,
  question: 'Si no hay _______ entre dos superficies, no habrá fuerza de rozamiento.',
  choice_1: '{"value": "Velocidad", "why_not": "La velocidad no es un requisito para que exista rozamiento."}',
  choice_2: '{"value": "Contacto", "why_not": ""}',
  choice_3: '{"value": "Fuerza", "why_not": "La fuerza es necesaria, pero no lo fundamental."}',
  choice_4: '{"value": "Movimiento", "why_not": "El movimiento no es necesario para que exista fuerza de rozamiento."}',
  correct_answer: 'Contacto'
)

MCQ3_MID2_RZP = MultiChoiceQuestion.create(
  task_id: MID2_RZP.id,
  difficulty: 3,
  question: 'La fórmula para calcular la fuerza de rozamiento es _______ por el coeficiente de rozamiento.',
  choice_1: '{"value": "Masa", "why_not": "La masa por sí sola no se relaciona directamente con la fuerza de rozamiento."}',
  choice_2: '{"value": "Área", "why_not": "El área no es un factor en la fórmula para calcular la fuerza de rozamiento."}',
  choice_3: '{"value": "Fuerza normal", "why_not": ""}',
  choice_4: '{"value": "Aceleración", "why_not": "La aceleración no se utiliza para calcular la fuerza de rozamiento en este contexto."}',
  correct_answer: 'Fuerza normal'
)

# Preguntas numéricas para TASK5_RZP (Dificultad 4)
NQ1_TASK5_RZP = NumericQuestion.create!(
  task: TASK5_RZP,
  difficulty: 4,
  question: 'Un bloque de {A} kg está en reposo en una pendiente con un ángulo de {B}°. El coeficiente de rozamiento estático es {C}. ¿Cuál es la fuerza mínima necesaria para iniciar el movimiento?' ,
  correct_answer: '20',
  tolerance: 0.1,
  unit: 'N',
  hint_1: '¡No olvides! El peso del bloque puede descomponerse en dos componentes.',
  hint_2: 'El rozamiento estático depende de la fuerza normal y el coeficiente de rozamiento estático. (Normal x coeficiente de rozamiento estático)',
  hint_3: '¡Recuerda! La fuerza de roce es contraria al movimiento del cuerpo.',
  created_at: Time.now,
  updated_at: Time.now
)

NumericTemplate.create!(
  numeric_question: NQ1_TASK5_RZP,
  diagram_data: 'template5',
  values: '{"masa": [3, 4, 5], "angle": [15, 30, 45], "roce": [0.2, 0.4, 0.6]} ',
  magnitudes: '{"force": "N"}',
  created_at: Time.now,
  updated_at: Time.now
)

# Preguntas numéricas para TASK6_RZP (Dificultad 5)
NQ2_TASK6_RZP = NumericQuestion.create!(
  task: TASK6_RZP,
  difficulty: 5,
  question: 'Un bloque de {A} kg se encuentra en reposo sobre una superficie con un coeficiente de rozamiento estático de {B}. Determina la magnitud de la fuerza P necesaria para que una polea, con un coeficiente de rozamiento de {C}, comience a girar.' ,
  correct_answer: '20',
  tolerance: 0.1,
  unit: 'N',
  hint_1: '¡No olvides! Realiza los DCL del cuerpo y de la polea y haz las ecuaciones de equilibrio.',
  hint_2: 'Para que la polea comience a girar, la fuerza P aplicada debe superar la resistencia causada por el rozamiento de la polea.',
  hint_3: '¡Recuerda! Al pasar por la polea las tensiones de cada lado son distintas, siguiendo la relación de T2 = T1 x exp(uB), siendo u el coeficiente de roce en la polea y B el ángulo que recorre la polea.',
  created_at: Time.now,
  updated_at: Time.now
)

NumericTemplate.create!(
  numeric_question: NQ2_TASK6_RZP,
  diagram_data: 'template6',
  values: '{"masa": [3, 4, 5], "roce": [0.2, 0.4, 0.6], "roce_polea": [0.1, 0.2, 0.3]} ',
  magnitudes: '{"force": "N"}',
  created_at: Time.now,
  updated_at: Time.now
)


# ------------------------------------------------------------------

# Este usuario tiene score 100% en todos los modulos, por lo que puede acceder a todos.
teacher_music = User.create(
  name: 'Rodrigo Music',
  email: 'rmusic@miuandes.cl',
  role: 'teacher',
  password: '123456'
)

[student1, student2, student3].each do |student|
  Course.all.each do |crs|
    unless UserCourse.exists?(user: student, course: crs)
      UserCourse.create(user: student, course: crs, progress: 0)
    end
  end
end

Course.all.each do |crs|
  unless UserCourse.exists?(user: teacher_music, course: crs)
    UserCourse.create(user: teacher_music, course: crs, progress: 10)
  end
end
