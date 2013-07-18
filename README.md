This is a wrapper script for the BPMLL algorithm [1, 2].
It runs this model on 4 benchmark multilabel datasets and outputs evaluation metrics.

Requirements
================================

* Matlab
* Neural Network Toolkit for Matlab. (to check if you have it, type 'help newff' and see if you get a function description)

How to run
================================
* Download this repo and navigate to the directory that contains this readme file.

        git clone https://github.com/abhishek-kumar/BPMLL
        cd BPMLL
* copy the 'data.zip' file from https://www.dropbox.com/s/g812jg9c6kj081y/data.zip to the current directory
* extract 'data.zip' here. After extracting, the 'data' directory should now contain four subdirectories, 'scene', 'yeast', 'emotions' and 'enron'.
* Start Matlab, navigate to the current directory (BPMLL), and type 'run'

Note
================================

1. After extracting 'data.zip', you should have the following directory structure within the folder 'data':
  * scene/scene-train.csv
  * scene/scene-test.csv
  * yeast/yeast-train.csv
  * yeast/yeast-test.csv
  * emotions/emotions-train.csv
  * emotions/emotions-test.csv
  * enron/enron-train.csv
  * enron/enron-test.csv
2. Dataset format. Each dataset is separated into two CSV files - a training set and a test set. If the training set contains 4 examples with 3 features and 2 labels, the train.csv file should have 4 rows and 3+2=5 columns. Labels must be in {0,1} and feature values must be in [-1,1]. E.g.

        0.5677,0.7400,0.0765,0,1
        0.8364,-0.7465,-0.9874,1,1
        0.7465,0.0000,0.9048,1,0
        0.8475,-0.8475,0.3658,0,0

References
================================

[1] M.-L. Zhang and Z.-H. Zhou. Multilabel neural networks with applications to functional genomics and text categorization. IEEE Transactions on Knowledge and Data Engineering, 2006, 18(10): 1338-1351.

[2] The BPMLL source code within the directory 'BPMLL-src' is taken from http://lamda.nju.edu.cn/Default.aspx?Page=code_BPMLL
