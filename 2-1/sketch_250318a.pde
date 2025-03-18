size(500, 300);
smooth();
background(230,230,230);

float centX = width/2;
float centY = height/2;

stroke(130,0,0);
strokeWeight(4);

fill(255, 150);
ellipse(width/2, height/2, 50, 50);

line(centX-70, centY-70,centX+70,centY+70);
line(centX+70, centY-70,centX-70,centY+70);
