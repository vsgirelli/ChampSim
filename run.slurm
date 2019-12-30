#!/bin/bash
#SBATCH --time=24:00:00
#SBATCH --partition=draco
#SBATCH --exclude=draco5


printf "\t Running on $SLURM_JOB_NODELIST \n\n"
date

app=$1
machine=$2

# necessário arrumar o meu working dir no SCRATCH
rm -rf $SCRATCH/ChampSim/
cp -r $HOME/ChampSim/ $SCRATCH
cd $SCRATCH/ChampSim/

./run_champsim.sh $machine 50 200 $app

cp -r ./results_200M $HOME/ChampSim/
date

