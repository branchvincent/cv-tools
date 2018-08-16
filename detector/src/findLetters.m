function [p, corr] = findLetters(I, tau)

% Make template
T = letter(10, 5);

% Calculate Guassian pyramid
phi = 0.75;
pyr = gaussianPyramid(I, phi);

% Compute cross correlation
for l = 1:length(pyr)
    img = pyr{l};
    
    % Check template fits image    
    if any(size(img) < size(T))
        break
    end
    
    % Resize
    c = xcorr(T, img);
    c = imresize(c, size(I));
    
    % Compute max 
    if l == 1
        corr = c;
    else
        corr = max(c, corr);
    end
end

% Find peaks
p = findPeaks(corr, tau);
