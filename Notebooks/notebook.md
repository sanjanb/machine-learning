```python
# This Python 3 environment comes with many helpful analytics libraries installed
# It is defined by the kaggle/python Docker image: https://github.com/kaggle/docker-python
# For example, here's several helpful packages to load

import numpy as np # linear algebra
import pandas as pd # data processing, CSV file I/O (e.g. pd.read_csv)

# Input data files are available in the read-only "../input/" directory
# For example, running this (by clicking run or pressing Shift+Enter) will list all files under the input directory

import os
for dirname, _, filenames in os.walk('/kaggle/input'):
    for filename in filenames:
        print(os.path.join(dirname, filename))

# You can write up to 20GB to the current directory (/kaggle/working/) that gets preserved as output when you create a version using "Save & Run All"
# You can also write temporary files to /kaggle/temp/, but they won't be saved outside of the current session
```

## Step1: upload and clean the dataset


```python
import pandas as pd
import numpy as np
```


```python
data = pd.read_excel("/kaggle/input/gym-recommendation/gym recommendation.xlsx")
```


```python
data.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>ID</th>
      <th>Sex</th>
      <th>Age</th>
      <th>Height</th>
      <th>Weight</th>
      <th>Hypertension</th>
      <th>Diabetes</th>
      <th>BMI</th>
      <th>Level</th>
      <th>Fitness Goal</th>
      <th>Fitness Type</th>
      <th>Exercises</th>
      <th>Equipment</th>
      <th>Diet</th>
      <th>Recommendation</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>Male</td>
      <td>18</td>
      <td>1.68</td>
      <td>47.5</td>
      <td>No</td>
      <td>No</td>
      <td>16.83</td>
      <td>Underweight</td>
      <td>Weight Gain</td>
      <td>Muscular Fitness</td>
      <td>Squats, deadlifts, bench presses, and overhead...</td>
      <td>Dumbbells and barbells</td>
      <td>Vegetables: (Carrots, Sweet Potato, and Lettuc...</td>
      <td>Follow a regular exercise schedule. Adhere to ...</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>Male</td>
      <td>18</td>
      <td>1.68</td>
      <td>47.5</td>
      <td>Yes</td>
      <td>No</td>
      <td>16.83</td>
      <td>Underweight</td>
      <td>Weight Gain</td>
      <td>Muscular Fitness</td>
      <td>Squats, deadlifts, bench presses, and overhead...</td>
      <td>Light athletic shoes, resistance bands, and li...</td>
      <td>Vegetables: (Tomatoes, Garlic, leafy greens, b...</td>
      <td>Follow a regular exercise schedule. Adhere to ...</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>Male</td>
      <td>18</td>
      <td>1.68</td>
      <td>47.5</td>
      <td>No</td>
      <td>Yes</td>
      <td>16.83</td>
      <td>Underweight</td>
      <td>Weight Gain</td>
      <td>Muscular Fitness</td>
      <td>Squats, yoga, deadlifts, bench presses, and ov...</td>
      <td>Dumbbells, barbells and Blood glucose monitor</td>
      <td>Vegetables: (Garlic, Roma Tomatoes, Capers and...</td>
      <td>Follow a regular exercise schedule. Adhere to ...</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>Male</td>
      <td>18</td>
      <td>1.68</td>
      <td>47.5</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>16.83</td>
      <td>Underweight</td>
      <td>Weight Gain</td>
      <td>Muscular Fitness</td>
      <td>Squats, yoga, deadlifts, bench presses, and ov...</td>
      <td>Light athletic shoes, resistance bands, light ...</td>
      <td>Vegetables: (Garlic, Roma Tomatoes, Capers, Gr...</td>
      <td>Follow a regular exercise schedule. Adhere to ...</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>Male</td>
      <td>18</td>
      <td>1.68</td>
      <td>47.5</td>
      <td>No</td>
      <td>No</td>
      <td>16.83</td>
      <td>Underweight</td>
      <td>Weight Gain</td>
      <td>Muscular Fitness</td>
      <td>Squats, deadlifts, bench presses, and overhead...</td>
      <td>Dumbbells and barbells</td>
      <td>Vegetables: (Carrots, Sweet Potato, Lettuce); ...</td>
      <td>Follow a regular exercise schedule. Adhere to ...</td>
    </tr>
  </tbody>
</table>
</div>




```python
data.columns
```




    Index(['ID', 'Sex', 'Age', 'Height', 'Weight', 'Hypertension', 'Diabetes',
           'BMI', 'Level', 'Fitness Goal', 'Fitness Type', 'Exercises',
           'Equipment', 'Diet', 'Recommendation'],
          dtype='object')



We don't need ID column, therefore just drop the columsn


```python
data.drop(columns = "ID", inplace = True)
```




```python
data.sample(3)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Sex</th>
      <th>Age</th>
      <th>Height</th>
      <th>Weight</th>
      <th>Hypertension</th>
      <th>Diabetes</th>
      <th>BMI</th>
      <th>Level</th>
      <th>Fitness Goal</th>
      <th>Fitness Type</th>
      <th>Exercises</th>
      <th>Equipment</th>
      <th>Diet</th>
      <th>Recommendation</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>9093</th>
      <td>Female</td>
      <td>41</td>
      <td>1.76</td>
      <td>45.5</td>
      <td>Yes</td>
      <td>No</td>
      <td>14.69</td>
      <td>Underweight</td>
      <td>Weight Gain</td>
      <td>Muscular Fitness</td>
      <td>Squats, deadlifts, bench presses, and overhead...</td>
      <td>Light athletic shoes, resistance bands, and li...</td>
      <td>Vegetables: (Tomatoes, Garlic, leafy greens, b...</td>
      <td>Follow a regular exercise schedule. Adhere to ...</td>
    </tr>
    <tr>
      <th>9079</th>
      <td>Female</td>
      <td>40</td>
      <td>1.77</td>
      <td>86.0</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>27.45</td>
      <td>Overweight</td>
      <td>Weight Loss</td>
      <td>Cardio Fitness</td>
      <td>brisk walking, cycling, swimming, or dancing.</td>
      <td>Kettlebell, Dumbbells, Yoga Mat, Treadmill</td>
      <td>Vegetables: (Garlic, Mushroom, Green Papper, I...</td>
      <td>Follow a regular exercise schedule. Adhere to ...</td>
    </tr>
    <tr>
      <th>740</th>
      <td>Female</td>
      <td>41</td>
      <td>1.70</td>
      <td>48.0</td>
      <td>No</td>
      <td>No</td>
      <td>16.61</td>
      <td>Underweight</td>
      <td>Weight Gain</td>
      <td>Muscular Fitness</td>
      <td>Squats, deadlifts, bench presses, and overhead...</td>
      <td>Dumbbells and barbells</td>
      <td>Vegetables: (Carrots, Sweet Potato, Lettuce); ...</td>
      <td>Follow a regular exercise schedule. Adhere to ...</td>
    </tr>
  </tbody>
</table>
</div>




```python
data.shape
```




    (14589, 14)



## Step2: Label Encoding

there are several categorical data in this dataset, we have to make them as numerical data for calculation


```python
from sklearn.preprocessing import LabelEncoder

le = LabelEncoder()

for col in ['Sex', 'Hypertension', 'Diabetes', 'Fitness Goal', 'Fitness Type']:
    data[col] = le.fit_transform(data[col])
```

Lets see how the categorical data is converted to numerical values


```python
data.head(3)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Sex</th>
      <th>Age</th>
      <th>Height</th>
      <th>Weight</th>
      <th>Hypertension</th>
      <th>Diabetes</th>
      <th>BMI</th>
      <th>Level</th>
      <th>Fitness Goal</th>
      <th>Fitness Type</th>
      <th>Exercises</th>
      <th>Equipment</th>
      <th>Diet</th>
      <th>Recommendation</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>18</td>
      <td>1.68</td>
      <td>47.5</td>
      <td>0</td>
      <td>0</td>
      <td>16.83</td>
      <td>Underweight</td>
      <td>0</td>
      <td>1</td>
      <td>Squats, deadlifts, bench presses, and overhead...</td>
      <td>Dumbbells and barbells</td>
      <td>Vegetables: (Carrots, Sweet Potato, and Lettuc...</td>
      <td>Follow a regular exercise schedule. Adhere to ...</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>18</td>
      <td>1.68</td>
      <td>47.5</td>
      <td>1</td>
      <td>0</td>
      <td>16.83</td>
      <td>Underweight</td>
      <td>0</td>
      <td>1</td>
      <td>Squats, deadlifts, bench presses, and overhead...</td>
      <td>Light athletic shoes, resistance bands, and li...</td>
      <td>Vegetables: (Tomatoes, Garlic, leafy greens, b...</td>
      <td>Follow a regular exercise schedule. Adhere to ...</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1</td>
      <td>18</td>
      <td>1.68</td>
      <td>47.5</td>
      <td>0</td>
      <td>1</td>
      <td>16.83</td>
      <td>Underweight</td>
      <td>0</td>
      <td>1</td>
      <td>Squats, yoga, deadlifts, bench presses, and ov...</td>
      <td>Dumbbells, barbells and Blood glucose monitor</td>
      <td>Vegetables: (Garlic, Roma Tomatoes, Capers and...</td>
      <td>Follow a regular exercise schedule. Adhere to ...</td>
    </tr>
  </tbody>
</table>
</div>



the columns Exercises,Equipment, Diet, Recommendation are left to categorical columns only because, they are not used as a input to the model,  they are only used for recommendation part

## Step3: Normalization


```python
data.describe()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Sex</th>
      <th>Age</th>
      <th>Height</th>
      <th>Weight</th>
      <th>Hypertension</th>
      <th>Diabetes</th>
      <th>BMI</th>
      <th>Fitness Goal</th>
      <th>Fitness Type</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>count</th>
      <td>14589.000000</td>
      <td>14589.000000</td>
      <td>14589.000000</td>
      <td>14589.000000</td>
      <td>14589.000000</td>
      <td>14589.000000</td>
      <td>14589.000000</td>
      <td>14589.000000</td>
      <td>14589.000000</td>
    </tr>
    <tr>
      <th>mean</th>
      <td>0.642539</td>
      <td>39.554870</td>
      <td>1.699851</td>
      <td>70.505991</td>
      <td>0.462746</td>
      <td>0.462746</td>
      <td>24.417569</td>
      <td>0.519638</td>
      <td>0.480362</td>
    </tr>
    <tr>
      <th>std</th>
      <td>0.479269</td>
      <td>13.192655</td>
      <td>0.098129</td>
      <td>20.030635</td>
      <td>0.498627</td>
      <td>0.498627</td>
      <td>6.765144</td>
      <td>0.499631</td>
      <td>0.499631</td>
    </tr>
    <tr>
      <th>min</th>
      <td>0.000000</td>
      <td>18.000000</td>
      <td>1.300000</td>
      <td>32.000000</td>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>9.520000</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <th>25%</th>
      <td>0.000000</td>
      <td>28.000000</td>
      <td>1.640000</td>
      <td>55.000000</td>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>18.940000</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <th>50%</th>
      <td>1.000000</td>
      <td>39.000000</td>
      <td>1.680000</td>
      <td>70.000000</td>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>25.250000</td>
      <td>1.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <th>75%</th>
      <td>1.000000</td>
      <td>51.000000</td>
      <td>1.770000</td>
      <td>86.000000</td>
      <td>1.000000</td>
      <td>1.000000</td>
      <td>29.320000</td>
      <td>1.000000</td>
      <td>1.000000</td>
    </tr>
    <tr>
      <th>max</th>
      <td>1.000000</td>
      <td>63.000000</td>
      <td>2.030000</td>
      <td>130.000000</td>
      <td>1.000000</td>
      <td>1.000000</td>
      <td>70.000000</td>
      <td>1.000000</td>
      <td>1.000000</td>
    </tr>
  </tbody>
</table>
</div>




```python
from sklearn.preprocessing import StandardScaler

scaler = StandardScaler()
data[['Age', 'Height', 'Weight','BMI']] = scaler.fit_transform(data[['Age', 'Height', 'Weight','BMI']])
```

The normalized data looks like this


```python
data.head(3)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Sex</th>
      <th>Age</th>
      <th>Height</th>
      <th>Weight</th>
      <th>Hypertension</th>
      <th>Diabetes</th>
      <th>BMI</th>
      <th>Level</th>
      <th>Fitness Goal</th>
      <th>Fitness Type</th>
      <th>Exercises</th>
      <th>Equipment</th>
      <th>Diet</th>
      <th>Recommendation</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>-1.63391</td>
      <td>-0.202298</td>
      <td>-1.14858</td>
      <td>0</td>
      <td>0</td>
      <td>-1.121606</td>
      <td>Underweight</td>
      <td>0</td>
      <td>1</td>
      <td>Squats, deadlifts, bench presses, and overhead...</td>
      <td>Dumbbells and barbells</td>
      <td>Vegetables: (Carrots, Sweet Potato, and Lettuc...</td>
      <td>Follow a regular exercise schedule. Adhere to ...</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>-1.63391</td>
      <td>-0.202298</td>
      <td>-1.14858</td>
      <td>1</td>
      <td>0</td>
      <td>-1.121606</td>
      <td>Underweight</td>
      <td>0</td>
      <td>1</td>
      <td>Squats, deadlifts, bench presses, and overhead...</td>
      <td>Light athletic shoes, resistance bands, and li...</td>
      <td>Vegetables: (Tomatoes, Garlic, leafy greens, b...</td>
      <td>Follow a regular exercise schedule. Adhere to ...</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1</td>
      <td>-1.63391</td>
      <td>-0.202298</td>
      <td>-1.14858</td>
      <td>0</td>
      <td>1</td>
      <td>-1.121606</td>
      <td>Underweight</td>
      <td>0</td>
      <td>1</td>
      <td>Squats, yoga, deadlifts, bench presses, and ov...</td>
      <td>Dumbbells, barbells and Blood glucose monitor</td>
      <td>Vegetables: (Garlic, Roma Tomatoes, Capers and...</td>
      <td>Follow a regular exercise schedule. Adhere to ...</td>
    </tr>
  </tbody>
</table>
</div>



## Step4: Recommendation, Feedback, Evaluation


```python
import pandas as pd
import numpy as np
from sklearn.preprocessing import LabelEncoder, StandardScaler
from sklearn.metrics.pairwise import cosine_similarity
```


```python
def get_recommendation(top_n = 3):
    print("Please enter your details for personalised workout and diet plan for recommendation ")
    user_input = {
        'Sex': int(input("Enter Sex (Male : 1/Female : 0): ")),
        'Age': float(input("Enter Age: ")),
        'Height': float(input("Enter Height in meters (e.g., 1.75): ")),
        'Weight': float(input("Enter Weight in kg: ")),
        'Hypertension': int(input("Do you have Hypertension (Yes : 1/No : 0): ")),
        'Diabetes': int(input("Do you have Diabetes (Yes : 1/No : 0): ")),
        'BMI': float(input("Enter BMI: ")),
        'Level': int(input("Enter Level (Underweight : 3, Normal : 0, Overweight : 2, Obese : 1): ")),
        'Fitness Goal': int(input("Enter Fitness Goal (Weight Gain : 0, Weight Loss : 1): ")),
        'Fitness Type': int(input("Enter Fitness Type (Muscular Fitness : 1, Cardio Fitness : 0): "))
    }

    # Normalise the inputs
    num_features = ['Age', 'Height', 'Weight','BMI']
    user_df = pd.DataFrame(user_input, columns = num_features)

    user_df[num_features] = scaler.transform(user_df[num_features])

    user_input.update(user_df.iloc[0].to_dict())
    user_df.pd.DataFrame([user_input])

    # Calculate similarity scores
    user_features = data[['Sex', 'Age', 'Height', 'Weight', 'Hypertension','Diabetes', 'BMI', 'Level', 'Fitness Goal', 'Fitness Type']]

    sim_scores = cosine_similarity(user_features, user_df).flatten()

    # Retrive Top similar users and get the first recommendation
    similar_user_indices = sim_scores.argsort()[-5:][::-1]
    similar_users = data.iloc[similar_user_indices]

    recommendation_1 = similar_users[['Exercises','Diet','Equipment']].mod().iloc[0]

    # Stimulate 2 additional recommendation y modifying user input slightly
    stimulated_recommendation = []
    for _ in range(2):
        modfied_input = user_input.copy()
        # Randomly adjusting columns age, weight, BMI with larger variation
        modified_input['Age'] += random.randint(-5, 5)
        modified_input['Wright'] += random.randint(-5, 5)
        modified_input['BMI'] += random.randint(-1, 1)

        # Normalise the modified inputs
        modified_user_df = pd.DataFrame([modified_input], columns=num_features)
        modified_user_df[num_features] = scaler.transform(modified_user_df[num_features])
        modfied_input.update(modified_user_df.iloc[0].to_dict())

        # Calculating similarity scores for modified Input
        modified_sim_scores = cosine_similarity(user_features, pd.DataFrame([modified_input])).flatten()
        modified_sim_user_indices = modified_sim_scores.argsort()[-5:][::-1]
        modified_sim_users = data.iloc[modified_sim_user_indices]

        recommendation = modified_sim_users[['Exercises','Diet','Equipment']].mode().iloc[0]

        # Check if the recommendation is already in stimulated rec
        if not any(rec['Exercises'] == recommendation['Exercises'] and rec['Diet'] == recommendation['Diet'] and rec['Equipment'] == recommendation['Equipment'] for rec in simulated_recommendations):
            simulated_recommendations.append(recommendation)

     # Display all recommendations
        print("\nRecommended Workout and Diet Plans based on your input:")
        print("\nRecommendation 1 (Exact match):")
        print("EXERCISES:", recommendation_1['Exercises'])
        print("EQUIPMENTS:", recommendation_1['Equipment'])
        print("DIET:", recommendation_1['Diet'])

    for idx, rec in enumerate(simulated_recommendations, start=2):
            print(f"\nRecommendation {idx} (Slight variation):")
            print("EXERCISES:", rec['Exercises'])
            print("EQUIPMENTS:", rec['Equipment'])
            print("DIET:", rec['Diet'])

    # Collecet feedback for each recommendation
    feedback_matrix = []
    for i in range(len(stimulated_recommendation0 + 1)):
        feedback = int(input("Was recommendation i+1 relevant? (if Yes: 1, No: 0): "))
        feedback_matrix.append(feedback)

    # Calculate mean reciprocle rank (MRR)
    relevant_indices = [i + 1 for i, feedback in enumerate(feedback_matrix) if feedback == 1]
    if relevant_idices:
        mrr = np.mean([1/rank for rank in relevant_indices])
    else:
        mrr = 0.0
    print(f"\n Mean Reciprocal Rank(MRR): {mrr:.2f}")
    return [recommendation_1] + stimulated_recommendations

# Get the recommendation
recommendations = get_recommendation(top_n = 3)
```


```python

```
