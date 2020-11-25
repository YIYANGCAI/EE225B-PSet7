# PSet7 Image Compression

## Intro
This problem set concentrate on algorithms related to image compression.

## Code structure and run commands
>There are three sub-folders in this problem set.

### **Part1: Objective fidelity criteria**
In ./problem1/ and there are three matlab files:
> RMSE.m: a matlab function, computing two images' root mean square error.

> SQAR_SNR: a matlab function, computing two images' square root of signal-to-noise ratio.

> part1.m: main program, using uniform quantization and IGS quantization to compress the same image and quantify the two metrics above.

Run the following command under the same direction of part1.m in the Matlab command window:
```
part1
```
Results of metrics will be displayed on the command window and two images will be output under the same direction.

### **Part2: Image entropy**
In ./problem2/ and there are two matlab files:
> EntropySelf.m: a self-written matlab function, computing one image's entropy value.

> part2.m: main program, computing two images' entropy.
Run the following command under the same direction of part2.m in the Matlab command window:
```
part2
```
Results of entropy will be displayed on the command window.

### **Part3: Transform coding**
In ./problem3/ and there are four matlab files:
> RMSE.m: a matlab function, computing two images' root mean square error.

> SQAR_SNR: a matlab function, computing two images' square root of signal-to-noise ratio.

> part3_fft.m: main program, using Fourier transformation to compress the image and compute the metrics of compressed images of 8 different retained coefficients

> part3_dct.m: main program, using Fourier transformation to compress the image and compute the metrics of compressed images of 8 different retained coefficients

Run the following command under the same direction of part3_fft.m in the Matlab command window:
```
part3_fft
```
Results of metrics will be displayed on the command window and 8 images with different retained coefficients will be output under the same direction.

Run the following command under the same direction of part3_dct.m in the Matlab command window:
```
part3_dct
```
Results of metrics will be displayed on the command window and 8 images with different retained coefficients will be output under the same direction.