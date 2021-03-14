#!/bin/bash

for ((i=1;i<=$#;i++));
do

    if [ ${!i} = "--uniqueid" ]
    then ((i++))
        uniqueid=${!i};

    elif [ ${!i} = "--source" ];
    then ((i++))
        source=${!i};

    elif [ ${!i} = "--destination" ];
    then ((i++))
        destination=${!i};
        userfield=`./assets/findcc.sh $destination`

    elif [ ${!i} = "--cliente" ];
    then ((i++))
        cliente=${!i};

    elif [ ${!i} = "--accountcode" ];
    then ((i++))
        accountcode=${!i};

    elif [ ${!i} = "--audio" ];
    then ((i++))
        audio=${!i};

    elif [ ${!i} = "--dstchannel" ];
           then ((i++))
                dstchannel=${!i};
                case ${dstchannel:0:9} in

                    SIP/vox01)
                      accountcode=1
                      ;;

                    SIP/vox02)
                      accountcode=2
                      ;;

                    SIP/ECU_GX)
                      accountcode=3
                      ;;

                    SIP/MP114)
                      accountcode=4
                      ;;

                    SIP/MP118)
                      accountcode=4
                      ;;

                    SIP/IPLAN)
                      accountcode=5
                      ;;

                    *)
                      accountcode=0
                    ;;
                  esac




    elif [ ${!i} = "--billsec" ];
    then ((i++))
        duracion=${!i};
    fi

done;

if [ -z "$1" ]
  then
   echo "No recivio ningun parametro!!";
   exit 1
fi


if [ ! -z "$userfield" ]
then
  echo "UPDATE cdr SET userfield = '$userfield', accountcode = '$accountcode' WHERE userfield = '' AND uniqueid='$uniqueid';" | mysql -uroot -ptelefonia2019 asteriskcdrdb;
fi

