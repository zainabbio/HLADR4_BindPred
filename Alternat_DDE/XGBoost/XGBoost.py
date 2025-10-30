import pandas as pd
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split
import scipy.io as sio
import numpy as np
from sklearn.preprocessing import scale
from xgboost import XGBClassifier as xgbc, XGBClassifier
from sklearn.svm import SVC
import lightgbm as lgb

import os

#datos = pd.read_csv('file.csv')

#Selected by using Gini decrease method
#X=datos[['ROBB760111','GEOR030106','GEOR030105','GEOR030104','WILM950103','PRAM820101','GEOR030101','TANS770109','RACS770101','TANS770106']]

#y = datos['PRED']


# Load and preprocess the data
#datos = sio.loadmat('RDR_aadp_pssm.mat')
#data = datos.get('RDR_aadp_pssm')


#train_esm1b_P = pd.read_csv('../Features/Feature_csv/HLA_main_pos_CPCR.csv')

#train_esm1b_N = pd.read_csv('../Features/Feature_csv/HLA_main_pos_CPCR.csv')

train_esm1b_P = pd.read_csv('alt-tr-pos_DDE.csv')

train_esm1b_N = pd.read_csv('alt-tr-neg_DDE.csv')

train_esm1b = np.row_stack((train_esm1b_P, train_esm1b_N))


[m1, n1] = np.shape(train_esm1b) 
label1 = np.ones((20240, 1))
label2 = np.zeros((138118, 1))
label = np.append(label1, label2)



# Standardized dataset
from sklearn.preprocessing import MinMaxScaler

scaler = MinMaxScaler()
scaler.fit(train_esm1b)

shu = scale(train_esm1b)



#shu = scale(train_esm1b)
#X = np.reshape(shu, (-1, 1, n1))
X = shu
y = label

# Divide the dataset
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)

print(X_train.shape)
print(X_test.shape)
print(y_train.shape)
print(y_test.shape)









#X_train, X_test, y_train, y_test = train_test_split(X, y, train_size=0.8, test_size=0.2)

from sklearn.model_selection import cross_validate
from sklearn.metrics import confusion_matrix





#lgb_estimator = lgb.CatBoostClassifier(boosting_type='gbdt',  objective='binary', num_boost_round=2000, learning_rate='learning_rate', metric='accurcay')


model  = xgbc().fit(X_train, y_train)





# Save model
import joblib
joblib.dump(model, 'XGBoostmodel.pkl')

#Cross-validation a fold =5
def confusion_matrix_scorer(clf, X_train, y_train):
        y_pred = clf.predict(X_train)
        cm = confusion_matrix(y_train, y_pred)
        return {'tn': cm[0, 0], 'fp': cm[0, 1],
                'fn': cm[1, 0], 'tp': cm[1, 1]}
        
cv_results = cross_validate(model, X_train, y_train, cv=5,
                            scoring=confusion_matrix_scorer)

# Getting the test set true positive scores
TP = cv_results['test_tp'].mean()

# Getting the test set false negative scores
FN = cv_results['test_fn'].mean()

# Getting the test set false positive scores
FP = cv_results['test_fp'].mean()

# Getting the test set true negative scores
TN = cv_results['test_tn'].mean()

####TRAINING###
acurracy = (TP+TN) / (TP+TN+FP+FN)
F1_score = 2*TP / ((2*TP) + (FP + FN))
precision = TP / (TP + FP)
specificity = TN / (FP + TN)
sensitivity_recall = TP / (TP + FN)

import math 

MCC = ((TP*TN) - (FP*FN)) / math.sqrt(((TP+FP)*(TP+FN))*((TN+FP)*(TN+FN)))





############AUC##########################

import utils.tools as utils
from sklearn.metrics import roc_auc_score, roc_curve, auc

# AUC for Training
y_train_pred_proba = model.predict_proba(X_train)[:, 1]  # Get probabilities for the positive class
auc_train = roc_auc_score(y_train, y_train_pred_proba)
print("Training AUC: ", auc_train)

# AUC for Testing
y_test_pred_proba = model.predict_proba(X_test)[:, 1]  # Get probabilities for the positive class
auc_test = roc_auc_score(y_test, y_test_pred_proba)
print("Testing AUC: ", auc_test)







print("Accuracy: ", acurracy)
print("F1_score: ", F1_score)
print("Precision: ", precision)
print("Specificity: ", specificity)
print("Sensitivity/Recall: ", sensitivity_recall)
print("MCC: ", MCC)


    ### --- ###




####TESTING###
from catboost import CatBoostClassifier
from sklearn.metrics import classification_report
pred_test=model.predict(X_test)

conf = confusion_matrix(y_test, pred_test)
TP = conf[1, 1]
FP = conf[0, 1]
TN = conf[0, 0]
FN = conf[1, 0]

acurracy = (TP+TN) / (TP+TN+FP+FN)
F1_score = 2*TP / ((2*TP) + (FP + FN))
precision = TP / (TP + FP)
specificity = TN / (FP + TN)
sensitivity_recall = TP / (TP + FN)

import math 
MCC = ((TP*TN) - (FP*FN)) / math.sqrt(((TP+FP)*(TP+FN))*((TN+FP)*(TN+FN)))

print("Accuracy: ", acurracy)
print("F1_score: ", F1_score)
print("Precision: ", precision)
print("Specificity: ", specificity)
print("Sensitivity/Recall: ", sensitivity_recall)
print("MCC: ", MCC)

