// Example 16-4: Display QuickTime movie

import processing.video.*;

// Step 1. Declare Movie object
Movie movie; 

void setup() {
  size(1920, 1080);

  // Step 2. Initialize Movie object
  // Movie file should be in data folder
  movie = new Movie(this, "180626_12_Seocho-Dong_23.mov"); 

  // Step 3. Start movie playing
  movie.loop();
}

// Step 4. Read new frames from movie
void movieEvent(Movie movie) {
  movie.read();
}

void draw() {
  // Step 5. Display movie.
  image(movie, 0, 0);
}
