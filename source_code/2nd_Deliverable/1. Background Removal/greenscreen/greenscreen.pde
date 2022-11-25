
import processing.video.*;


Capture video;


PImage backgroundImage;

PImage backgroundReplace;


float threshold = 50;

void setup() {
  size(300, 300);
  video = new Capture(this, width, height, 30);
  video.start();


  backgroundImage = createImage(video.width, video.height, RGB);
  backgroundReplace = loadImage("22.jpg");
}


void captureEvent(Capture video) {
  video.read();
}


void draw() {
  
  threshold = map(mouseX, 0, width, 5, 50);

  loadPixels();
  video.loadPixels(); 
  backgroundImage.loadPixels();

  for (int x = 0; x < video.width; x ++ ) {
    for (int y = 0; y < video.height; y ++ ) {
      int loc = x + y*video.width; 
      color fgColor = video.pixels[loc]; 

    
      color bgColor = backgroundImage.pixels[loc];

      // Step 4, compare the foreground and background color
      float r1 = red(fgColor);
      float g1 = green(fgColor);
      float b1 = blue(fgColor);
      float r2 = red(bgColor);
      float g2 = green(bgColor);
      float b2 = blue(bgColor);
      float diff = dist(r1, g1, b1, r2, g2, b2);

   
      if (diff > threshold) {
      
        pixels[loc] = fgColor;
      } else {
     
        pixels[loc] = backgroundReplace.pixels[loc];
      }
    }
  }
  updatePixels();
}

void mousePressed() {
  

  backgroundImage.copy(video, 0, 0, video.width, video.height, 0, 0, video.width, video.height);
  backgroundImage.updatePixels();
}
