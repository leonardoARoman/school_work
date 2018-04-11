import quandl

# api_key = open('EyZWqz4X3Zze8xdt8cQ-')
# quandl.get("Data", authtoken="API_key")
# df = quandl.get("ZILLOW/N68_LPCSSF", authtoken="EyZWqz4X3Zze8xdt8cQ-")
# print(df.tail())

#titani_train = pd.read_html('http://www.theus50.com/fastfacts/capital.php')
#print(titani_train[0])

import pandas as pd
import numpy as np
import matplotlib as plt


file = "/Users/leonardoroman/Desktop/data_science_projects/loan_prediction_prob/train_u6lujuX_CVtuZ9i.csv"
df1 = pd.read_csv(file) # work with original data #
df1['Self_Employed'].fillna('No', inplace=True)

table = df1.pivot_table(values='LoanAmount', index='Self_Employed' ,columns='Education', aggfunc=np.median)
# Define function to return value of this pivot_table
def fage(x):
    return table.loc[x['Self_Employed'],x['Education']]
# Replace missing values

df1['LoanAmount'].fillna(df1[df1['LoanAmount'].isnull()].apply(fage, axis=1), inplace=True)
table2 = df1.loc[df1['LoanAmount'], ['Self_Employed','Education', 'LoanAmount']]
df1.to_json("newLoanAmount_cleaned.json")
print (df1)
