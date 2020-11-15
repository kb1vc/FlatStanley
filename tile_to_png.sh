#!/bin/bash

bfn=$1
echo "basename = ${bfn}"


#let PW=825
#let PH=1067
#/Applications/Inkscape.app/Contents/MacOS/inkscape --export-type=png -o t0.png --export-area=1:1:${PW}:${PH} FlatStanleyV1.svg

export PATH=${PATH}:/Applications/Inkscape.app/Contents/MacOS

let PW=816
let PH=1056
let INCX=720
let INCY=960

let X=0
let Y=0
for r in 1 2
do
    let YP=${Y}+${PH}
    let X=0
    for c in 0 1 2 3
    do
	let XP=${X}+${PW}
	
	echo "${X}:${Y}:${XP}:${YP}	"
	inkscape --export-type=png -o ${bfn}_r${r}_c${c}.png --export-area=${X}:${Y}:${XP}:${YP} ${bfn}.svg
	let X=X+${INCX}
    done
    let Y=Y+${INCY}    
done

