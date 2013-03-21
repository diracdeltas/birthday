//
// candle.pde
// 
// simple Processing script that lets anyone blow out a candle
// (given sufficient air pressure differential)
//
// Author: Yan Zhu
// License: GPL v3

import com.jsyn.io.*;
import com.jsyn.data.*;
import com.jsyn.util.*;
import com.jsyn.instruments.*;
import com.jsyn.*;
import com.jsyn.exceptions.*;
import com.jsyn.apps.*;
import com.jsyn.devices.*;
import com.jsyn.ports.*;
import com.jsyn.score.*;
import com.jsyn.midi.*;
import com.jsyn.scope.swing.*;
import com.jsyn.engine.*;
import com.jsyn.swing.*;
import com.jsyn.devices.javasound.*;
import com.jsyn.scope.*;
import com.jsyn.util.soundfile.*;
import com.jsyn.unitgen.*;
import com.jsyn.devices.jportaudio.*;

import pitaru.sonia_v2_9.*;

PImage[] images = new PImage[16];

void setup(){
   for ( int i = 1; i< images.length + 1; i++ )
    {
      images[i-1] = loadImage( "/images/candle" + i + ".gif" );  
    };

   size(400,534);
   frameRate(5);
   Sonia.start(this); // Start Sonia engine.
   LiveInput.start(256); // Start LiveInput and return 256 FFT frequency bands.
}

void draw(){
  getSpectrum(); // Show FFT reading
   
}

void getSpectrum(){
   strokeWeight(1);
   stroke(0,230,0);
  // populate the spectrum array with FFT values.
   LiveInput.getSpectrum();
   image(images[constrain(floor((LiveInput.spectrum[0])/50),0,14)],0,0);
   
}

public void stop(){
    Sonia.stop();
    super.stop();
}
