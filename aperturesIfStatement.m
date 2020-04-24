function Diffraction(shape,)
% Add if statements to final apertures
% [HELP FILE]

%[DEFINE CONSTANTS]
eh=0;

apl=5000;
if strcmp(shape,'Rectangle')==1
% Define square aperture
ap1=zeros(apl); % define the aperature plane
sql=500; % size of the square
ap1(round(1+apl/2-sql/2):round(1+apl/2+sql/2),round(1+apl/2-sql/2):round(1+apl/2+sql/2))=1;
% Plot the square aperature
figure(1)
imagesc(ap1) %plot image of the aperature field
colormap gray
axis equal % set the display scale of the axes
axis([0 apl 0 apl]) % Set axes limits to size of aperature field
eh=1;
    
elseif strcmp(shape,'SingleSlit')==1
% Define single slit
ap2=zeros(apl); 
height=2500;
width=200;
ap2(round(1+apl/2-height/2):round(1+apl/2+height/2),round(1+apl/2-width/2):round(1+apl/2+width/2))=1;
%plot the single slit
figure(2)
imagesc(ap2) % plot the single slit
colormap gray
axis equal
axis([0 apl 0 apl])
eh=2;

elseif strcmp(shape,'DoubleSlit')==1
% Define double slit
ap3=zeros(apl);
height=2500;
width2=175;
spacing=500;
ap3(round(1+apl/2-height/2):round(1+apl/2+height/2),round(1+apl/2-(width2+spacing/2)):round(1+apl/2-spacing/2))=1;
ap3(round(1+apl/2-height/2):round(1+apl/2+height/2),round(1+apl/2+spacing/2):round(1+apl/2+spacing/2+width2))=1;
%plot the double slit
figure(3)
imagesc(ap3) % plot the double slit
colormap gray
axis equal
axis([0 apl 0 apl])
eh=3;

elseif strcmp(shape,'Circle')==1
% Define cicular aperture
ap4=zeros(apl);
R=275;
I=1:apl;
x=I-apl/2;
y=apl/2-I;
[X,Y]=meshgrid(x,y);
circle=(X.^2+Y.^2<=R^2);
ap4(circle)=1;
%plot the circular aperture
figure(4)
imagesc(ap4) % plot the circular aperature
colormap gray
axis equal
axis([0 apl 0 apl])
eh=4;

elseif strcmp(shape,'Triangle')==1
% Define triangular aperture 
ap5=zeros(apl);
side=1500;
for n=0:1500
    s=1500-n;
    ap5(round(1+apl/2+side/2-s):round(1+apl/2+side/2),round(1+apl/2-side/2):round(1+apl/2-side/2+n))=1;
end
figure(5)
imagesc(ap5)
colormap gray
axis equal
axis([0 apl 0 apl])
eh=5;

else
  disp("Error occurs. Please see help file for further instrunctions.") 
  return
  
end



if eh==1
       
elseif eh==2
    
elseif eh==3

elseif eh==4
    
elseif eh==5
    
end 