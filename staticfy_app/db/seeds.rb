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
  choice_1: 'Equilibrio',
  choice_2: 'Movimiento',
  choice_3: 'Peso',
  choice_4: 'Fuerza',
  correct_answer: 'Movimiento',
)

multi_choice_question_2 = MultiChoiceQuestion.create(
  task_id: task1.id,
  difficulty: 0,
  question: 'Un apoyo deslizante restringe el desplazamiento en la dirección ______.',
  choice_1: 'Horizontal',
  choice_2: 'Vertical',
  choice_3: 'De giro',
  choice_4: 'Axial',
  correct_answer: 'Vertical',
)

multi_choice_question_3 = MultiChoiceQuestion.create(
  task_id: task1.id,
  difficulty: 0,
  question: '¿Cuál de las siguientes opciones define mejor un apoyo empotrado?',
  choice_1: 'Restricción del giro, pero no de los desplazamientos.',
  choice_2: 'Restricción de los desplazamientos en ambas direcciones y del giro.',
  choice_3: 'Permite el giro, pero restringe el desplazamiento en una dirección.',
  choice_4: 'Restringe el giro y el desplazamiento.',
  correct_answer: 'Restricción de los desplazamientos en ambas direcciones y del giro.',
)

multi_choice_question_4 = MultiChoiceQuestion.create(
  task_id: task1.id,
  difficulty: 0,
  question: '¿Qué tipo de conexión permite la transmisión de fuerza axial, pero no permite la transmisión de momento ni de fuerza de corte cuando está orientada en la dirección horizontal?',
  choice_1: 'Conexión rígida',
  choice_2: 'Conexión rotulada',
  choice_3: 'Biela',
  choice_4: 'Apoyo deslizante',
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
  hint_1: 'Hint 1',
  hint_2: 'Hint 2',
  hint_3: 'Hint 3',
  created_at: Time.now,
  updated_at: Time.now
)

numeric_question_3 = NumericQuestion.create!(
  task: task3,
  difficulty: 1,
  question: '¿Calcule el valor de la fuerza vertical aplicada por el apoyo fijo, dado que el ángulo de inclinación es {A}° y se le está aplicando una fuerza de {B} N perpendicular a la viga?',
  correct_answer: '20',
  tolerance: 0.1,
  unit: 'N',
  hint_1: 'Hint 1',
  hint_2: 'Hint 2',
  hint_3: 'Hint 3',
  created_at: Time.now,
  updated_at: Time.now
)

# Crear Numeric Templates
NumericTemplate.create!(
  numeric_question: numeric_question_2, # Asocia al numeric_question_2
  diagram_data: 'template1',
  values: '{"angle": [15, 30, 45, 60], "forceMagnitude": [3, 4, 5, 6]}',
  magnitudes: '{"force": "N"}',
  created_at: Time.now,
  updated_at: Time.now
)

NumericTemplate.create!(
  numeric_question: numeric_question_3, # Asocia al numeric_question_3
  diagram_data: 'template2',
  values: '{"angle": [10, 20], "forceMagnitude": [3, 4]}',
  magnitudes: '{"force": "N"}',
  created_at: Time.now,
  updated_at: Time.now
)
