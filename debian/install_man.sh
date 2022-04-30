#!/bin/sh

cd man
  for i in *.scd
  do
    scdoc < "$i" > "$(basename "$i" .scd)".roff
  done
  
    for s in 1 5 7
    do
      install -d "../debian/greetd/usr/share/man/man$s"
      for i in *-$s.roff
      do
        install -m755 "$i" "../debian/greetd/usr/share/man/man$s/${i%-*}.$s"
      done
    done
