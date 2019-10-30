#!/bin/bash


cat input.fa | while read L; do  echo $L; read L; echo "$L" | rev | tr "ATGC" "TACG" ; done
