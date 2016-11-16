import cc.arduino.*;
import org.firmata.*;

/*
 * Pour que ce sketch fonctionne,
 * il faut téléverser FirmataStandardPlus
 * depuis les exemples Arduino de la librairie Firmata.
 * Donc :
 
 * 1. 
 Télécharger la librairie Firmata pour Arduino
 depuis l'IDE Arduino
 
 * 2. 
 Brancher une carte Arduino 
 et téléverser l'exemple FirmataStandardPlus
 de la librairie Firmata
 
 * 3. 
 Revenir ici sur ce sketch 
 et sélectionner le bon index 
 de la liste des périphériques Arduino
 dans le setup();
 (voir la console au lancement du sketch)
 */

/*
 * Import des librairies
 */

import processing.serial.*;
import cc.arduino.*;
Arduino arduino;

import ddf.minim.*;

Minim minim;

AudioPlayer ambiantPlayer;
AudioPlayer intro;

AudioSample pot;
AudioSample tools;
AudioSample toy;

boolean ambiantPlaying = false;

/* 
 * Initialisation des variables
 */

/*
 * Pour chaque valeur de capteur récupérée,
 * vous avez 5 variables :
 
 sensor_Pin        => Pin Arduino sur lequel sont envoyés les données du capteur
 sensor_Value      => Valeur brute récupérée depuis Arduino
 sensor_FromMin    => Valeur minimale observée
 sensor_FromMax    => Valeur maximale observée
 sensor_ToMin      => Valeur minimale souhaitée
 sensor_ToMax      => Valeur maximale souhaitée
 
 * Ainsi, vous pouvez mapper vos valeurs.
 Si votre capteur vous envoie des valeurs de 150 à 600
 et que vous voulez étalonner ces valeurs de 0   à 100,
 alors vous utilisez ceci :
 
 int valeur = int(map(sensor_Value, 150, 600, 0, 100));
 
 donc en mode variables, cela donne :
 
 int valeur = int(map(sensor_Value, sensor_FromMin, sensor_FromMax, sensor_ToMin, sensor_ToMax));
 */



int toySensor_Pin = 4;
int toySensor_Value = 0;
int toySensor_FromMin = 400; 
int toySensor_FromMax = 600;
int toySensor_ToMin = 0;
int toySensor_ToMax = 100;
int toySensor_UsefulValue = 0;

int toolSensor_Pin = 3;
int toolSensor_Value = 0;
int toolSensor_FromMin = 400;
int toolSensor_FromMax = 600; 
int toolSensor_ToMin = 0;
int toolSensor_ToMax = 100;
int toolSensor_UsefulValue = 0;

int potSensor_Pin = 2;
int potSensor_Value = 0;
int potSensor_FromMin = 400;
int potSensor_FromMax = 600;
int potSensor_ToMin = 0;
int potSensor_ToMax = 100;
int potSensor_UsefulValue = 0;

//SoundFile son1;

void setup() {
  size(800, 600);
  /*arduino = new Arduino(this, Arduino.list()[0], 57600);

  arduino.pinMode(toySensor_Pin, Arduino.INPUT);
  arduino.pinMode(toolSensor_Pin, Arduino.INPUT);
  arduino.pinMode(potSensor_Pin, Arduino.INPUT);*/

  minim = new Minim(this);
  ambiantPlayer = minim.loadFile("Ambiant.aiff");
  intro = minim.loadFile("Intro.aiff");
  
  pot = minim.loadSample("Vase.aiff");
  tools = minim.loadSample("mes outils.aiff");
  toy = minim.loadSample  ("jouet de mon fils.aiff");
}

void draw() {
  background(#fdf202);

  if(!intro.isPlaying())
  {
    if(ambiantPlaying == false)
    {
      ambiantPlaying = true;
      ambiantPlayer.loop();
    }
  }
  else
  {
    if(ambiantPlaying != false)
    {
      ambiantPlaying = false;
      ambiantPlayer.pause();
      ambiantPlayer.rewind();
    }
  }
/*
  toySensor_Value = arduino.analogRead(toySensor_Pin);

  toolSensor_Value = arduino.analogRead(toolSensor_Pin);
    
  potSensor_Value = arduino.analogRead(potSensor_Pin);

  if(toySensor_Value == 0)
    toy.trigger();
  if(toolSensor_Pin == 0)
    tools.trigger();
  if(potSensor_Pin == 0)
    pot.trigger();*/
}

void keyPressed()
{
  if(key == 'k')
  {
    pot.trigger();
  }
  else if(key == 'l')
  {
    tools.trigger();
  }
  else if(key == 'm')
  {
    toy.trigger();
  }
  else
  {
    intro.play();
  }
}