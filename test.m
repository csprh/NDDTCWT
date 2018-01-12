  %Decimated Version 0 (full decimation)  
  x = rand(256,256);
  J = 5;
  [Faf, Fsf] = AntonB;
  [af, sf] = dualfilt1;
  w = NDxWav2DMEX(x, J, Faf, af,0);
  y = NDixWav2DMEX(w, J, Fsf, sf,0);
  err = x - y;
  max(max(abs(err)))

  %Decimated Version 1 (no decimation)
  x = rand(256,256);
  J = 5;
  [Faf, Fsf] = NDAntonB2; %(Must use ND filters for both)
  [af, sf] = NDdualfilt1;
  w = NDxWav2DMEX(x, J, Faf, af, 1);
  y = NDixWav2DMEX(w, J, Fsf, sf, 1);
  err = x - y;
  max(max(abs(err)))

  %Decimated Version 2 (decimation on only first level)
  x = rand(256,256);
  J = 5;
  [Faf, Fsf] = AntonB; 
  [af, sf] = NDdualfilt1; %(Must use ND filters for just these)
  w = NDxWav2DMEX(x, J, Faf, af, 2);
  y = NDixWav2DMEX(w, J, Fsf, sf, 2);
  err = x - y;
  max(max(abs(err)))