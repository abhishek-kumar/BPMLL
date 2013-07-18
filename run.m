% run -- evaluate the BPMLL model on various benchmark multilabel datasets
%
% usage: run
%
% This script runs BPMLL code on benchmark datasets with the same settings
% as published in [1].
% 
% References:
% [1] M.-L. Zhang and Z.-H. Zhou. Multilabel neural networks with applications to functional genomics and text categorization. IEEE Transactions on Knowledge and Data Engineering, 2006, 18(10): 1338-1351.
%
% Author: abhishek.kumar.ak@gmail.com (Abhishek Kumar)

numEpochs = 100;
if exist('outputs', 'dir')
  rmdir('outputs', 's');
end
mkdir('outputs');
warning('off','all');

% Get results for Scene dataset
fprintf('\nTraining BPMLL on Scene dataset...\n');
[predictedLabels, rawOutputs, thresholds] = getNNResults('data/scene/scene-train.csv', 'data/scene/scene-test.csv', 294, 6, 5, numEpochs);
csvwrite('outputs/scene-predictions.csv', predictedLabels); % Predicted labels, 0 or 1 for each label
csvwrite('outputs/scene-outputs.csv', rawOutputs); % raw output in the range [0, 1] for each label

% Get results for Yeast dataset
fprintf('\nTraining BPMLL on Yeast dataset...\n');
[predictedLabels, rawOutputs, thresholds] = getNNResults('data/yeast/yeast-train.csv', 'data/yeast/yeast-test.csv', 103, 14, 10, numEpochs);
csvwrite('outputs/yeast-predictions.csv', predictedLabels); % Predicted labels, 0 or 1 for each label
csvwrite('outputs/yeast-outputs.csv', rawOutputs); % raw output in the range [0, 1] for each label

% Get results for Emotions dataset
fprintf('\nTraining BPMLL on Emotions dataset...\n');
[predictedLabels, rawOutputs, thresholds] = getNNResults('data/emotions/emotions-train.csv', 'data/emotions/emotions-test.csv', 72, 6, 4, numEpochs);
csvwrite('outputs/emotions-predictions.csv', predictedLabels); % Predicted labels, 0 or 1 for each label
csvwrite('outputs/emotions-outputs.csv', rawOutputs); % raw output in the range [0, 1] for each label

% Get results for Enron dataset
fprintf('\nTraining BPMLL on Enron dataset...\n');
[predictedLabels, rawOutputs, thresholds] = getNNResults('data/enron/enron-train.csv', 'data/enron/enron-test.csv', 1001, 53, 20, numEpochs);
csvwrite('outputs/enron-predictions.csv', predictedLabels); % Predicted labels, 0 or 1 for each label
csvwrite('outputs/enron-outputs.csv', rawOutputs); % raw output in the range [0, 1] for each label

