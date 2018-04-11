import numpy as np
import pandas as pd
import nonvisuals as vs

in_file = 'titanic_data.csv'
full_data = pd.read_csv(in_file)

outcomes = full_data['Survived']
data = full_data.drop('Survived', axis = 1)

def accuracy_score(truth, pred):
    if len(truth) == len(pred):
        return "Predictions have an accuracy of {:.2f}%.".format((truth == pred).mean()*100)
    else:
        return "Number of predictions does not match number of outcomes!"

def prediction_0(data):
    predictions = []
    for _, passenger in data.iterrows():
        if passenger['Age'] <= 10:
            if np.isnan(passenger['Age']):
                print('nan append 1')
            predictions.append(1)
        else:
            if np.isnan(passenger['Age']):
                print('nan append 0')
            predictions.append(0)
    return pd.Series(predictions)
