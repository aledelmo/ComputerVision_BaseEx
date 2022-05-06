In order to find the optimal parameters a grid search may be used, especially regarding the learning rate, number of filters
and convolutional layers

The chosen model architecture and hyper-parameters are:
- epochs: 150
- batch: 8
- lr: 1e-5
- base_filters: 128
- dense_filters: 8
- conv_layers: 1

The model reaches an accuracy of around 96.6 %

The total training time on a RTX3090 was 9 minutes and 49 seconds

In order to correctly evaluate model performances a k-fold training strategy should be used. Furthermore, 
the data-set was only split in training and test for prototyping. The data-set should be split in a training (80%), 
validation (15%) and test (5%) for an accurate evaluation. The folds may also be exploited in order to create an ensemble
of deep neural network using the same hyper-parameters but with different training data. 
In order to avoid over-fitting two-dimensional dropout layers could be added between convolutions. Finally, 
the model presented here has a simple architecture composed by only 2D convolutions and dense layers, a more complex 
architecture could better exploits data features and consequently improving performances.
