export SCRATCH_HOME=/scratch/ericlove

# Only save original PATH value once per shell session
if [ -z "$LINMIL_ORIG_PATH" ]; then
  export LINMIL_ORIG_PATH=$PATH
fi

echo EXCUTED LOCAL PROFILE

function linmil_set_path () {
  # Always start setting LOCAL_PATH with this line
  LOCAL_PATH=$SCRATCH_HOME/install/bin

  if [ -n "$RISCV_PATH" ]; then
    LOCAL_PATH=$RISCV_PATH/bin:$LOCAL_PATH
  fi

  if [ -z "$LINMIL_ORIG_PATH" ]; then
    export PATH=$LOCAL_PATH
  else
    export PATH=$LOCAL_PATH:$PATH
  fi
}

export CPATH=$SCRATCH_HOME/install/include

export LD_LIBRARY_PATH=$SCRATCH_HOME/install/lib:$SCRATCH_HOME/install/lib64

function cds () {
  cd $SCRATCH_HOME;
}

function use_riscv () {
  export RISCV_PATH=$SCRATCH_HOME/riscv
  linmil_set_path;
}

function no_riscv () {
  unset RISCV_PATH
  linmil_set_path;
}
