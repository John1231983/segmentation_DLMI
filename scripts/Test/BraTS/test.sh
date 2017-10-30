#!/usr/bin/env bash

for i in "$@"
do
case $i in
    -p=*|--params=*)
    PARAMS="${i#*=}"
    shift # past argument=value
    ;;
    *)
            # unknown option
    ;;
esac
done

if [ "${PARAMS}" = "params_mask"  ]
    then
    srun -p fast --gres=gpu:1  --pty  --mem=8G  python test_mask.py -p"${PARAMS}"

elif [ "${PARAMS}" = "params_train"  ]
    then
    srun -p fast --gres=gpu:1  --pty  --mem=8G  python test.py -p"${PARAMS}"

elif [ "${PARAMS}" = "params_mask_seg"  ]
    then
    srun -p fast --gres=gpu:1  --pty  --mem=8G  python test_mask_seg.py -p"${PARAMS}"

else
    echo 'ERROR in "test.sh"'
    echo 'Please, specify a valid parameter filename'
fi