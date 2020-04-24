apergen % test function that creates a square aperture

z=fft2(ap); % take forward fourier transform in 2d of aperture generated in apergen

z=real(z); % take the real portion of the fft2

I=z.^2; % intensity is the real portion squared

l=I.^(0.05); % raise I to a power <1 to scale it

% we can comment these in/out to see what the scale would be
% max(l) % output maximum value in l
% min(l) % output minimum value in l

imagesc(l) % create an imagesc
colormap gray % use a gray color scale
xlim([0,5000]) % scale x axis
ylim([0,5000]) % scale y axis

caxis([1,5]) % scale color gradient