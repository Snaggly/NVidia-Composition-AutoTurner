#!/bin/bash
if [ -z $1 ]
then
    echo 'No Input provided!'
    echo 'Use -h or --help to see Arguments'
    exit
fi

if [ $1 == '-h' ] || [ $1 == '--help' ]
then
    echo '"./NVidiaFCP.sh Off" to disable CompositionPipline alltogether'
    echo '"./NVidiaFCP.sh On" to enable ForceCompositionPipeline on all monitors'
    echo '"./NVidiaFCP.sh On Full" to enable ForceFullCompositionPipeline on all monitors'
    exit
fi

META=$(nvidia-settings --query CurrentMetaMode)
META="${META##*::}"

if [ $1 == 'On' ]
then
    if [ ! -z $2 ] && [ $2 == 'Full' ]
    then
        if [[ $META == *"ForceFullCompositionPipeline=On"* ]]
        then
            echo "ForceFullCompositionPipeline is already on!"
            exit
        else
            TMPMETA=""
            for str in ${META//\}/, ForceCompositionPipeline=On, ForceFullCompositionPipeline=On\}} 
            do
                TMPMETA="$TMPMETA $str"
            done
            META=$TMPMETA
        fi
    elif [[ $META == *"ForceCompositionPipeline=On"* ]]
    then
        echo "ForceCompositionPipeline is already on!"
        exit
    else
        TMPMETA=""
        for str in ${META//\}/, ForceCompositionPipeline=On\}} 
        do
            TMPMETA="$TMPMETA $str"
        done
        META=$TMPMETA
    fi
elif [ $1 == 'Off' ]
then
    if [[ $META != *"CompositionPipeline=On"* ]]
    then
        echo 'CompositionPipline is already off!'
        exit
    fi
    META="${META//On/$1}"
else
    echo 'Wrong input!'
    echo 'Needs "On" or "Off" as input parameter'
    exit
fi
nvidia-settings --assign CurrentMetaMode="$META"