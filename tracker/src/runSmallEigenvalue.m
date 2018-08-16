% Run
sigma = 2;
lambdaMin = smallEigenvalue(I, sigma);

% Plot
imshow(I, []);
export_fig('tex/graphics/4a-image.png', '-native');
showLambda(lambdaMin);
export_fig('tex/graphics/4a-lambda.png', '-native');