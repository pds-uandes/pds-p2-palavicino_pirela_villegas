# Limpia los datos existentes en el orden correcto
NumericTemplate.destroy_all
NumericQuestion.destroy_all
Task.destroy_all

# Crea una Task
task = Task.create!(
  user_id: 3, 
  task_type: 'numeric',
  status: 'in_progress',
  created_at: Time.now,
  updated_at: Time.now
)

# Crea una NumericQuestion asociada a la Task creada
numeric_question = NumericQuestion.create!(
  task: task,
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

NumericTemplate.create!(
  numeric_question: numeric_question,
  diagram_data: '', 
  values: '{"angle": [15, 30, 45, 60], "forceMagnitude": [3, 4, 5, 6]}', 
  magnitudes: '{"force": "N"}', 
  created_at: Time.now,
  updated_at: Time.now
)
