import pandas as pd

df = pd.read_csv('ZILLOW-Z77006_ZRIFAH.csv')
print(df.head())

df.set_index('Date', inplace = True) # To make column Date our index value
df.to_csv('new_ZILLOW_dataset.csv') # .to_csv creates a new csv file
df.to_json('new_ZILLOW_dataset_as_JSON.json')
df2 = pd.read_csv('new_ZILLOW_dataset.csv',index_col = 0) # To drop the old index values
print(df2.head())

df2.columns = ['Austin_HP'] # To change the name of the column
print(df2.head())

# df.to_csv('new_ZILLOW_dataset.csv', header = False) # To get rid of the column names
