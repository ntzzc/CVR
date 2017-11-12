#!/bin/bash
#wget https://sparse.tamu.edu/MM/SNAP/web*Google.tar.gz
#tar xvf web*Google.tar.gz
#mv web*Google/web*Google.mtx ../dataset/
#rm *rf web*Google*

echo " ******************************************************************************************************************** "
echo " ******************************************************************************************************************** "
echo " ****************************           Running    CVR            *************************************************** "  
numactl --membind=1 ./bin/spmv.cvr ../dataset/web*Google.mtx 68 1000

echo " ******************************************************************************************************************** "
echo " ******************************************************************************************************************** "
echo " ****************************           Running    CSR5            *************************************************** "  
numactl --membind=1 ./bin/spmv.csr5 ../dataset/web*Google.mtx 204 1000

echo " ******************************************************************************************************************** "
echo " ******************************************************************************************************************** "
echo " ****************************           Running    VHCC            *************************************************** "  
numactl --membind=1 ./bin/spmv.vhcc ../dataset/web*Google.mtx 272 1000 1

echo " ******************************************************************************************************************** "
echo " ******************************************************************************************************************** "
echo " ****************************           Running    CSR-I           *************************************************** "  
numactl --membind=1 ./bin/spmv.csr ../dataset/web*Google.mtx 272 1000

echo " ******************************************************************************************************************** "
echo " ******************************************************************************************************************** "
echo " ****************************           Running    ESB            *************************************************** "  
numactl --membind=1 ./bin/spmv.esb ../dataset/web*Google.mtx 272 1000 3

echo " ******************************************************************************************************************** "
echo " ******************************************************************************************************************** "
echo " ****************************           Running    MKL            *************************************************** "  
numactl --membind=1 ./bin/spmv.mkl ../dataset/web*Google.mtx 272 1000
