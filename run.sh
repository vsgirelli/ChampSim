#!/usr/bin/env bash

set -o errexit -o nounset -o pipefail -o posix

# ./build_champsim.sh {branch_pred} {l1i_pref} {l1d_pref} {l2_pref} {llc_pref} {llc_replcmt} {cores}
#./build_champsim.sh bimodal no no no no lru 1
#./build_champsim.sh bimodal next_line next_line ip_stride no lru 1
#./build_champsim.sh hashed_perceptron next_line next_line kpcp next_line drrip 1
# our version of 2 next_line CODE prefetches at once
#./build_champsim.sh bimodal next_line2 next_line no no lru 1
./build_champsim.sh bimodal next_line next_line no no lru 1

#machines=(bimodal-no-no-no-no-lru-1core hashed_perceptron-next_line-next_line-kpcp-next_line-drrip-1core bimodal-next_line-next_line-ip_stride-no-lru-1core)
machines=(bimodal-next_line-next_line-no-no-lru-1core)

apps=(401.bzip2-38B.champsimtrace.xz 403.gcc-48B.champsimtrace.xz 453.povray-252B.champsimtrace.xz 454.calculix-460B.champsimtrace.xz 473.astar-42B.champsimtrace.xz)

for machine in "${machines[@]}"; do
  for app in "${apps[@]}"; do
    sbatch --error="slurm/%j_$app.$machine.err" --output="slurm/%j_$app.$machine.out" -J "$app.$machine" run.slurm $app $machine
  done
done
