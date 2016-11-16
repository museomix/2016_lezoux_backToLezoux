BACK TO LEZOUX (Equipe n°2)

Emplacement : La grosse boîte au premier étage, de l'autre côté du four par rapport à la pleinière.

Overview : Le côté informatique est divisé en 2 partie, une partie réalité augmentée, codée avec Unity 5.4.2f2, et une partie Process, à ouvrir avec l'IDE Process. La grosse boîte permet de simuler l'environnement du potier, le côté Process déclenche des sons (voix du potier) lorsque les objets sur la table sont soulevés, ou lorsque le gros bouton (sous lequel se cache un clavier) et appuyé à l'entrée.

Matériel informatique : Clavier Bluetooth (emprunté au TechShop, caché dans un boîtier en carton décoré, à l'entrée de la boîte), Arduino avec câblage (matériel du TechShop, placé sous la table, au fond à gauche de la boîte), tablette Shield (appartenant à Capgemini, mis en évidence sur le meuble en carton à droite (ou en charge !))

Mise en place : raccorder un ordinateur au système Arduino par USB, brancher le dongle Wifi du clavier au PC, lancer l'application process sur PC et lancer l'application en RA sur la tablette.

Déroulement : Les utilisateurs rentrent dans la boîte côté antichambre. Ils appuyent sur le gros bouton du clavier, une bande son se lance pour évoquer une machine qui voyage dans le temps. Une fois le son finit, une clochette sonne et les utilisateurs doivent entrer dans l'autre pièce. Le potier leur adresse alors la parole pour leur signifier qu'ils peuvent plus ou moins toucher à tout dans la pièce. Ils ont en fait deux interactions différentes prévues avec la pièce : interagir avec les objets sur la table, qui, lorsqu'ils sont soulevés, déclenchent la voix du potier, ou utiliser la tablette pour scanner l'image qui sert de marqueur pour la réalité augmentée, et découvrir la version numérique de l'atelier.

Ce qui ne fonctionne pas bien :
	- Pour le clavier en Wifi, le bouton n'est pas super bien placé, de temps en temps, en l'appuyant, il fait un Alt + TAB, ce qui quitte la fenêtre de l'application
	- Le son de l'introduction (machine à voyager dans le temps) ne se lance qu'une fois, il faut redémarrer le programme à chaque visite (j'ai dû rater quelque chose dans le code vu que je ne connaissais pas la librairie que j'ai utilisé, ni process à dire vrai)
	- Côté Arduino, on avait des faux positifs et des faux négatifs, mais même sans ça, à priori, le son se lancerait en boucle car je n'ai pas mis de conditions pour attendre que l'objet soit reposé avant de relancer le son (vu que j'ai été bloqué côté hardwware avant d'en arriver là !)
	- Pour ce qui est de la RA, tout va bien, mais je ne pense pas que les utilisateurs sauront quoi viser (la photo sur le meuble de droite)
