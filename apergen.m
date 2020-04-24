% Steph Smith
% Optics 211
% 9 Apr 2020
% Lab 5, Part 5
% Create an aperture

% Define aperture field
ap1=5000; % size of aperture field
ap=zeros(ap1); % define actual aperture plane

% Define square aperture
sq1=500; % define square length; next line makes values within ap =1
% ap(round(1+ap1/2-sq1/2):round(1+ap1/2+sq1/2),round(1+ap1/2-sq1/2):round(1+ap1/2+sq1/2))=1;

for ijk=round(1+ap1/2-sq1/2):round(1+ap1/2+sq1/2) % begin for loop for y coordinates
    for lmn=round(1+ap1/2-sq1/2):round(1+ap1/2+sq1/2); % begin for loop for x coordinates
        ap(ijk,lmn)=1; % set pixel y,x to 1
    end % end for loop
end % end for loop

figure % open figure window to display aperture field
imagesc(ap) % plot image of aperture field
colormap gray % set color to black and white
axis equal % set display scale of axes
axis([0 ap1 0 ap1]) % set axes limits to size of aperture field