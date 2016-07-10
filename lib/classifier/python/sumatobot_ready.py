from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.feature_extraction import DictVectorizer
from sklearn.ensemble import GradientBoostingClassifier
from scipy.sparse import hstack
from sklearn.linear_model import Ridge
import pandas
import numpy as np
import sys
import pickle
import os

def prepare_data(data, dict_enc, tv, train=False):
  # Prepare data
  lowercase = np.vectorize(lambda x: x.lower() if (type(x) is str) else '')
  data["text"] = data["text"].replace('[^a-zA-Z0-9]', ' ', regex=True)
  full_description = lowercase(data["text"])

  # Text vectorisation
  if train:
    x_full_description = tv.fit_transform(full_description)
  else:
    x_full_description = tv.transform(full_description)

  # Populate empty fields with some data
  # data['class'].fillna('nan', inplace=True)

  # Use for categorised or dictionary values
  # if train:
  #   x_categ = dict_enc.fit_transform(data[['LocationNormalized', 'ContractTime']].to_dict('records'))
  # else:
  #   x_categ = dict_enc.transform(data_test[['LocationNormalized', 'ContractTime']].to_dict('records'))
  # Make ready matrix using scipy.sparse
  # return hstack([x_full_description, x_categ])
  return x_full_description

# data_train = pandas.read_csv('mltext_min_min.csv')

# y = data_train["class"].values

# tv = TfidfVectorizer(min_df=5)
# enc = DictVectorizer()

# X = prepare_data(data_train, enc, tv, True)

# # Regression itself
# # clf = Ridge(alpha=1, random_state=241)
# clf = GradientBoostingClassifier(n_estimators=250, verbose=True, random_state=241, learning_rate=0.2)
# clf.fit(X, y)
clf = pickle.load(open('{0}/clf.txt'.format(os.environ['PYTHON_FILE_PATH']), 'r'))
tv = pickle.load(open('{0}/tv.txt'.format(os.environ['PYTHON_FILE_PATH']), 'r'))
enc = pickle.load(open('{0}/enc.txt'.format(os.environ['PYTHON_FILE_PATH']), 'r'))

# data_test = pandas.read_csv('bot_train.csv')
print sys.argv[1]
data_test = pandas.DataFrame(data=np.array([sys.argv[1]]), columns=np.array(["text"]))

X_test = prepare_data(data_test, enc, tv)
print clf.predict(X_test.toarray())
