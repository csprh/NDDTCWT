function y = NDixWav2DMEX(w, J, Fsf, sf, Nondecimated)
%
% Author: Paul Hill   
% Date: 07/2013
% Partner: The University of Bristol
% 
% Function   : NDixWav2DMEX 
% 
% Purpose    :  This function inverts the transforms of 3
%               possible variants of the 2D Dual Tree Complex Wavelet
%               Transform (The original decimated version and two
%               Non-decimated versions).
% Parameters : 
%               w - wavelet coefficients
%               J - number of decomposition levels
%               Fsf{i}: tree i first level filters 
%               sf{i}:  tree i filters for remaining levels
%               Nondecimated: 0 (default) for original decimated version, 
%               1 for completley decimated version, 2 for decimation of 
%               just first level.
% Return:
%               y - 2D output array
% 
% Example of Usage: 
% See NDxWav2DMEX
