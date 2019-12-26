#!/usr/bin/env bash

set -o errexit -o nounset -o pipefail -o posix

machines=(bimodal-no-no-no-no-lru-1core hashed_perceptron-next_line-next_line-kpcp-next_line-drrip-1core bimodal-next_line-next_line-ip_stride-no-lru-1core)

apps=(401.bzip2-38B.champsimtrace.xz 403.gcc-48B.champsimtrace.xz 453.povray-252B.champsimtrace.xz 454.calculix-104B.champsimtrace.xz 473.astar-42B.champsimtrace.xz)

for machine in "${machines[@]}"; do
  for app in "${apps[@]}"; do
    sbatch --error="slurm/%j_$app.$machine.err" --output="slurm/%j_$app.$machine.out" -J "$app.$mahcine" run.slurm $app $machine
  done
done
