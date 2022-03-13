# Delmonte Alessandro - Parrot Interview

Solution to the 3 exercises for the interview for the Computer Vision and Deep Learning engineer.
Each exercise has a dedicated sub-folder.

## Exercise 1

the function receives three inputs: a motion image, a gray level image and a colour image.

The first input is a 2d float image (motim) containing at each pixel a two dimensional motion vector.

For each pixel (xi,yi) of the motim image xi(0) represents the motion along the x axis and xi(1) the motion along the y axis. The magnitude of the motion vector at each pixel is then sqrt(xi(0)^2+xi(1)^2).

In the first loop we check for the maximum local motion magnitude (aka the pixel with the largest motion magnitude). We store the maximum local magnitude in the variable maxrad.

In the second for loop we traverse again all the pixels. At each pixels we compute again the motion magnitude rad and we normalized it using the previously computed maxrad (rad/maxrad).

We then use the normalized magnitude and the gray level value to convert the colour image value in place.

Note that rad is computed twice when it could be stored already during the first loop. In order to avoid division by 0 it should also be checked if maxrad is >0 (might be zero if there is not motion)

## Exercise 2


Afin de suivre les mouvements d'un objet dans la scene il faut etre capable de suivre certains points de l’image au cours du temps. Une méthode que on peut utiliser pour extraire les points d’interet est la méthode SIFT. Cette méthode va rechercher les coins à des échelles différentes, ce qui rend la méthode invariante aux changements d’échelle, en plus de l’invariance aux rotations qui existait déjà avec le détecteur de Harris par exemple. Elle s’appuie sur le Laplacien de gaussienne qui est approximé par une différence de gaussiennes par soucis d’efficacité. Une fois la détection des points d’intérets réalisée, il faut calculer leur ”carte d’identité” pour etre capable de retrouver ces memes points par la suite. Le descripteur SIFT va calculer un vecteur de taille 128 qui va représenter le point. Ce vecteur contient les informations d’orientations du gradient pour une fenetre de taille 16 × 16 disposzeee autour du point.
Pour chaque sous-fenetre de taille 4 × 4 de la fenetre 16 × 16, un histogramme discrétisé (8 orientations) des orientations de gradients dans la sous-fenetre est calculé.
Au final, 128 valeurs sont bien retournées (16 sous-fenetres) × (8 orientations). Une distance L2 peut etre utilisée pour comparer les descripteurs SIFT entre eux. Le couple de SIFT qui a la distance la plus faible peut ˆetre consid ́er ́e comme relatif au mˆeme point. La correspondance est donc trouvée. Afin de s’assurer que la correspondance n’est pas trouvée par hasard, un tri sur les correspondances entre points est réalisé : on garde le meilleur point uniquement si le Ratio de Lowe de la distance du premier
sur la distance du second est inférieur à un certain seuil (k). La recherche des correspondances peut etre accélérée avec un KDTree (pour des dimensions aussi grandes que celles des SIFT les méthodes peuvent se baser sur des approximations pour gagner du temps comme le fait l’algorithme d’openCV avec son approche FLANN).
 Les paramètres les plus importants sont:
L'intensité du lissage initial avec un kernel de Gauss (paramètre sigma du kernel).  Sigma va déprendre du type d'image, un sigma trop faible ne fera pas ressortir des differences entres les images et donc ne permettra pas d'avoir assez keypoints. Un sigma trop elevé pourrait créer trop de bruit.
Seuil sur le contrast: les keypoints localisés dans des zones avec faible contrast sont eliminés pour éliminer des fausses correspondances.
Le match ratio (ratio de Lowe) et le seuil k. k devrait être généralement assez elevé (au moins 0.7) pour éviter d'obtenir trop de fausses correspondance.

## Exercise 3

Data were split between train and test with a 80%/20% ratio.

The model is still overfitting to training data. Dropout layers may be added and learning rate should be tuned.
Test and training dataset could be changes using stratification based on ground truth labels.
Ensemble learning on differet subsets of the dataset is an option and a cross-validation of results is necessary.

In order to find the optmal parameters a grid search may be used, especially regarding the learning rate which was not optmized 
ddue to time issues working with a colab notebook.


## Usage

Scripts may be run as jupyter notebooks. In order to run the third exercise a GPU is necessary. Google
Colab may be also used.

## System Requirements

Python 3.10

[TensorFlow](https://www.tensorflow.org) 2.8

Tested on MacBook Pro (15-inch, 2017)

## Contacts

For any inquiries please contact: 
[Alessandro Delmonte](https://aledelmo.github.io) @ [alessandro.delmonte@institutimagine.org](mailto:alessandro.delmonte@institutimagine.org)

## License

This project is licensed under the [Apache License 2.0](LICENSE) - see the [LICENSE](LICENSE) file for
details
