This is a wrapper script for the BPMLL algorithm [1, 2].
It runs this model on 4 benchmark multilabel datasets and outputs evaluation metrics.

Requirements:
  * Matlab
  * Neural Network Toolkit for Matlab. (to check if you have it, type 'help newff' and see if you get a function description)

How to run:
  * copy the 'data.zip' file from https://www.dropbox.com/s/g812jg9c6kj081y/data.zip to this directory
  * extract 'data.zip' here. After extracting, the 'data' directory should now contain four subdirectories, 'scene', 'yeast', 'emotions' and 'enron'.
  * Start Matlab, navigate to this directory, and type 'run'

Note: 
After extraction, you should have the following directory structure within the folder 'data':
  * scene/scene-train.csv
  * scene/scene-test.csv
  * yeast/yeast-train.csv
  * yeast/yeast-test.csv
  * emotions/emotions-train.csv
  * emotions/emotions-test.csv
  * enron/enron-train.csv
  * enron/enron-test.csv

References

[1] M.-L. Zhang and Z.-H. Zhou. Multilabel neural networks with applications to functional genomics and text categorization. IEEE Transactions on Knowledge and Data Engineering, 2006, 18(10): 1338-1351.
[2] The BPMLL source code within the directory 'BPMLL-src' is taken from http://lamda.nju.edu.cn/Default.aspx?Page=code_BPMLL
