This is an attempt I made a few years later to complete the same project in Python but it didn't work.

NOTE: I didn't perform despeckling in this case.

NOTE: I used a different part of the dataset (specifically I compared data for March and May rather than March and April, but this doesn't change the substance that it doesn't work as it should...)

---
# RESULTS

The <ins>colour coded images</ins> kind of look the same but that's not a reliable indicator:

Matlab:

![](https://github.com/Roberto888888/Remote-Sensing-Project-Polarimetric-SAR/blob/main/Python-Attempt/RGB%20Coded%20Site%20data%20(Not%20Filtered).png)

Python:

![](https://github.com/Roberto888888/Remote-Sensing-Project-Polarimetric-SAR/blob/main/Python-Attempt/RGB%20Coded%20Site%20data%20(Not%20Filtered)%20-%20Python.png)

In the test statistic image we can already observe differences, but again it's not sure whether that depends on the displaying functions or not:

Matlab:

![](https://github.com/Roberto888888/Remote-Sensing-Project-Polarimetric-SAR/blob/main/Python-Attempt/lnQ.bmp)

Python:

![](https://github.com/Roberto888888/Remote-Sensing-Project-Polarimetric-SAR/blob/main/Python-Attempt/-2plnQ.png)

The histogram for a no change region looks different and this starts to be concerning:

Matlab:

![](https://github.com/Roberto888888/Remote-Sensing-Project-Polarimetric-SAR/blob/main/Python-Attempt/distr.bmp)

Python:

![immagine](https://github.com/Roberto888888/Remote-Sensing-Project-Polarimetric-SAR/assets/90435131/faed920e-996a-4500-9db3-1886d93e2349)

I cannot compare the value of the threshold that I was getting in Matlab because I don't have Matlab available now but in Python the binary image that I get is almost completely black, so it doesn't work.
