function Diffraction(shape) % create function 'Diffraction' with input 'shape'

% Christopher Bruinsma, Chang Liu, and Steph Smith
% Optics 211
% 29 April 2020
% Final Project
% Select an aperture to create and plot the diffraction patterns and cross
% sections; input 'Rectangle','SingleSlit','DoubleSlit','Circle','Triangle'.
% To run the programme, input Diffraction('SELECTED SHAPE') in the command window

% Define constant
apl=5000; % length of aperture field

if strcmp(shape,'Rectangle')==1 % if selected shape is rectangle
    % Define rectangular aperture
    ap1=zeros(apl); % define the aperture plane
    sql=500; % size of the rectangle
    ap1(round(1+apl/2-sql/2):round(1+apl/2+sql/2),round(1+apl/2-sql/2):round(1+apl/2+sql/2))=1; % define aperture
   
    % Plot the rectangular aperture
    figure(1) % open figure window
    imagesc(ap1) % plot image of the aperture field
    title('Rectangular Aperture') % title figure
    colormap gray % use a gray color scale
    axis equal % set the display scale of the axes
    xlabel('Pixels') % label x axis
    ylabel('Pixels') % label y axis
    axis([0 apl 0 apl]) % set axis limits to size of aperture field
    
    % Plot far diffraction
    figure(2) % open another figure window
    z=fft2(ap1); % take forward fourier transform in 2d 
    z=fftshift(z); % shift fft to bring high intensity to center
    z=real(z); % take the real portion of the fft2
    I=z.^2; % intensity is the real portion squared
    l=I.^(0.05); % raise I to a power <<1 to scale it
    imagesc(l) % create an imagesc
    title('Diffraction Pattern through a Rectangular Aperture') % title figure
    colormap gray % use a gray color scale
    colorbar % display colorbar
    xlim([0,5000]) % scale x axis
    ylim([0,5000]) % scale y axis
    xlabel('Pixels') % label x axis
    ylabel('Pixels') % label y axis
    caxis([1,5]) % scale color gradient
    
    figure(3) % open zoomed figure window
    imagesc(l) % create an imagesc
    colormap gray % use a gray color scale
    axis equal % set the display scale of the axes
    axis([apl/2-250/2 apl/2+250/2 apl/2-250/2 apl/2+250/2]) % scale axes to center 250 pixels
    xlabel('Pixel') % label x axis
    ylabel('Pixel') % label y axis
    title('Close-Up Rectangular Diffraction') % title figure
    c2=colorbar; % show color bar
    c2.Label.String='Scaled Intensity [Arb. Units]'; % label color bar
    caxis([2,4]) % scale color gradient to lower and upper colorbar bounds
    
    % Plot horizontal cross section
    hit=[(2375:2625);(1:251)]'; % define matrix for horizontal intensity
    for ijk=1:251 % start for loop for center of plot
        hit(ijk,2)=I(2374+ijk,2500); % define hit as I at each point
    end % end for loop
    figure(4) % open figure window
    plot(hit) % plot horizontal intensity cross section
    xlim([0,250]) % scale x axis
    xlabel('Pixels') % label x axis
    ylabel('W/m^2') % label y axis
    title('Horizontal Intensity Cross Section through a Rectangular Aperture') % title figure
    
    % Plot vertical cross section
    vit=[(2375:2625);(1:251)]'; % define matrix for vertical intensity
    for ijk=1:251 % start for loop for center of plot
        vit(ijk,2)=I(2374+ijk,2500); % define vit as I at each point
    end % end for loop
    figure(5) % open figure window
    plot(vit) % plot vertical intensity cross section
    title('Vertical Intensity Cross Section through a Rectangular Aperture') % title figure
    xlim([0,250]) % scale x axis
    xlabel('Pixels') % label x axis
    ylabel('W/m^2') % label y axis
    
    
    
elseif strcmp(shape,'SingleSlit')==1 % if selected shape is single slit
    % Define single slit
    ap2=zeros(apl); % define aperture plane
    height=2500; % height of slit
    width=200; % width of slit
    ap2(round(1+apl/2-height/2):round(1+apl/2+height/2),round(1+apl/2-width/2):round(1+apl/2+width/2))=1; % define aperture
    
    % Plot the single slit
    figure(1) % open figure window
    imagesc(ap2) % plot the single slit
    title('SingleSlit Aperture') % title figure
    colormap gray % use gray color scale
    colorbar % display colorbar
    axis equal % use equivalent axis scales
    xlabel('Pixels') % label x axis
    ylabel('Pixels') % label y axis
    axis([0 apl 0 apl]) % scale axes
    
    figure(2) % Plot the Fourier Transform for a single slit
    z=fft2(ap2); % take forward fourier transform in 2d 
    z=fftshift(z); % shift fft to bring high intensity to center
    z=real(z); % take the real portion of the fft2
    I=z.^2; % intensity is the real portion squared
    l=I.^(0.05); % raise I to a power <<1 to scale it
    imagesc(l) % create an imagesc
    title('Diffraction Pattern through a Single Slit Aperture') % title figure
    colormap gray % use a gray color scale
    colorbar % display colorbar
    xlim([0,5000]) % scale x axis
    ylim([0,5000]) % scale y axis
    xlabel('Pixels') % label x axis
    ylabel('Pixels') % label y axis
    caxis([1,5]) % scale color gradient
    
    figure(3) % open zoomed figure window
    imagesc(l) % create an imagesc
    colormap gray % use a gray color scale
    axis equal % set the display scale of the axes
    axis([apl/2-250/2 apl/2+250/2 apl/2-250/2 apl/2+250/2]) % scale axes to center 250 pixels
    xlabel('Pixel') % label x axis
    ylabel('Pixel') % label y axis
    title('Close-Up Single Slit Diffraction') % title figure
    c2=colorbar; % show color bar
    c2.Label.String='Scaled Intensity [Arb. Units]'; % label color bar
    caxis([1.5,3.5]) % scale color gradient to lower and upper colorbar bounds
    
    % Plot horizontal cross section
    hit=[(2375:2625);(1:251)]'; % define matrix for horizontal intensity
    for ijk=1:251 % start for loop for center of plot
        hit(ijk,2)=I(2374+ijk,2500); % define hit as I at each point
    end % end for loop
    figure(4) % open figure window
    plot(hit) % plot horizontal intensity cross section
    xlim([0,250]) % scale x axis
    title('Horizontal Intensity Cross Section through a SingleSlit Aperture') % title figure
    xlabel('Pixels') % label x axis
    ylabel('W/m^2') % label y axis
    
    

elseif strcmp(shape,'DoubleSlit')==1 % if selected shape is double slit
    % Define double slit
    ap3=zeros(apl); % define aperture plane
    height=2500; % height of slits
    width2=175; % width of slits
    spacing=500; % space between slits
    ap3(round(1+apl/2-height/2):round(1+apl/2+height/2),round(1+apl/2-(width2+spacing/2)):round(1+apl/2-spacing/2))=1; % first slit
    ap3(round(1+apl/2-height/2):round(1+apl/2+height/2),round(1+apl/2+spacing/2):round(1+apl/2+spacing/2+width2))=1; % second slit
    
    % Plot the double slit
    figure(1) % open figure window
    imagesc(ap3) % plot the double slit
    title('DoubleSlit Aperture') % title figure
    colormap gray % use gray color map
    axis equal % use equivalent axis scales
    xlabel('Pixels') % label x axis
    ylabel('Pixels') % label y axis
    axis([0 apl 0 apl]) % scale axes
    
    figure(2) % open figure window to plot fourier transform
    z=fft2(ap3); % take forward fourier transform in 2d of aperture
    z=fftshift(z); % shift fft to bring high intensity to center
    z=real(z); % take the real portion of the fft2
    I=z.^2; % intensity is the real portion squared
    l=I.^(0.05); % raise I to a power <<1 to scale it
    imagesc(l) % create an imagesc
    title('Diffraction Pattern through a Double Slit Aperture') % title figure
    colormap gray % use a gray color scale
    colorbar % display colorbar
    xlim([0,5000]) % scale x axis
    ylim([0,5000]) % scale y axis
    xlabel('Pixels') % label x axis
    ylabel('Pixels') % label y axis
    caxis([1,5]) % scale color gradient
    
    figure(3) % open zoomed figure window
    imagesc(l) % create an imagesc
    colormap gray % use a gray color scale
    axis equal % set the display scale of the axes
    axis([apl/2-250/2 apl/2+250/2 apl/2-250/2 apl/2+250/2]) % scale axes to center 250 pixels
    xlabel('Pixel') % label x axis
    ylabel('Pixel') % label y axis
    title('Close-Up Double Slit Diffraction') % title figure
    c2=colorbar; % show color bar
    c2.Label.String='Scaled Intensity [Arb. Units]'; % label color bar
    caxis([1.25,4]) % scale color gradient to lower and upper colorbar bounds
    
    % Plot horizontal cross section
    hit=[(2375:2625);(1:251)]'; % define matrix for horizontal intensity
    for ijk=1:251 % start for loop for center of plot
        hit(ijk,2)=I(2374+ijk,2500); % define hit as I at each point
    end % end for loop
    figure(4) % open figure window
    plot(hit) % plot horizontal intensity cross section
    title('Horizontal Intensity Cross Section through a DoubleSlit Aperture') % title figure
    xlim([0,250]) % scale x axis
    xlabel('Pixels') % label x axis
    ylabel('W/m^2') % label y axis
    
   

elseif strcmp(shape,'Circle')==1 % if selected shape is circle
    % Define cicular aperture
    ap4=zeros(apl); % define aperture plane
    R=275; % radius of circle
    I=1:apl; % define matrix
    x=I-apl/2; % define x coordinates of pixels
    y=apl/2-I; % define y coordinates of pixels
    [X,Y]=meshgrid(x,y); % combine xy coordinates
    circle=(X.^2+Y.^2<=R^2); % define circle as points within xy set
    ap4(circle)=1; % define aperture
    
    % Plot the circular aperture
    figure(1) % open figure window
    imagesc(ap4) % plot the circular aperture
    title('Circular Aperture') % title figure
    colormap gray % use gray color scale
    axis equal % use equivalent axis scales
    axis([0 apl 0 apl]) % scale axes
    xlabel('Pixels') % label x axis
    ylabel('Pixels') % label y axis
    
    figure(2) % open figure window
    z=fft2(ap4); % take forward fourier transform in 2d of aperture
    z=fftshift(z); % shift fft to bring high intensity to center
    z=real(z); % take the real portion of the fft2
    I=z.^2; % intensity is the real portion squared
    l=I.^(0.05); % raise I to a power <<1 to scale it
    imagesc(l) % create an imagesc
    title('Diffraction Pattern through a Circular Aperture') % title figure
    colormap gray % use a gray color scale
    colorbar % display colorbar
    xlim([0,5000]) % scale x axis
    ylim([0,5000]) % scale y axis
    xlabel('Pixels') % label x axis
    ylabel('Pixels') % label y axis
    caxis([1,5]) % scale color gradient
    
    figure(3) % open zoomed figure window
    imagesc(l) % create an imagesc
    colormap gray % use a gray color scale
    axis equal % set the display scale of the axes
    axis([apl/2-250/2 apl/2+250/2 apl/2-250/2 apl/2+250/2]) % scale axes to center 250 pixels
    xlabel('Pixel') % label x axis
    ylabel('Pixel') % label y axis
    title('Close-Up Circular Diffraction') % title figure
    c2=colorbar; % show color bar
    c2.Label.String='Scaled Intensity [Arb. Units]'; % label color bar
    caxis([2,4]) % scale color gradient to lower and upper colorbar bounds
    
    % Plot horizontal cross section
    hit=[(2375:2625);(1:251)]'; % define matrix for horizontal intensity
    for ijk=1:251 % start for loop for center of plot
        hit(ijk,2)=I(2374+ijk,2500); % define hit as I at each point
    end % end for loop
    figure(4) % open figure window
    plot(hit) % plot horizontal intensity cross section
    xlim([0,250]) % scale x axis
    title('Horizontal Intensity Cross Section through a Circular Aperture') % title figure
    xlabel('Pixels') % label x axis
    ylabel('W/m^2') % label y axis
    
   

elseif strcmp(shape,'Triangle')==1 % if selected shape is triangle
    % Define triangular aperture 
    ap5=zeros(apl); % define aperture plane
    side=1500; % side length of triangle
    for n=0:1500 % open for loop with index 0-1500
        s=1500-n; % coordinate of pixel
        ap5(round(1+apl/2+side/2-s):round(1+apl/2+side/2),round(1+apl/2-side/2):round(1+apl/2-side/2+n))=1; % define aperture
    end % end for loop
    
    % Plot the triangular aperture
    figure(1) % open figure window
    imagesc(ap5) % plot the triangular aperture
    title('Triangular Aperture') % title figure
    colormap gray % use gray color scale
    axis equal % use equivalent axis scales
    xlabel('Pixels') % label x axis
    ylabel('Pixels') % label y axis
    axis([0 apl 0 apl]) % scale axes
    
    figure(2) % open figure window
    z=fft2(ap5); % take forward fourier transform in 2d of aperture
    z=fftshift(z); % shift fft to bring high intensity to center
    z=real(z); % take the real portion of the fft2
    I=z.^2; % intensity is the real portion squared
    l=I.^(0.05); % raise I to a power <<1 to scale it
    imagesc(l) % create an imagesc
    title('Diffraction Pattern through a Triangular Aperture') % title figure
    colormap gray % use a gray color scale
    colorbar % display colorbar
    xlim([0,5000]) % scale x axis
    ylim([0,5000]) % scale y axis
    xlabel('Pixels') % label x axis
    ylabel('Pixels') % label y axis
    caxis([1,5]) % scale color gradient
    
    figure(3) % open zoomed figure window
    imagesc(l) % create an imagesc
    colormap gray % use a gray color scale
    axis equal % set the display scale of the axes
    axis([apl/2-250/2 apl/2+250/2 apl/2-250/2 apl/2+250/2]) % scale axes to center 250 pixels
    xlabel('Pixel') % label x axis
    ylabel('Pixel') % label y axis
    title('Close-Up Triangular Diffraction') % title figure
    c2=colorbar; % show color bar
    c2.Label.String='Scaled Intensity [Arb. Units]'; % label color bar
    caxis([1.4,5]) % scale color gradient to lower and upper colorbar bounds
    
    % Plot diagonal cross section
    dit=[(2375:2625);(1:251)]'; % define matrix for diagonal intensity
    for ijk=1:251 % start for loop for center of plot
        dit(ijk,2)=I(2374+ijk,2626-ijk); % define dit as I at each point
    end % end for loop
    figure(4) % open figure window
    plot(dit) % plot diagonal intensity cross section
    xlim([0,250]) % scale x axis
    title('Diagonal Intensity Cross Section through a Triangular Aperture') % title figure
    xlabel('Pixels') % label x axis
    ylabel('W/m^2') % label y axis
    
    % Plot vertical cross section
    vit=[(2375:2625);(1:251)]'; % define matrix for vertical intensity
    for ijk=1:251 % start for loop for center of plot
        vit(ijk,2)=I(2374+ijk,2500); % define vit as I at each point
    end % end for loop
    figure(5) % open figure window
    plot(vit) % plot vertical intensity cross section
    xlim([0,250]) % scale x axis
    xlabel('Pixels') % label x axis
    ylabel('W/m^2') % label y axis
    title('Vertical Intensity Cross Section through a Triangular Aperture') % title figure
    
    % Plot horizontal cross section
    hit=[(2375:2625);(1:251)]'; % define matrix for horizontal intensity
    for ijk=1:251 % start for loop for center of plot
        hit(ijk,2)=I(2374+ijk,2500); % define hit as I at each point
    end % end for loop
    figure(6) % open figure window
    plot(hit) % plot horizontal intensity cross section
    xlim([0,250]) % scale x axis
    xlabel('Pixels') % label x axis
    ylabel('W/m^2') % label y axis
    title('Horizontal Intensity Cross Section through a Triangular Aperture') % title figure
    
    

else % if no conditions are met
  disp("Error occurs. Please see help file for further instructions.") % display error message
  return
  
end
