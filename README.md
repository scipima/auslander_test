# auslander_test
This repo seeks to extract tables from old scanned pdf.
More precisely, we take [German official statistics](https://www.statistischebibliothek.de/mir/receive/DESerie_mods_00000018) on immigrants' residence, which are recorded in weirdly formatted tables scanned in pdf, and seek to extract tidy tables out of them. 

As a test, we grab data relative to [1987](https://www.statistischebibliothek.de/mir/receive/DEHeft_mods_00132640) and [1991](https://www.statistischebibliothek.de/mir/receive/DEHeft_mods_00132641). 


## Prep steps
To check that we have CUDA correctly installed on Debian, we follow the tips here [How to install PyTorch on Ubuntu 22.04 with Nvidia graphics card](https://www.youtube.com/watch?v=c0Z_ItwzT5o), and here [How to install CUDA on UBUNTU(Linux) | CUDA installation in 2024](https://www.youtube.com/watch?v=8i3BiWa5AZ4).

Check that you have Python installed.
```
python3 --version
```

Check that you have pip installed (package manager for Python).
```
pip3 --version
# sudo apt install python3-pip
```

To dowload the CUDA Toolkit, you have to to go the [webpage](https://developer.nvidia.com/) and select the various options.



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

