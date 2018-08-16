function [layers, options] = good(checkpointPath)

layers = [imageInputLayer([1 2])
    fullyConnectedLayer(4)
    reluLayer
    fullyConnectedLayer(4)
    reluLayer
    fullyConnectedLayer(2)
    softmaxLayer
    classificationLayer()];

% Learning rate schedule, based on the following relation:
% finalRate = initialRate * factor ^ (epochs/period)
miniBatchSize = 175;
initialRate = 0.25;
finalRate = 0.001;
epochs = 1000;
dropFactor = 0.1;
if initialRate <= finalRate
    dropPeriod = epochs;
else
    dropPeriod = round(epochs * log(dropFactor) / log(finalRate/initialRate));
end

options = trainingOptions('sgdm', ...
    'MaxEpochs', epochs, ...
    'MiniBatchSize', miniBatchSize, ...
    'InitialLearnRate', initialRate, ...
    'LearnRateSchedule', 'piecewise', ...
    'LearnRateDropFactor', dropFactor, ...
    'LearnRateDropPeriod', dropPeriod, ...
    'CheckpointPath', checkpointPath);
