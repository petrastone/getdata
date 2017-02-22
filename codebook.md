# Code Book

### Summary of `tidyData.txt`

This data set presents the means for 66 variables from the original data set grouped by subject and activity.
The original data set [Anguita et al, 2013](#har) was based on 30 subjects performing activities of daily living while carrying a waist-mounted smartphone with embedded inertial sensors.

<table class="table">
<thead>
<tr>
<th style="text-align:left;">
</th>
<th style="text-align:left;">
Info
</th>
<th style="text-align:left;">
Notes
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
Dimensions
</td>
<td style="text-align:left; white-space: nowrap;">
180 rows<br> 68 columns
</td>
<td style="text-align:left;">
66 Variables and 2 Identifier columns in 180 rows representing one observation of a subject one activity
</td>
</tr>
<tr>
<td style="text-align:left;">
Identifiers
</td>
<td style="text-align:left;">
<code>Subject</code> <code>Activity</code>
</td>
<td style="text-align:left;">
Identifier columns for the subject and the activity the subject performed.&lt;br&gt;<code>Subject</code>: Integer from 1 to 30.&lt;br&gt;<code>Activities</code>: Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, Lying Down
</td>
</tr>
<tr>
<td style="text-align:left;">
Observations
</td>
<td style="text-align:left;">
180
</td>
<td style="text-align:left;">
Each observation (row) is a combination of subject and one of the 6 activities for 30 subjects
</td>
</tr>
<tr>
<td style="text-align:left;">
Variables
</td>
<td style="text-align:left;">
66
</td>
<td style="text-align:left;">
Each variable (column) is the mean of 66 variables extracted from the original data set
</td>
</tr>
</tbody>
</table>


### Variables in `tidyData.txt`
<table class="table">
<caption>
Meanings of Components of Variable Names
</caption>
<thead>
<tr>
<th style="text-align:left;">
Component
</th>
<th style="text-align:left;">
Description
</th>
<th style="text-align:left;">
Notes
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
<code>Accel</code>
</td>
<td style="text-align:left;">
Measurement from the accelerometor sensor
</td>
<td style="text-align:left;">
Filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20Hz
</td>
</tr>
<tr>
<td style="text-align:left;">
<code>Gyro</code>
</td>
<td style="text-align:left;">
Measurement from the gyroscope sensor
</td>
<td style="text-align:left;">
Filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20Hz
</td>
</tr>
<tr>
<td style="text-align:left;">
<code>Body</code>
</td>
<td style="text-align:left;">
Body acceleration component derived from accelerometer measurement
</td>
<td style="text-align:left;">
Filtered using a low pass Butterworth filter with a corner frequency of 0.3Hz.
</td>
</tr>
<tr>
<td style="text-align:left;">
<code>Gravity</code>
</td>
<td style="text-align:left;">
Gravity acceleration component derived from accelerometer measurement
</td>
<td style="text-align:left;">
Filtered using a low pass Butterworth filter with a corner frequency of 0.3Hz.
</td>
</tr>
<tr>
<td style="text-align:left;">
<code>Jerk</code>
</td>
<td style="text-align:left;">
Body linear acceleration and angular velocity
</td>
<td style="text-align:left;">
Derived from <code>Body</code> and <code>Gyro</code> measurements
</td>
</tr>
<tr>
<td style="text-align:left;">
<code>Magtd</code>
</td>
<td style="text-align:left;">
Magnitude of <code>Body</code>, <code>Gravity</code> and <code>Jerk</code> signals
</td>
<td style="text-align:left;">
Calculated using the Euclidean norm
</td>
</tr>
<tr>
<td style="text-align:left;">
<code>X</code>,<code>Y</code>,<code>Z</code>
</td>
<td style="text-align:left;">
Measurement taken along the X, Y or Z axis of the accelerometer and gyro
</td>
<td style="text-align:left;">-</td>
</tr>
<tr>
<td style="text-align:left;">
<code>FFT</code>
</td>
<td style="text-align:left;">
The FFT suffix indicates that a fast fourier transform was applied to the measurement
</td>
<td style="text-align:left;">
Fast fourier transform
</td>
</tr>
<tr>
<td style="text-align:left;">
Mean
</td>
<td style="text-align:left;">
Mean calculated in original study
</td>
<td style="text-align:left;">
Mean was calculated at windows of 2.5sec from raw measurements
</td>
</tr>
<tr>
<td style="text-align:left;">
Std
</td>
<td style="text-align:left;">
Standard Deviation calculated in original study
</td>
<td style="text-align:left;">
Std deviation was calculated at windows of 2.5sec from raw measurements
</td>
</tr>
<tr>
<td style="text-align:left;">
MeanOf
</td>
<td style="text-align:left;">
Mean by group (person and activity)
</td>
<td style="text-align:left;">-</td>
</tr>
</tbody>
</table>

### Examples
<table class="table">
<caption>
Some examples of interpreting variable names
</caption>
<thead>
<tr>
<th style="text-align:left;">
Variable
</th>
<th style="text-align:left;">
Description
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
<code>MeanOfBodyAccelMeanZ</code>
</td>
<td style="text-align:left;">
Mean (by Subject and Activity) of Mean of Body acceleration on the Z axis.
</td>
</tr>
<tr>
<td style="text-align:left;">
<code>MeanOfGravityAccelMagtdStd</code>
</td>
<td style="text-align:left;">
Mean (by Subject and Activity) of Standard deviation of Gravity acceleration magnitude
</td>
</tr>
<tr>
<td style="text-align:left;">
<code>MeanOfBodyGyroJerkMeanX</code>
</td>
<td style="text-align:left;">
Mean (by Subject and Activity) of Mean of Jerk signal on X axis (originally derived from both accel and gyro sensors)
</td>
</tr>
<tr>
<td style="text-align:left;">
<code>MeanOfBodyAccelStdYFFT</code>
</td>
<td style="text-align:left;">
Mean (by Subject and Activity) of Mean of Body acceleration on the Y axis with a fast fourier transform
</td>
</tr>
</tbody>
</table>
### Full List of Variables
<table class="table">
<thead>
<tr>
<th style="text-align:left;">
</th>
<th style="text-align:left;">
Variables
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
<code>MeanOfBodyAccelMeanX</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
2
</td>
<td style="text-align:left;">
<code>MeanOfBodyAccelMeanY</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
3
</td>
<td style="text-align:left;">
<code>MeanOfBodyAccelMeanZ</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
4
</td>
<td style="text-align:left;">
<code>MeanOfBodyAccelStdX</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
5
</td>
<td style="text-align:left;">
<code>MeanOfBodyAccelStdY</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
6
</td>
<td style="text-align:left;">
<code>MeanOfBodyAccelStdZ</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
7
</td>
<td style="text-align:left;">
<code>MeanOfGravityAccelMeanX</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
8
</td>
<td style="text-align:left;">
<code>MeanOfGravityAccelMeanY</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
9
</td>
<td style="text-align:left;">
<code>MeanOfGravityAccelMeanZ</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
10
</td>
<td style="text-align:left;">
<code>MeanOfGravityAccelStdX</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
11
</td>
<td style="text-align:left;">
<code>MeanOfGravityAccelStdY</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
12
</td>
<td style="text-align:left;">
<code>MeanOfGravityAccelStdZ</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
13
</td>
<td style="text-align:left;">
<code>MeanOfBodyAccelJerkMeanX</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
14
</td>
<td style="text-align:left;">
<code>MeanOfBodyAccelJerkMeanY</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
15
</td>
<td style="text-align:left;">
<code>MeanOfBodyAccelJerkMeanZ</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
<code>MeanOfBodyAccelJerkStdX</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
17
</td>
<td style="text-align:left;">
<code>MeanOfBodyAccelJerkStdY</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
18
</td>
<td style="text-align:left;">
<code>MeanOfBodyAccelJerkStdZ</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
19
</td>
<td style="text-align:left;">
<code>MeanOfBodyGyroMeanX</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
20
</td>
<td style="text-align:left;">
<code>MeanOfBodyGyroMeanY</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
21
</td>
<td style="text-align:left;">
<code>MeanOfBodyGyroMeanZ</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
22
</td>
<td style="text-align:left;">
<code>MeanOfBodyGyroStdX</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
23
</td>
<td style="text-align:left;">
<code>MeanOfBodyGyroStdY</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
24
</td>
<td style="text-align:left;">
<code>MeanOfBodyGyroStdZ</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
25
</td>
<td style="text-align:left;">
<code>MeanOfBodyGyroJerkMeanX</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
26
</td>
<td style="text-align:left;">
<code>MeanOfBodyGyroJerkMeanY</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
27
</td>
<td style="text-align:left;">
<code>MeanOfBodyGyroJerkMeanZ</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
28
</td>
<td style="text-align:left;">
<code>MeanOfBodyGyroJerkStdX</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
29
</td>
<td style="text-align:left;">
<code>MeanOfBodyGyroJerkStdY</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
30
</td>
<td style="text-align:left;">
<code>MeanOfBodyGyroJerkStdZ</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
31
</td>
<td style="text-align:left;">
<code>MeanOfBodyAccelMagtdMean</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
32
</td>
<td style="text-align:left;">
<code>MeanOfBodyAccelMagtdStd</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
33
</td>
<td style="text-align:left;">
<code>MeanOfGravityAccelMagtdMean</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
34
</td>
<td style="text-align:left;">
<code>MeanOfGravityAccelMagtdStd</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
35
</td>
<td style="text-align:left;">
<code>MeanOfBodyAccelJerkMagtdMean</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
36
</td>
<td style="text-align:left;">
<code>MeanOfBodyAccelJerkMagtdStd</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
37
</td>
<td style="text-align:left;">
<code>MeanOfBodyGyroMagtdMean</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
38
</td>
<td style="text-align:left;">
<code>MeanOfBodyGyroMagtdStd</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
39
</td>
<td style="text-align:left;">
<code>MeanOfBodyGyroJerkMagtdMean</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
40
</td>
<td style="text-align:left;">
<code>MeanOfBodyGyroJerkMagtdStd</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
41
</td>
<td style="text-align:left;">
<code>MeanOfBodyAccelMeanXFFT</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
42
</td>
<td style="text-align:left;">
<code>MeanOfBodyAccelMeanYFFT</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
43
</td>
<td style="text-align:left;">
<code>MeanOfBodyAccelMeanZFFT</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
44
</td>
<td style="text-align:left;">
<code>MeanOfBodyAccelStdXFFT</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
45
</td>
<td style="text-align:left;">
<code>MeanOfBodyAccelStdYFFT</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
46
</td>
<td style="text-align:left;">
<code>MeanOfBodyAccelStdZFFT</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
47
</td>
<td style="text-align:left;">
<code>MeanOfBodyAccelJerkMeanXFFT</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
48
</td>
<td style="text-align:left;">
<code>MeanOfBodyAccelJerkMeanYFFT</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
49
</td>
<td style="text-align:left;">
<code>MeanOfBodyAccelJerkMeanZFFT</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
50
</td>
<td style="text-align:left;">
<code>MeanOfBodyAccelJerkStdXFFT</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
51
</td>
<td style="text-align:left;">
<code>MeanOfBodyAccelJerkStdYFFT</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
52
</td>
<td style="text-align:left;">
<code>MeanOfBodyAccelJerkStdZFFT</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
53
</td>
<td style="text-align:left;">
<code>MeanOfBodyGyroMeanXFFT</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
54
</td>
<td style="text-align:left;">
<code>MeanOfBodyGyroMeanYFFT</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
55
</td>
<td style="text-align:left;">
<code>MeanOfBodyGyroMeanZFFT</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
56
</td>
<td style="text-align:left;">
<code>MeanOfBodyGyroStdXFFT</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
57
</td>
<td style="text-align:left;">
<code>MeanOfBodyGyroStdYFFT</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
58
</td>
<td style="text-align:left;">
<code>MeanOfBodyGyroStdZFFT</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
59
</td>
<td style="text-align:left;">
<code>MeanOfBodyAccelMagtdMeanFFT</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
60
</td>
<td style="text-align:left;">
<code>MeanOfBodyAccelMagtdStdFFT</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
61
</td>
<td style="text-align:left;">
<code>MeanOfBodyAccelJerkMagtdMeanFFT</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
62
</td>
<td style="text-align:left;">
<code>MeanOfBodyAccelJerkMagtdStdFFT</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
63
</td>
<td style="text-align:left;">
<code>MeanOfBodyGyroMagtdMeanFFT</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
64
</td>
<td style="text-align:left;">
<code>MeanOfBodyGyroMagtdStdFFT</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
65
</td>
<td style="text-align:left;">
<code>MeanOfBodyGyroJerkMagtdMeanFFT</code>
</td>
</tr>
<tr>
<td style="text-align:left;">
66
</td>
<td style="text-align:left;">
<code>MeanOfBodyGyroJerkMagtdStdFFT</code>
</td>
</tr>
</tbody>
</table>

### References
<div id="refs" class="references">
<div id="har">
<p>Anguita, D., A. Ghio, L. Oneto, X. Parra, and J. L. Reyes-Ortiz. 2013. “A Public Domain Dataset for Human Activity Recognition Using Smartphones.”</p>
</div>
</div>