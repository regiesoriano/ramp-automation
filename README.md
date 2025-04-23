Python version
RF will work for python 2.x but it is recommended to use 3.x. For this project, your python version should be minimum of python 3.x

Install all dependencies first.
pip install -r requirements.txt

To execute all scripts contained in robot files:
robot -v env:<environment> <path to robot file in test>

example: robot -v env:STAGING tests/.

To execute by tag contained in the directory:
robot -v env:<environment> -i <tag> <path to robot file in test>

example: robot -v env:STAGING -i sanity tests/.