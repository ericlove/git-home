export PYTHONPATH=~/libinst
export LIBINST_QUILT_PACK="ericlove/cpuperf"
cd ~/dbbench; git pull
echo "import quilt; quilt.install(\"ericlove/cpuperf\")" | python
