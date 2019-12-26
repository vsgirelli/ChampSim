#!/bin/bash
#SBATCH --time=24:00:00
#SBATCH --partition=draco
#SBATCH --exclude=draco5


printf "\t Running on $SLURM_JOB_NODELIST \n\n"
date

app=$1
machine=$2

date=`date +"%m-%d-%y.%H:%M:%S"`

# necessário arrumar o meu working dir no SCRATCH
rm -rf $SCRATCH/ChampSim/
cp -r $HOME/ChampSim/ $SCRATCH
cd $SCRATCH/ChampSim/

./run_champsim.sh $machine 50000000 200000000 $app

cp -r ./results_200000000M $HOME/ChampSim/
date

