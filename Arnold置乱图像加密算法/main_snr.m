


%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%arnold性能分析程序%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% 
clear all;close all;clc;
I=imread('lena256.png');
I=imresize(I,[256,256]);
B=rgb2gray(I);
%要置乱的次数
i=1;
for num=5:5:50;


A=(arnold(B,num));%%%%%%%%%%%原调用函数
% I1(:,:,2)=uint8(arnold(I(:,:,2),num));
% I1(:,:,3)=uint8(arnold(I(:,:,3),num));
snr(i)=20*log10(ms_snr(A,double(B)));
cor(i)=corr2(A,double(B));
i=i+1
end
num=5:5:50;
figure
plot(num,snr);
xlabel('置乱次数');
ylabel('均方信噪比/dB');
title('均方信噪比曲线');

figure
plot(num,cor);
xlabel('置乱次数');
ylabel('相关系数值');
title('相关系数曲线');







