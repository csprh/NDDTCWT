function w = NDxWav2DMEX(x, J, Faf, afin, Nondecimated)

% Author: Paul Hill   
% Date: 07/2013
% Partner: The University of Bristol
% 
% Function   : NDxWav2DMEX 
% 
% Purpose    :  This function transforms the input 2D image using 3
%               possible variants of the 2D Dual Tree Complex Wavelet
%               Transform (The original decimated version and two
%               Non-decimated versions).
% Parameters : 
%               x - 2D input array (see below for size limits)
%               J - number of decomposition levels (see below for size
%               limits)
%               Faf{i}: tree i first stage filters 
%               af{i}:  tree i filters for remaining stages
%               Nondecimated: 0 (default) for original decimated version, 1 for
%               completley decimated version, 2 for decimation of just
%               first level.
% Return:
%               w{a}{b}{c}{d} - wavelet coefficients
%                   a = 1:J (scales)
%                   b = 1 (real part); b = 2 (imag part)
%                   c = 1,2; d = 1,2,3 (orientations)
%               w{J+1}{a}{b} - lowpass coefficients
%                   a = 1,2; b = 1,2 
% 
%
% Example of Usage: 
%
%   Original Decimated Version
%   x = rand(256,256);
%   J = 5;
%   [Faf, Fsf] = AntonB;
%   [af, sf] = dualfilt1;
%   w = NDxWav2DMEX(x, J, Faf, af,0);
%   y = NDixWav2DMEX(w, J, Fsf, sf,0);
%   err = x - y;
%   max(max(abs(err)))
% 
%   Decimated Version 1 (no decimation)
%   x = rand(256,256);
%   J = 5;
%   [Faf, Fsf] = NDAntonB2; %(Must use ND filters for both)
%   [af, sf] = NDdualfilt1;
%   w = NDxWav2DMEX(x, J, Faf, af, 1);
%   y = NDixWav2DMEX(w, J, Fsf, sf, 1);
%   err = x - y;
%   max(max(abs(err)))
% 
%   Decimated Version 2 (decimation on only first level)
%   x = rand(256,256);
%   J = 5;
%   [Faf, Fsf] = AntonB; 
%   [af, sf] = NDdualfilt1; %(Must use ND filters for just these)
%   w = NDxWav2DMEX(x, J, Faf, af, 2);
%   y = NDixWav2DMEX(w, J, Fsf, sf, 2);
%   err = x - y;
%   max(max(abs(err)))
%
% SIZE LIMITS
% (s/J^2) must be bigger than 5 (where s is both height and width)
% Height and width must be divisible by 2^J for fully decimated version
% Height and width must be divisible by 2 for nondecimated version 2
