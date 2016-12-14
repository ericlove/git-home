export SCRATCH_HOME=/scratch/ericlove

# Only save original PATH value once per shell session
if [ -z "$LINMIL_ORIG_PATH" ]; then
  export LINMIL_ORIG_PATH=$PATH
fi

function linmil_set_path () {
  # Always start setting LOCAL_PATH with this line
  LOCAL_PATH=$SCRATCH_HOME/install/bin

  if [ -n "$RISCV" ]; then
    LOCAL_PATH=$RISCV/bin:$LOCAL_PATH
  fi

  if [ -z "$LINMIL_ORIG_PATH" ]; then
    export PATH=$LOCAL_PATH
  else
    export PATH=$LOCAL_PATH:$PATH
  fi
}

linmil_set_path;

export CPATH=$SCRATCH_HOME/install/include

export LD_LIBRARY_PATH=$SCRATCH_HOME/install/lib:$SCRATCH_HOME/install/lib64

function cds () {
  cd $SCRATCH_HOME;
}

function use_riscv () {
  export RISCV=$SCRATCH_HOME/install/riscv
  linmil_set_path;
}

function no_riscv () {
  unset RISCV
  linmil_set_path;
}
