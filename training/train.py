from random import randint
from sklearn.linear_model import LinearRegression
import pickle
import json


def train():
    #modify "training/data.json" to your input path in s3 where your data is stored. Here data is stored under training prefix with the key data.json. Donot change rest of the path
    #with open('/opt/ml/input/data/training/data.json', 'r') as openfile:
    with open('/opt/ml/training/data.json', 'r') as openfile:
        # Reading from json file
        json_object = json.load(openfile)
    predictor = LinearRegression(n_jobs=-1)
    predictor.fit(X=json_object["input"], y=json_object["output"])
    #change "model.pkl" according to your model artifact. Donot change rest of the path
    pickle.dump(predictor, open('/opt/ml/model/model.pkl','wb'))
    #pickle.dump(predictor, open('./model.pkl','wb'))

if __name__ == '__main__':
    train()
