clear all;

y=dlmread('amp_obs_iso_new.txt');



cutoff = 0.99;
stationarity_test = '';
denoising_algorithm = 'schreiber'; %default schreiber, options include ma, wavelet
gaussian_transform = 0;
surrogate_algorithm = 'aaft_cpp'; %default aaft_cpp, options includes IAAFT2, FT, CSS, AAFT, CPP
downsampling_method = 'downsample';%deault downsample, other option: fouda
sigma = 0.5 ; 

output = chaos(y(:),cutoff,stationarity_test,denoising_algorithm,...
    gaussian_transform,surrogate_algorithm,downsampling_method,sigma)
