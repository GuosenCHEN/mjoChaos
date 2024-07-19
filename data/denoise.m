clear all;

y=dlmread('nino34.txt');

y=noiserSchreiber(y);
y=y(11:end-10);

%y=smooth(y);

fileID1 = fopen('nino34_denoised.txt','w');

fprintf(fileID1,'%1.8f\n',y);