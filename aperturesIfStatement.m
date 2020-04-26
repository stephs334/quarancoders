function Diffraction(shape)
% Add if statements to final apertures
% [HELP FILE]

%[DEFINE CONSTANTS]
eh=0;
apl=5000;

if strcmp(shape,'Square')==1
% Define square aperture
ap=zeros(apl); % define the aperture plane
sql=500; % size of the square
ap(round(1+apl/2-sql/2):round(1+apl/2+sql/2),round(1+apl/2-sql/2):round(1+apl/2+sql/2))=1;
eh=1;
    
elseif strcmp(shape,'SingleSlit')==1
% Define single slit
ap=zeros(apl); 
height=2500;
width=200;
ap(round(1+apl/2-height/2):round(1+apl/2+height/2),round(1+apl/2-width/2):round(1+apl/2+width/2))=1;
eh=2;

elseif strcmp(shape,'DoubleSlit')==1
% Define double slit
ap=zeros(apl);
height=2500;
width2=175;
spacing=500;
ap(round(1+apl/2-height/2):round(1+apl/2+height/2),round(1+apl/2-(width2+spacing/2)):round(1+apl/2-spacing/2))=1;
ap(round(1+apl/2-height/2):round(1+apl/2+height/2),round(1+apl/2+spacing/2):round(1+apl/2+spacing/2+width2))=1;
eh=3;

elseif strcmp(shape,'Circle')==1
% Define circular aperture
ap=zeros(apl);
R=275;
I=1:apl;
x=I-apl/2;
y=apl/2-I;
[X,Y]=meshgrid(x,y);
circle=(X.^2+Y.^2<=R^2);
ap(circle)=1;
eh=4;

elseif strcmp(shape,'Triangle')==1
% Define triangular aperture 
ap=zeros(apl);
side=1500;
for n=0:1500
    s=1500-n;
    ap(round(1+apl/2+side/2-s):round(1+apl/2+side/2),round(1+apl/2-side/2):round(1+apl/2-side/2+n))=1;
end
eh=5;

else
  disp("Error occurs. Please see help file for further instrunctions.") 
  return
  
end

% plot aperture
figure(1) % open figure window
imagesc(ap) % plot image of the aperture field
colormap gray % set colors to black/white/gray
axis equal % set the display scale of the axes
axis([0 apl 0 apl]) % set axes limits to size of aperture field

if eh==1
       
elseif eh==2
    
elseif eh==3

elseif eh==4
    
elseif eh==5
    
end 
