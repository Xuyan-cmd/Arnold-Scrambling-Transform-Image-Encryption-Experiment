


%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%arnold加解密过程仿真程序%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% 
clear all;close all;clc;
I=imread('lena256.png');
I=imresize(I,[256,256]);

%要置乱的次数
num=50;


figure(1);
subplot(1,4,1);imshow(I,[]);title('原图');
subplot(1,4,2);imshow(I(:,:,1),[]);title('R');
subplot(1,4,3);imshow(I(:,:,2),[]);title('G');
subplot(1,4,4);imshow(I(:,:,3),[]);title('B');

I1(:,:,1)=uint8(arnold(I(:,:,1),num));%%%%%%%%%%%原调用函数
I1(:,:,2)=uint8(arnold(I(:,:,2),num));
I1(:,:,3)=uint8(arnold(I(:,:,3),num));

figure(2);
subplot(1,4,1);imshow(I1,[]);title(['原图' num2str(num)  '次置乱']);
subplot(1,4,2);imshow(I1(:,:,1),[]);title(['R分量图' num2str(num)  '次置乱']);
subplot(1,4,3);imshow(I1(:,:,2),[]);title(['G分量图' num2str(num)  '次置乱']);
subplot(1,4,4);imshow(I1(:,:,3),[]);title(['B分量图' num2str(num)  '次置乱']);


C(:,:,1)=I1(:,:,1);
C(:,:,2)=I1(:,:,2);
C(:,:,3)=I1(:,:,3);


imwrite(C,'加密图.bmp');

figure(5);
% subplot(3,4,5);imhist(C);title('彩图扩散直方图');
subplot(2,3,1);imhist(C(:,:,1));title([num2str(num) '次置乱后R分量直方图']);
subplot(2,3,2);imhist(C(:,:,2));title([num2str(num) '次置乱后G分量直方图']);
subplot(2,3,3);imhist(C(:,:,3));title([num2str(num) '次置乱后B分量直方图']);
% subplot(3,4,9);imhist(I1);title('原彩图扩散直方图');
subplot(2,3,4);imhist(I(:,:,1));title('原图R分量直方图');
subplot(2,3,5);imhist(I(:,:,2));title('原图G分量直方图');
subplot(2,3,6);imhist(I(:,:,3));title('原图B分量直方图');
figure(6);
subplot(1,2,2);
histogram(C(:,:,1),512,'Facecolor','r','FaceAlpha',1,'Edgecolor','none');title([num2str(num) '次置乱后RGB分量直方图']);
hold on
histogram(C(:,:,2),512,'Facecolor','g','FaceAlpha',1,'Edgecolor','none');
hold on
histogram(C(:,:,3),512,'Facecolor','b','FaceAlpha',1,'Edgecolor','none');
box off;
subplot(1,2,1);
histogram(I(:,:,1),512,'Facecolor','r','FaceAlpha',1,'Edgecolor','none');title('原图RGB分量直方图');
hold on
histogram(I(:,:,2),512,'Facecolor','g','FaceAlpha',1,'Edgecolor','none');
hold on
histogram(I(:,:,3),512,'Facecolor','b','FaceAlpha',1,'Edgecolor','none');
box off;


I2(:,:,1)=uint8(iarnold(C(:,:,1),num));
I2(:,:,2)=uint8(iarnold(C(:,:,2),num));
I2(:,:,3)=uint8(iarnold(C(:,:,3),num));
imwrite(I2,'解密图.bmp');
figure(4);
subplot(1,4,1);imshow(I2,[]);title(['解密' num2str(num)  '次图像']);
subplot(1,4,2);imshow(I2(:,:,1),[]);title(['解密' num2str(num)  '次R分量图像']);
subplot(1,4,3);imshow(I2(:,:,2),[]);title(['解密' num2str(num)  '次G分量图像']);
subplot(1,4,4);imshow(I2(:,:,3),[]);title(['解密' num2str(num)  '次B分量图像']);










