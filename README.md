# auslander_test
extracting tables from old scanned pdf


## venv
We follow the convention, `venv` folder is simply called `.venv`,
```
python3 -m venv .venv
source .venv/bin/activate   # activate it 
```

Check that `pip` is the latest version. 
```
pip install --upgrade pip
pip3 list
```

Then install all libraries.
Further, and following the guidance on how to render [Quarto documents in VS code](https://quarto.org/docs/get-started/hello/vscode.html), you may have to run this in the repo's folder.
```
python3 -m pip install jupyter matplotlib plotly
pip install pandas scipy statsmodels wquantiles seaborn
pip install nbformat nbclient
```

Create a list of all packages in the environment.
```
pip freeze > requirements.txt
```

