NumericTemplate.destroy_all
NumericQuestion.destroy_all
MultiChoiceQuestion.destroy_all
Task.destroy_all
User.destroy_all
Course.destroy_all

course1 = Course.create(
  name: 'Diagramas de Cuerpo Libre',
  difficulty: 0,
  status: 'in_progress'
)

course2 = Course.create(
  name: 'Vínculos Externos e Internos',
  difficulty: 0,
  status: 'in_progress'
)

course3 = Course.create(
  name: 'Condiciones de Equilibrio y Estabilidad',
  difficulty: 1,
  status: 'in_progress'
)

course4 = Course.create(
  name: 'Tipos de fuerzas más comunes',
  difficulty: 2,
  status: 'in_progress'
)

course5 = Course.create(
  name: 'Rozamiento y Poleas',
  difficulty: 3,
  status: 'in_progress'
)


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

task1 = Task.create(
  user_id: teacher.id,
  task_type: 'multi_choice',
  status: 'in_progress',
  name: 'Conexiones y Apoyos',
  is_finished: false,
  wrong_counter: 0,
  course_id: course2.id
)

# ------------------ Preguntas para la Task 1 ------------------
multi_choice_question_1 = MultiChoiceQuestion.create(
  task_id: task1.id,
  difficulty: 0,
  question: 'Un vínculo es una restricción al ______ de un cuerpo, que impide su movimiento respecto de algún grado de libertad.',
  choice_1: '{"value": "Equilibrio", "why_not": "🤔 No del todo. Recuerda que el equilibrio es la condición en la que todas las fuerzas y momentos se compensan mutuamente. Aquí estamos hablando de una restricción."}',
  choice_2: '{"value": "Movimiento", "why_not": ""}',
  choice_3: '{"value": "Peso", "why_not": "🚫 Incorrecto. El peso es simplemente la fuerza debido a la gravedad, no una restricción que impida el movimiento."}',
  choice_4: '{"value": "Fuerza", "why_not": "💪 ¿Fuerza? La fuerza es una interacción que puede cambiar el movimiento, pero en este caso buscamos algo que restrinja el movimiento."}',
  correct_answer: 'Movimiento'
)

multi_choice_question_2 = MultiChoiceQuestion.create(
  task_id: task1.id,
  difficulty: 0,
  question: 'Un apoyo deslizante restringe el desplazamiento en la dirección ______.',
  choice_1: '{"value": "Horizontal", "why_not": "❌ No es correcto. Un apoyo deslizante permite el movimiento en la dirección horizontal."}',
  choice_2: '{"value": "Vertical", "why_not": ""}',
  choice_3: '{"value": "De giro", "why_not": "🌀 Casi, pero no. Un apoyo deslizante no restringe la rotación del cuerpo."}',
  choice_4: '{"value": "Axial", "why_not": "⬆️ No exactamente. Un apoyo deslizante permite el movimiento axial y no lo restringe."}',
  correct_answer: 'Vertical'
)

multi_choice_question_3 = MultiChoiceQuestion.create(
  task_id: task1.id,
  difficulty: 0,
  question: '¿Cuál de las siguientes opciones define mejor un apoyo empotrado?',
  choice_1: '{"value": "Restricción del giro, pero no de los desplazamientos.", "why_not": "🔄 Incorrecto. Un apoyo empotrado restringe tanto los giros como los desplazamientos."}',
  choice_2: '{"value": "Restricción de los desplazamientos en ambas direcciones y del giro.", "why_not": ""}',
  choice_3: '{"value": "Permite el giro, pero restringe el desplazamiento en una dirección.", "why_not": "🚫 No es correcto. Un apoyo empotrado no permite ningún giro."}',
  choice_4: '{"value": "Restringe el giro y el desplazamiento.", "why_not": "⚠️ Casi, pero no del todo. Un empotrado restringe los giros y también los desplazamientos en todas las direcciones."}',
  correct_answer: 'Restricción de los desplazamientos en ambas direcciones y del giro.'
)

multi_choice_question_4 = MultiChoiceQuestion.create(
  task_id: task1.id,
  difficulty: 0,
  question: '¿Qué tipo de conexión permite la transmisión de fuerza axial, pero no permite la transmisión de momento ni de fuerza de corte cuando está orientada en la dirección horizontal?',
  choice_1: '{"value": "Conexión rígida", "why_not": "🔧 Incorrecto. Una conexión rígida permite la transmisión de momentos, fuerzas axiales y de corte."}',
  choice_2: '{"value": "Conexión rotulada", "why_not": "⚙️ No es lo que buscamos. Una conexión rotulada permite el giro y restringe traslaciones, pero no cumple con la condición dada."}',
  choice_3: '{"value": "Biela", "why_not": ""}',
  choice_4: '{"value": "Apoyo deslizante", "why_not": "🎯 Incorrecto. Un apoyo deslizante permite deslizamientos y puede transmitir fuerza axial, pero no está diseñado específicamente para las condiciones dadas."}',
  correct_answer: 'Biela'
)

# ------------------ Pregunta para la Task 2 ------------------
task2 = Task.create(
  user_id: teacher.id,
  task_type: 'numeric',
  status: 'in_progress',
  name: 'Tarea 2',
  is_finished: false,
  wrong_counter: 0,
  course_id: course2.id
)

task3 = Task.create(
  user_id: teacher.id,
  task_type: 'numeric',
  status: 'in_progress',
  name: 'Tarea 3',
  is_finished: false,
  wrong_counter: 0,
  course_id: course2.id
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

# Para que los 3 estudiantes inicialmente tengan progreso 0 en los courses.
# Esto se hace también cada vez que se crea un nuevo user en su modelo.

[student1, student2, student3].each do |student|
  Course.all.each do |crs|
    UserCourse.create(user: student, course: crs, progress: 0)
  end
end
