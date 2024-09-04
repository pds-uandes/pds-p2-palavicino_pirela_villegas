NumericTemplate.destroy_all
NumericQuestion.destroy_all
MultiChoiceQuestion.destroy_all
Task.destroy_all
User.destroy_all

teacher = User.create(
  name: 'Profesor Crocker',
  email: 'profecrocker@miuandes.cl',
  role: 'teacher',
  password: '123456'
)

student1 = User.create(
  name: 'Pedro Villegas',
  email: 'ppvillegas@miuandes.cl',
  role: 'student',
  password: '123456'
)

student2 = User.create(
  name: 'Franco Palavicino',
  email: 'fppalavicino@miuandes.cl',
  role: 'student',
  password: '123456'
)

student3 = User.create(
  name: 'Andrés Pirela',
  email: 'aepirela@miuandes.cl',
  role: 'student',
  password: '123456'
)

# Aunque aún no está implementado, pondré acá que las Tasks y Questions
# sean creadas solo por el Profesor Crocker (un user.role = teacher)

task1 = Task.create(
  user_id: teacher.id,
  task_type: 'multi_choice',
  status: 'in_progress',
  name: 'Conexiones y Apoyos',
  is_finished: false,
  wrong_counter: 0
)

# ------------------ Preguntas para la Task 1 ------------------
multi_choice_question_1 = MultiChoiceQuestion.create(
  task_id: task1.id,
  difficulty: 0,
  question: 'Un vínculo es una restricción al ______ de un cuerpo, que impide su movimiento respecto de algún grado de libertad.',
  choice_1: '{"value": "Equilibrio", "why_not": "buenas"}',
  choice_2: '{"value": "Movimiento", "why_not": ""}',
  choice_3: '{"value": "Peso", "why_not": "bla bla"}',
  choice_4: '{"value": "Fuerza", "why_not": "bla bla"}',
  correct_answer: 'Movimiento',
)

multi_choice_question_2 = MultiChoiceQuestion.create(
  task_id: task1.id,
  difficulty: 0,
  question: 'Un apoyo deslizante restringe el desplazamiento en la dirección ______.',
  choice_1: '{"value": "Horizontal", "why_not": "bla bla"}',
  choice_2: '{"value": "Vertical", "why_not": ""}',
  choice_3: '{"value": "De giro", "why_not": "bla bla"}',
  choice_4: '{"value": "Axial", "why_not": "bla bla"}',
  correct_answer: 'Vertical',
)

multi_choice_question_3 = MultiChoiceQuestion.create(
  task_id: task1.id,
  difficulty: 0,
  question: '¿Cuál de las siguientes opciones define mejor un apoyo empotrado?',
  choice_1: '{"value": "Restricción del giro, pero no de los desplazamientos.", "why_not": "bla bla"}',
  choice_2: '{"value": "Restricción de los desplazamientos en ambas direcciones y del giro.", "why_not": ""}',
  choice_3: '{"value": "Permite el giro, pero restringe el desplazamiento en una dirección.", "why_not": "bla bla"}',
  choice_4: '{"value": "Restringe el giro y el desplazamiento.", "why_not": "bla bla"}',
  correct_answer: 'Restricción de los desplazamientos en ambas direcciones y del giro.',
)

multi_choice_question_4 = MultiChoiceQuestion.create(
  task_id: task1.id,
  difficulty: 0,
  question: '¿Qué tipo de conexión permite la transmisión de fuerza axial, pero no permite la transmisión de momento ni de fuerza de corte cuando está orientada en la dirección horizontal?',
  choice_1: '{"value": "Conexión rígida", "why_not": "bla bla"}',
  choice_2: '{"value": "Conexión rotulada", "why_not": ""}',
  choice_3: '{"value": "Biela", "why_not": "bla bla"}',
  choice_4: '{"value": "Apoyo deslizante", "why_not": "bla bla"}',
  correct_answer: 'Biela',
)

# ------------------ Pregunta para la Task 2 ------------------
task2 = Task.create(
  user_id: teacher.id,
  task_type: 'numeric',
  status: 'in_progress',
  name: 'Tarea 2',
  is_finished: false,
  wrong_counter: 0
)

task3 = Task.create(
  user_id: teacher.id,
  task_type: 'numeric',
  status: 'in_progress',
  name: 'Tarea 3',
  is_finished: false,
  wrong_counter: 0
)

# Crear Numeric Questions
numeric_question_2 = NumericQuestion.create!(
  task: task2,
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

numeric_question_3 = NumericQuestion.create!(
  task: task3,
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
  numeric_question: numeric_question_2, 
  diagram_data: 'template1',
  values: '{"angle": [15, 30, 45, 60], "forceMagnitude": [3, 4, 5, 6]}',
  magnitudes: '{"force": "N"}',
  created_at: Time.now,
  updated_at: Time.now
)

NumericTemplate.create!(
  numeric_question: numeric_question_3, 
  diagram_data: 'template2',
  values: '{"angle": [15, 30, 45, 60], "forceMagnitude": [3, 4, 5, 6]}',
  magnitudes: '{"force": "N"}',
  created_at: Time.now,
  updated_at: Time.now
)
