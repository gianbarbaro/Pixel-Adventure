Juego de plataformas 2D con Godot y GDScript. Consta de 10 niveles con diversos enemigos y obstáculos a los que hay que esquivar para así recolectar todas las frutas y pasar de nivel.

El desarrollo consistió en:
* Creación de niveles con tilemaps
* Comportamiento del personaje:
  1) movimiento de derecha a izquierda
  2) salto, salto regulado, doble salto y caída
  3) recolección de objetos
  4) muerte al colisionar con enemigos y obstáculos (una sola vida)
* Animaciones del personaje (idle, run, jump, fall, dead), de enemigos y objetos.
* Creación de enemigos u ojetos que dañan al colisionar con el personaje (estáticos o con el nodo AnimationPlayer para crear una patrón de movimiento).
* Creación de enemigos con movimiento propio y area de detección para perseguir al personaje. Detección de muros y precipicios para el cambio de dirección.
* Cambio de escenas entre niveles.
* Spawn de aparición y checkpoints.
* Creación de plataformas traspasables y móviles.
* Optimización de escenas. Uso del singleton y autoload.
* Programar la selección de skins del personaje.
* Selector de niveles.
* Música para niveles y efectos de sonido (salto y recolección).

Assets por Pixel Frog
https://pixelfrog-assets.itch.io/pixel-adventure-1
https://pixelfrog-assets.itch.io/pixel-adventure-2
