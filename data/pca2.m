clear all;

y = dlmread('amp_obs_iso_new_denoise.txt');


%%}


m = 35;
tau = 1;
%{
N = length(y)-tau*(m-1);
shift_mat_ind = reshape(0:tau:(m-1)*tau,[],1) * ones(1,N) + ones(m, 1) * reshape(1:N,1,[]);
A1 = y(shift_mat_ind);

A = transpose(A1);
%}

%y_norm=normalize(y);

A = phaseSpaceReconstruction(y,tau,m);

%fileID1 = fopen('amp_delay_rec.txt','w');
%fprintf(fileID1,'%1.8f\n',A);

%A_norm=normalize(A);


[coeff,score,latent] = pca(A);


explained=latent/sum(latent)*100;
plot(explained)

sum(explained(1:5))
%{
subplot(3,2,1),plot(coeff(:,1));
subplot(3,2,2),plot(coeff(:,2));
subplot(3,2,3),plot(coeff(:,3));
subplot(3,2,4),plot(coeff(:,4));
subplot(3,2,5),plot(coeff(:,5));
subplot(3,2,6),plot(coeff(:,6));
%}

U = A*coeff;

fileID1 = fopen('amp_psr_pca_denoise_m35_new.txt','w');
fprintf(fileID1,'%1.8f\n',U);

%A1=U(:,1:4)*coeff(:,1:4)';

%U = A;

%Ut = U;

%Ut(2:N-1,:)=(U(3:N,:)-U(1:N-2,:))/2.0;
%Ut(1,:)=(U(2,:)-U(1,:))/1.0;
%Ut(N,:)=(U(N,:)-U(N-1,:))/1.0;
%plot(A1(1:3000,3),A1(1:3000,4),'-','LineWidth',0.5,'color','cyan')
%plot3(A(1:2000,1),A(1:2000,3),A(1:2000,2),'o-','LineWidth',1.2)
%plot3(U(1:3000,1),U(1:3000,2),U(1:3000,3),'-','LineWidth',0.2,'Color',[200,200,200]/255)
%plot3(A1(1:10000,1),A1(1:10000,2),A1(1:10000,3),'-','LineWidth',0.5,'Color','cyan')

%{
subplot(3,2,1),plot(U(1000:3000,1),U(1000:3000,2),'-','LineWidth',0.2,'Color',[200,200,200]/255);
subplot(3,2,2),plot(U(1000:3000,1),U(1000:3000,3),'-','LineWidth',0.2,'Color',[200,200,200]/255)
subplot(3,2,3),plot(U(1000:3000,2),U(1000:3000,3),'-','LineWidth',0.2,'Color',[200,200,200]/255)

subplot(3,2,4),plot(U(1000:3000,1),U(1000:3000,4),'-','LineWidth',0.2,'Color',[200,200,200]/255);
subplot(3,2,5),plot(U(1000:3000,2),U(1000:3000,4),'-','LineWidth',0.2,'Color',[200,200,200]/255)
subplot(3,2,6),plot(U(1000:3000,3),U(1000:3000,4),'-','LineWidth',0.2,'Color',[200,200,200]/255)
%}

%[u,v] = meshgrid(Ut(1:4:N/10,1),Ut(1:4:N/10,2));

%quiver(u,v)

%phaseSpaceReconstruction(A1(1:2000,1),4,4)