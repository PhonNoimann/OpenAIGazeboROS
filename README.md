# OpenAIGazeboROS
###### Project work Mobile Robotics 2019/20

Il robot scelto è il turtlebot2, il quale è stato inserito all’interno di un ambiente di simulazione in Gazebo: maze. Attraverso l’implementazione del Q-Learning algorithm, impostandone opportunamente i parametri, si è cercato di fare in modo che il robot eviti gli ostacoli presenti. Abbiamo utilizzato la libreria OpenAI, in particolare il branch version2, che racchiude al suo interno alcuni modelli preimpostati di robot e di ambienti, come lo stesso turtlebot2. 
Abbiamo creato il pacchetto ROS my_turtlebot2_training all’interno del quale sono stati aggiunti gli script relativi alla simulazione (start_training.py) e l’algoritmo di RL (qlearn.py), oltre al launch file necessario ad inserire il robot all’interno del maze e far partire il training: start_training.launch.
Una volta inserito il robot in questione all’interno del maze, abbiamo effettuato varie simulazioni provando a cambiare sia i parametri del Q-Learn che i reward delle azioni compiute dal robot.
I parametri sui quali abbiamo agito sono stati: 
- **α, Learning rate**: che assume un valore compreso tra 0 e 1. Quando tale parametro è impostato a 0, il robot non apprende, invece per un alto valore di α, ad esempio 0.9, si favorisce la velocità di apprendimento;
- **γ, Discount factor**: quando tale fattore è pari a 0 si considereranno solo i reward correnti, viceversa con un fattore pari ad 1 si considereranno i reward per un lungo periodo di tempo.
- **ɛ, Exploration constant**: quando tale valore assume un valore pari a 0.9 si favorirà una decisione stocastica.

I parametri iniziali sono stati: α = 0.2, γ = 0.4 e ɛ= 0.9. Sono stati modificati, nel corso delle simulazioni, agendo sul file turtlebot2_maze.yaml come descritto nel file README.md all’interno della cartella simulation_data del repository.
Mediamente abbiamo utilizzato simulazioni di 500 episodi testandone anche uno di 1000. Abbiamo estrapolato i dati e li abbiamo plottati su Matlab, evidenziando anche le rette di regressione per poter capire se il robot stesse effettivamente imparando o no. Abbiamo notato solo pochi spike di reward molto elevati che nel corso della simulazione non sono più riapparsi, li abbiamo quindi considerati come outlier.
Le simulazioni eseguite hanno prodotto i seguenti risultati:
## α = 0.2 γ = 0.4 (500 episodes, rewards: +2 forward, +1 turn) 
<img src="https://github.com/PhonNoimann/OpenAIGazeboROS/blob/master/simulation_data/01.svg">
 
## α = 0.1 γ = 0.9 (500 episodes, rewards: +2 forward, +1 turn) 
<img src="https://github.com/PhonNoimann/OpenAIGazeboROS/blob/master/simulation_data/02.svg">
 
## α = 0.1 γ = 0.9 (500 episodes, rewards: +2 forward, +1 turn) 
<img src="https://github.com/PhonNoimann/OpenAIGazeboROS/blob/master/simulation_data/03.svg">
 
## α = 0.1 γ = 0.9 (200 episodes, rewards: +2 forward, +1 turn) 
<img src="https://github.com/PhonNoimann/OpenAIGazeboROS/blob/master/simulation_data/04.svg">
 
## α = 0.1 γ = 0.9 (1000 episodes, rewards: +100 every 70 steps, +0.1 for every 0.4 m from side walls, +0.2 for every 0.4 m from front wall) 
<img src="https://github.com/PhonNoimann/OpenAIGazeboROS/blob/master/simulation_data/05.svg">

## How to run
Per poter eseguire correttamente la simulazione, è necessario installare OpenAI ``` gym ```
```
pip install gym
```
Successivamente bisogna eseguire il clone della repository openai_ros fornita da The Construct Core (https://bitbucket.org/theconstructcore/openai_ros/src/version2/):
```
cd /home/user/catkin_ws/src
git clone https://bitbucket.org/theconstructcore/openai_ros.git
cd openai_ros;git checkout version2
cd /home/user/catkin_ws;catkin_make;source devel/setup.bash
```
Modificare il path di ros alla riga 3 nel file ```my_turtlebot2_maze_params.yaml``` 
Infine si deve eseguire il launch file:
```
roslaunch my_turtlebot2_training start_training.launch
```
