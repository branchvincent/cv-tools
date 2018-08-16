% Define parameters
addpath(genpath('../data'));
imgSrc = './data/letters.png';
mDest = fullfile(pwd, 'tex', 'graphics', '5c-letters2.png');
tau = 0.65;

% Find letters
I = imread(imgSrc);
[p, corr] = findLetters(I, tau);
mesh(corr);

% Overlay detections on image
imshow(I); 
hold on;
plot(p(:,2), p(:,1), '.r', 'MarkerSize', 28);
export_fig(mDest, '-native');