### Function Transformer: converting the dataset into normal distribution
> #### why we nee do to it: because it will make the calculation and statistical models to learn the dataset very easily
#### types:
- log transformer
- reciprocal transformer
- square / square root transformer

##### How to find if a dataset is normally distributed or now?
>sns.distplot()<br>
>pd.skew()<br>
>QQplot()

### 1. Log Transform
Take the log of every value in the dataset, it will make the dataset to be normally distributed
> It can be used for right skewed dataset

 ### 2. Reciprocal Transfrom
 It will take the reciprocal of every value in the dataset

 ### 3. Square Transfrom
 It will take the square of every value in the dataset

 ### 4. Square Root Transform
 It will take the square root of every value in the dataset
