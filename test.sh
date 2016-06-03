for i in `seq 0 8192`
do
  if [[ $((i % 64)) -eq 0 ]]
  then
    echo -ne "\n$i: "
  fi
  dd if=/dev/zero of=padding.bin bs=1 count=$i >/dev/null 2>&1
  make >/dev/null || echo make filed
  ./1 && ./2 && ./3 2>/dev/null && echo -n '.' || { echo -n '*'; }
done
