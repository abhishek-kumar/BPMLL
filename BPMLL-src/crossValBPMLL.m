% RunBPMLL -- Run BPMLL on benchmark datasets
%
% This script runs BPMLL code on benchmark datasets with the same settings
% as published in [1].
% Please run 'clear' before executing this script to clear any old values.
%
% Author: abhishek.kumar.ak@gmail.com (Abhishek Kumar)
%

% Yeast
N = 103;
k = 14;
datafile = 'data/yeast/yeast-train.csv';
epochslim = 80;
h = 10;

% Emotions
%N = 72;
%k = 6;
%trainfile = 'data/emotions/emotions-train.csv';
%testfile = 'data/emotions/emotions-test.csv';
%epochslim = 80;
%h = 5;

% Scene
%N = 294;
%k = 6;
%trainfile = 'data/scene/scene-train.csv';
%testfile = 'data/scene/scene-test.csv';
%epochslim = 80;
%h = 5;

alldata = dlmread(datafile);
[Train, Test] = crossvalind('HoldOut', size(alldata, 1), 0.1);

train_data = alldata(Train, 1:N);
train_target = alldata(Train, N + 1:N + k)';
train_target = 2.*train_target - 1; % convert {0, 1} to {-1, +1}

test_data = alldata(Test,1:N);
test_target = alldata(Test,N+1:N+k)';
test_target = 2.*test_target - 1; % convert {0, 1} to {-1, +1}

feature_limits = [(-1).*ones(N,1),ones(N,1)]; % All our training data ranges from [-1,1].

[nets, errors] = BPMLL_train(train_data, train_target, h, 0.05, epochslim, 2, 2, 0.1, feature_limits);
[HammingLoss,RankingLoss,OneError,Coverage,Average_Precision,Outputs,Threshold,Pre_Labels] = BPMLL_test(train_data,train_target,test_data,test_target,nets{epochslim, 1});
fprintf('Hamming loss = %f\n', HammingLoss);
fprintf('RankingLoss = %f\n', RankingLoss);
fprintf('OneError = %f\n', OneError);
fprintf('Coverage = %f\n', Coverage);
fprintf('Average_Precision = %f\n', Average_Precision);


