clc
close all;
filepath1='C:\Users\ppxdpp\Desktop\ip\pic1.tif';
str=(strrep(filepath1,'1.tif',''));
fileID=fopen(filepath1);
formatSpec='%f';
%going to the number part of the label
x=regexp(filepath1, '.*?(\d+(\.\d+)*)', 'tokens' );

cellfun( @(x) disp(x{1}), x )
% the last two lines give me the serial number of the image. This will
% serve as start point for loading multiple images now.
i=str2double(x{1});
flag=0;
img=[];count=0; % let it be 0 if u want to end till theres no matching image in the folder
while i<=6
    ch=input('load more images: 1. yes 2. no  ');
    if ch==1
        
        st=num2str(i);
        filepath=strcat(str,st,'.tif')
        im=imread(filepath);
        [img]=[img,im];
%         i=i+1;
    end
    
    if ch==2
        break;
    end
    i=i+1;
    count=count+1;
end

disp ('finish');
% once all the images are loaded it the matrix img stores all the
% information of each pixels is stored in teh array img. Now need to divide
% the array into smaller arrays.
s=size(img,2);
nmatrix=s/size(img,1);
% now say suppose I have to find median of each of this image.
j=1;med=[];en=1024;st=1;
while j<=nmatrix

    
    m=median(median(img(:,st:en)));
    [med]=[med,m];
    en=1024+en
    st=1024+st
    j=j+1;
end
plot(1:nmatrix,med(),'*-r');
xlabel('image number');
ylabel('median value');
title('Median of multiple images');
legend('Median');

