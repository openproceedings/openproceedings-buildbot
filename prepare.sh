if [ ${TRAVIS_PYTHON_VERSION:0:1} == "2" ]; then wget http://repo.continuum.io/miniconda/Miniconda-2.0.0-Linux-x86_64.sh -O miniconda.sh; else wget http://repo.continuum.io/miniconda/Miniconda3-2.0.0-Linux-x86_64.sh -O miniconda.sh; fi
chmod +x miniconda.sh
./miniconda.sh -b
export PATH=/home/travis/anaconda/bin:$PATH
sudo apt-get install -y libjpeg8 libjpeg8-dev libfreetype6 libfreetype6-dev zlib1g-dev
sudo ln -s /usr/lib/`uname -i`-linux-gnu/libjpeg.so.8 ~/virtualenv/python2.7/lib/
sudo ln -s /usr/lib/`uname -i`-linux-gnu/libfreetype.so ~/virtualenv/python2.7/lib/
sudo ln -s /usr/lib/`uname -i`-linux-gnu/libz.so ~/virtualenv/python2.7/lib/
conda install --yes python=$TRAVIS_PYTHON_VERSION Markdown requests
pip install --no-index -f http://dist.plone.org/thirdparty/ -U PIL
pip install fabric requests_oauthlib rst2pdf pelican 
