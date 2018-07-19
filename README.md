Instructions:
```
mkdir work
cd work
git clone git@github.com:kpedro88/install-pheno.git
ln -s install-pheno/* .
./setup.sh -j 8 -L all -I all
source init.(c)sh
```

Setup script help:
```
Options:
-j [cores]              number of cores for make (default = 1)
-L [pkg1,pkg2,...]      packages to link from LCG (allowed = python,clhep,xercesc,boost,tbb,gdb,xrootd; or all)
-I [pkg1,pkg2,...]      packages to install from source (allowed = hepmc,pythia8,delphes; or all)
-D                      dry-run: show option values and exit
-d                      enable debug flags for compilation (when available)
-f                      force complete reinstallation (delete and recopy source directories)
-h                      show this message and exit
```
