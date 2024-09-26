# Staticfy

## URL app: http://164.90.150.31/users/sign_in

## Credenciales:
Student
email: ppvillegas@miuandes.cl
password: 123456

Teacher
email: profecrocker@miuandes.cl
password: 123456


## Funcionamiento
El dominio escogido fue Estática de Sólidos Rígidos dividido en 5 módulos: 
1. Diagrama de Cuerpo Libre
2. Vínculos Externos e Internos
3. Condiciones de Equilibrio y Estabilidad
4. Tipos de Fuerzas Más Comunes
5. Rozamiento y Poleas

En la aplicación los módulos de Diagrama de Cuerpo Libre y Vínculos Externos e Internos son independientes entre ellos. Por otro lado, los otros son dependientes en ese orden. Para desbloquear el módulo de Condiciones de Equilibrio y Estabilidad es necesario obtener al menos un 80% de progreso tanto en el módulo 1 como en el 2. Asimismo, se necesita de un 80% de progreso como mínimo en el módulo 3 para desbloquear los Tipos de Fuerzas Más Comunes y finalmente también se necesita un 80% en el módulo 4 para poder realizar el de Rozamiento y Poleas.

## Alumno

Una vez que el alumno ingresa a la página, entra directamente a la vista de los cursos que puede realizar. En esta puede ver los cursos desbloqueados y bloqueados, además de poder empezar a realizar tareas de los cursos desbloqueados. También, puede revisar su progreso de cada módulo y el global. En esta vista de progreso, el usuario puede llevar el análisis de sus datos, ver el tiempo que ha usado la aplicación desde que creó la cuenta, la última vez que ingresó, su puntaje de cada módulo y si lo aprobó o no, el progreso global que equivale a la suma de todos los puntajes de cada módulo y su velocidad de aprendizaje, la cual se calcula como una relación de las preguntas correctas que ha tenido el alumno dividido por los segundos que ha usado la aplicación. Además, puede ver la última pregunta que respondió y si la respondió correcta o incorrectamente.

Cada módulo se evalúa con un máximo de 10 puntos, y lograr 8 de 10 puntos como mínimo equivale a haber aprobado el módulo. El alumno parte desde 0 puntos y puede llegar hasta un máximo de 10 puntos. Se deben realizar las tareas disponibles en los módulos desbloqueados y en función de la correctitud de cada una de las preguntas respondidas se suma o resta puntaje del progreso. Las tareas tienen distinto nivel de dificultad; bajo, medio y alto. Las Tareas de dificultad baja están hechas por preguntas de nivel bajo, preguntas de alternativas de responder alternativa correcta, las de dificutad media tienen preguntas de alternativas de completar la oración, y las de dificultad alta son las tareas de cálculo numérico. Las preguntas de baja dificultad suman 1 punto al progreso si se responden correctamente y, por el contrario, restan 1 punto si es incorrecta. De la misma forma sucede con las preguntas de dificultad media, pero estas suman y restan 2 puntos; y con las preguntas de dificultad alta, que estas suman y restan 3 puntos. Esto siempre sin disminuir menos de cero ni de sumar más de 10 puntos en total.

En función del progreso del alumno se elige la próxima tarea a desarrollar por el alumno. Si el puntaje es entre 0 a 2 se pueden responder solo tareas fáciles, si está entre 3 a 6 se pueden responder tareas de nivel medio y mayor a ese puntaje se pueden responder las tareas difíciles. Finalmente, el alumno va respondiendo las tareas y a medida que las responde va desbloqueando los otros módulos.


## Profesor

En cuanto a un profesor, este puede ver hacer todas las acciones de un alumno con otras adicionales. 

En primer lugar, el profesor realizar las operaciones CRUD con las preguntas de alternativas. Además, también se pueden realizar las operaciones CRUD para crear tareas. Finalmente, el profesor puede ver las preguntas y cursos detacados, los que incluyen la pregunta con más respuestas incorrectas, la pregunta con más respuestas correctas, el curso con mejor rendimiento y el curso con peor rendimiento. Asimismo, puede ver el avance de cada uno de los estudiantes de forma global, viendo el avance por módulo, el avance global y el tiempo de uso. También, puede ver el progreso en una vista individual de cada alumno.
