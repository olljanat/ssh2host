#!/bin/shell

if [ -z "$USERNAME" ]
then
    USERNAME="root"
fi

NODES=(`docker node ls --format '{{.Hostname}}'`)

echo 'Please select which docker host you want to connect (or use to invalid number to disconnect):'
select NODE in "${NODES[@]}"; do
  case $NODE in
    *)
      if [ -z "$NODE" ]
      then
         exit
      fi
      /usr/bin/ssh -oStrictHostKeyChecking=no $USERNAME@$NODE
      exit
      ;;
  esac
done
