# -*- coding: utf-8 -*-
"""
Created on Thu Jan  6 20:08:04 2022

@author: Xiaowei_Wang
"""

import numpy as np
import pandas as pd
from matplotlib import pyplot as plt

from sklearn.model_selection import train_test_split
from sklearn import preprocessing                    
import tensorflow as tf
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense
from tensorflow.keras.activations import relu
from sklearn.metrics import mean_squared_error
from keras import backend as K
from tensorflow import keras
from tensorflow.keras import layers
from sklearn.model_selection import StratifiedKFold

import warnings
warnings.simplefilter(action='ignore', category=FutureWarning)

# read the data and print the first five rows
data = pd.read_excel('Database_20220111.xlsx',skiprows= 1, usecols = 'B:N', sheet_name= 0)
data.head()

# X - features
X = data.values[:,:-5]
# Y - target values
Y = data.values[:,-5:]
print(X.shape,Y.shape)

# normalize X & Y data via MinMaxScaler()
from sklearn.preprocessing import StandardScaler
from sklearn.preprocessing import MinMaxScaler
sc_X = MinMaxScaler()
sc_Y1 = MinMaxScaler()
sc_Y2 = MinMaxScaler()
sc_Y3 = MinMaxScaler()
sc_Y4 = MinMaxScaler()
x_norm = sc_X.fit_transform(X)
#y_norm0 = sc_Y0.fit_transform(Y[:,0].reshape(-1,1))
y_norm1 = sc_Y1.fit_transform(Y[:,1].reshape(-1,1))
y_norm2 = sc_Y2.fit_transform(Y[:,2].reshape(-1,1))
y_norm3 = sc_Y3.fit_transform(Y[:,3].reshape(-1,1))
y_norm4 = sc_Y4.fit_transform(Y[:,4].reshape(-1,1))
y_norm = np.concatenate((y_norm1,y_norm2,y_norm3,y_norm4),axis=1)
# y_norm = sc_Y.fit_transform(Y)
X_train, X_test, y_train, y_test = train_test_split(x_norm,y_norm,test_size=0.30)
print(X_train.shape,y_train.shape,X_test.shape,y_test.shape)

# This returns a multi-layer-perceptron model in Keras.
from sklearn.model_selection import KFold

def keras_model(num_hidden_layers, 
                    num_neurons_per_layer, 
                    dropout_rate, 
                    activation):
    # create the MLP model.
    
    # define the layers.
    inputs = keras.Input(shape=(X_train.shape[1],))  # input layer.
    x = layers.Dropout(dropout_rate)(inputs) # dropout on the weights.
    
    # Add the hidden layers.
    for i in range(num_hidden_layers):
        x = layers.Dense(num_neurons_per_layer, 
                         activation=activation)(x)
        x = layers.Dropout(dropout_rate)(x)
    
    # output layer.
    outputs = layers.Dense(4, activation='linear')(x)
    
    model = keras.Model(inputs=inputs, outputs=outputs)
    optimizer = 'adam'
    model.compile(optimizer=optimizer,
                  loss=tf.keras.losses.MeanSquaredError(),
                  metrics=['mse'])
    return model

# optimized model uncertainty
from IPython.display import display
import os

y1_train = sc_Y1.inverse_transform(y_train[:,0].reshape(-1,1))
y2_train = sc_Y2.inverse_transform(y_train[:,1].reshape(-1,1))
y3_train = sc_Y3.inverse_transform(y_train[:,2].reshape(-1,1))
y4_train = sc_Y4.inverse_transform(y_train[:,3].reshape(-1,1))

y1_test = sc_Y1.inverse_transform(y_test[:,0].reshape(-1,1))
y2_test = sc_Y2.inverse_transform(y_test[:,1].reshape(-1,1))
y3_test = sc_Y3.inverse_transform(y_test[:,2].reshape(-1,1))
y4_test = sc_Y4.inverse_transform(y_test[:,3].reshape(-1,1))

ytrain_true = np.column_stack((y1_train,y2_train,y3_train,y4_train))
ytest_true = np.column_stack((y1_test,y2_test,y3_test,y4_test))

# ======== new application
dataApp = pd.read_excel('D1.6m_20220111.xlsx',skiprows= 1, usecols = 'B:N', sheet_name= 0)
dataApp.head()

# X data for application
Xapp = dataApp.values[:,:-5]

# Y data from physics-based moment-curvature analyses [four curvature indices]
Yapp = dataApp.values[:,-4:]
print(Xapp.shape, Yapp.shape)

number_of_layer = 2
number_of_neuron = 12
trial = 100 # maximal 100
for i in range(trial):
  model = keras_model(number_of_layer,number_of_neuron, 0.0, 'tanh')
  model.fit(X_train, y_train,
            validation_split=0.2,
            epochs=21,
            verbose=0,
            )
  yApp_pred = model.predict(Xapp)

  y1App_pred = sc_Y1.inverse_transform(yApp_pred[:,0].reshape(-1,1))
  y2App_pred = sc_Y2.inverse_transform(yApp_pred[:,1].reshape(-1,1))
  y3App_pred = sc_Y3.inverse_transform(yApp_pred[:,2].reshape(-1,1))
  y4App_pred = sc_Y4.inverse_transform(yApp_pred[:,3].reshape(-1,1))
  
  yApp_pred_true = np.column_stack((y1App_pred,y2App_pred,y3App_pred,y4App_pred))
  yApp_comparison = np.column_stack((Yapp,yApp_pred_true))

  print("Current Trial of Data-Driven Model Application:",i)
  if i < 10:
    np.savetxt('100/yApp_0{}.csv'.format(i),yApp_comparison,delimiter=",")
  else:
    np.savetxt('100/yApp_{}.csv'.format(i),yApp_comparison,delimiter=",")