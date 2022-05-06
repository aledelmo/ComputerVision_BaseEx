
the function receives three inputs: a motion image, a gray level image and a colour image.

The first input is a 2d float image (motim) containing at each pixel a two-dimensional motion vector.

For each pixel (xi,yi) of the motim image xi(0) represents the motion along the x-axis and xi(1) the motion along the y-axis. The magnitude of the motion vector at each pixel is then sqrt(xi(0)^2+xi(1)^2).

In the first loop we check for the maximum local motion magnitude (aka the pixel with the largest motion magnitude). We store the maximum local magnitude in the variable maxrad.

In the second for loop we traverse again all the pixels. At each pixel we compute again the motion magnitude rad and we normalized it using the previously computed maxrad (rad/maxrad).

We then use the normalized magnitude and the gray level value to convert the colour image value in place.

Note that rad is computed twice when it could be stored already during the first loop. In order to avoid division by 0 it should also be checked if maxrad is >0 (might be zero if there is not motion)
