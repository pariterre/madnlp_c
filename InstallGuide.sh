#!\usr\bash

# Precompiling actions
conda install python swig cmake fortran-compiler -cconda-forge  # Install the required dependencies
NB_CPU=`cat /proc/cpuinfo | grep processor | wc -l`  # Get the number of CPU


# MOVING TO MADNLP ROOT_FOLDER (AUTOMATIC WITH WITH_MOCKUP_MADNLP)

# Install julia
wget https://julialang-s3.julialang.org/bin/linux/x64/1.10/julia-1.10.4-linux-x86_64.tar.gz
tar zxvf julia-1.10.4-linux-x86_64.tar.gz
export PATH="$PATH:`pwd`/julia-1.10.4/bin"

# Move to a proper compile folder
mkdir build
cd build

# Compile and install
cmake .. \
  -DCMAKE_BUILD_TYPE="Release" \
  -DCMAKE_INSTALL_PREFIX="$CONDA_PREFIX"
make -j$NB_CPU install
# LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$MADNLP_LIB_PATH"



# MOVING TO CASADI ROOT_FOLDER

# Move to a proper compile folder
mkdir build
cd build


