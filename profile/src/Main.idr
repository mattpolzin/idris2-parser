module Main

import Lex2JSON
import LexJSON
import JSON.Lexer
import Data.List
import Data.List1
import Data.String
import Profile
import Text.Lex2
import Text.Lex
import Libraries.Text.Lexer
import System

--------------------------------------------------------------------------------
--          Running Lexers
--------------------------------------------------------------------------------

export %inline
plex :
     Text.Lex2.Core.Lexer
  -> String
  -> (SnocList (Text.Lex.Bounded.WithBounds String), (Nat,Nat,List Char))
plex l = lex [(l, pack . (<>> []))]

export %inline
slex :
     Text.Lex.Core.Lexer
  -> String
  -> (SnocList (Text.Lex.Bounded.WithBounds String), (Nat,Nat,List Char))
slex l = lex [(l, pack . (<>> []))]

export %inline
ilex :
     Libraries.Text.Lexer.Core.Lexer
  -> String
  -> (List (Libraries.Text.Bounded.WithBounds String), (Int,Int,String))
ilex l = lex [(l, id)]

--------------------------------------------------------------------------------
--          Lexers
--------------------------------------------------------------------------------

helloP : Text.Lex2.Core.Lexer
helloP = exact "hello world"

helloS : Text.Lex.Core.Lexer
helloS = exact "hello world"

helloI : Libraries.Text.Lexer.Core.Lexer
helloI = exact "hello world"

--------------------------------------------------------------------------------
--          Test Strings
--------------------------------------------------------------------------------

digs : Nat -> String
digs n = replicate n '7'

hello : Nat -> String
hello n = fastConcat $ replicate n "hello world"

nls : Nat -> String
nls n =
  fastConcat $ replicate n "\r\n" ++ replicate n "\r" ++ replicate n "\n"

line : Nat -> String
line n = "--" ++ replicate n 'f' ++ "\n"

str : Nat -> String
str n = "\"" ++ replicate n 'f' ++ "\""

jsonStr : String
jsonStr = #"{"SubEdit":{"ed":{"Add":{"ed":{"id":4,"name":"","structure":{"structure":"|  Marvin  01171114162D          || 18 17  0  0  0  0            999 V2000|    3.5211   -3.6829    0.0000 C   0  0  0  0  0  0  0  0  0  0  0  0|    4.2355   -3.2704    0.0000 C   0  0  0  0  0  0  0  0  0  0  0  0|    4.6480   -3.9849    0.0000 C   0  0  0  0  0  0  0  0  0  0  0  0|    3.8230   -2.5559    0.0000 C   0  0  0  0  0  0  0  0  0  0  0  0|    4.9500   -2.8579    0.0000 O   0  0  0  0  0  0  0  0  0  0  0  0|    5.6645   -3.2704    0.0000 C   0  0  0  0  0  0  0  0  0  0  0  0|    5.6645   -4.0954    0.0000 O   0  0  0  0  0  0  0  0  0  0  0  0|    6.3789   -2.8579    0.0000 N   0  0  0  0  0  0  0  0  0  0  0  0|    7.0934   -3.2704    0.0000 C   0  0  0  0  0  0  0  0  0  0  0  0|    7.8079   -2.8579    0.0000 C   0  0  0  0  0  0  0  0  0  0  0  0|    8.5224   -3.2704    0.0000 C   0  0  0  0  0  0  0  0  0  0  0  0|    8.5224   -4.0954    0.0000 O   0  0  0  0  0  0  0  0  0  0  0  0|    9.2368   -2.8579    0.0000 N   0  0  0  0  0  0  0  0  0  0  0  0|    9.9513   -3.2704    0.0000 C   0  0  0  0  0  0  0  0  0  0  0  0|   10.6658   -2.8579    0.0000 C   0  0  0  0  0  0  0  0  0  0  0  0|   11.3802   -3.2704    0.0000 N   0  0  0  0  0  0  0  0  0  0  0  0|   12.0947   -2.8579    0.0000 N   0  3  0  0  0  0  0  0  0  0  0  0|   12.8092   -2.4454    0.0000 N   0  5  0  0  0  0  0  0  0  0  0  0|  1  2  1  0  0  0  0|  2  3  1  0  0  0  0|  2  4  1  0  0  0  0|  2  5  1  0  0  0  0|  5  6  1  0  0  0  0|  6  7  2  0  0  0  0|  6  8  1  0  0  0  0|  8  9  1  0  0  0  0|  9 10  1  0  0  0  0| 10 11  1  0  0  0  0| 11 12  2  0  0  0  0| 11 13  1  0  0  0  0| 13 14  1  0  0  0  0| 14 15  1  0  0  0  0| 15 16  1  0  0  0  0| 16 17  2  0  0  0  0| 17 18  2  0  0  0  0|M  CHG  2  17   1  18  -1|M  END|","svg":"<?xml version='1.0' encoding='UTF-8'?>|<!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\">|<svg version='1.2' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' width='60.31mm' height='13.22mm' viewBox='0 0 60.31 13.22'>|  <desc>Generated by the Chemistry Development Kit (http://github.com/cdk)</desc>|  <g stroke-linecap='round' stroke-linejoin='round' stroke='#000000' stroke-width='.21' fill='#3050F8'>|    <rect x='.0' y='.0' width='61.0' height='14.0' fill='#FFFFFF' stroke='none'/>|    <g id='mol1' class='mol'>|      <line id='mol1bnd1' class='bond' x1='.7' y1='9.17' x2='5.1' y2='6.63'/>|      <line id='mol1bnd2' class='bond' x1='5.1' y1='6.63' x2='7.64' y2='11.03'/>|      <line id='mol1bnd3' class='bond' x1='5.1' y1='6.63' x2='2.56' y2='2.23'/>|      <line id='mol1bnd4' class='bond' x1='5.1' y1='6.63' x2='8.32' y2='4.77'/>|      <line id='mol1bnd5' class='bond' x1='10.69' y1='4.77' x2='13.9' y2='6.63'/>|      <g id='mol1bnd6' class='bond'>|        <line x1='14.36' y1='6.36' x2='14.36' y2='10.33'/>|        <line x1='13.44' y1='6.36' x2='13.44' y2='10.33'/>|      </g>|      <line id='mol1bnd7' class='bond' x1='13.9' y1='6.63' x2='17.24' y2='4.7'/>|      <line id='mol1bnd8' class='bond' x1='19.36' y1='4.7' x2='22.7' y2='6.63'/>|      <line id='mol1bnd9' class='bond' x1='22.7' y1='6.63' x2='27.1' y2='4.09'/>|      <line id='mol1bnd10' class='bond' x1='27.1' y1='4.09' x2='31.5' y2='6.63'/>|      <g id='mol1bnd11' class='bond'>|        <line x1='31.96' y1='6.36' x2='31.96' y2='10.33'/>|        <line x1='31.04' y1='6.36' x2='31.04' y2='10.33'/>|      </g>|      <line id='mol1bnd12' class='bond' x1='31.5' y1='6.63' x2='34.84' y2='4.7'/>|      <line id='mol1bnd13' class='bond' x1='36.96' y1='4.7' x2='40.3' y2='6.63'/>|      <line id='mol1bnd14' class='bond' x1='40.3' y1='6.63' x2='44.7' y2='4.09'/>|      <line id='mol1bnd15' class='bond' x1='44.7' y1='4.09' x2='48.03' y2='6.01'/>|      <g id='mol1bnd16' class='bond'>|        <line x1='49.93' y1='5.62' x2='52.2' y2='4.3'/>|        <line x1='50.38' y1='6.41' x2='52.66' y2='5.09'/>|      </g>|      <g id='mol1bnd17' class='bond'>|        <line x1='55.43' y1='2.44' x2='56.6' y2='1.76'/>|        <line x1='55.89' y1='3.23' x2='57.06' y2='2.55'/>|      </g>|      <path id='mol1atm5' class='atom' d='M9.5 3.33q-.27 .0 -.43 .2q-.16 .2 -.16 .55q.0 .35 .16 .55q.16 .2 .43 .2q.27 .0 .43 -.2q.16 -.2 .16 -.55q.0 -.35 -.16 -.55q-.16 -.2 -.43 -.2zM9.5 3.13q.39 .0 .62 .26q.23 .26 .23 .7q.0 .44 -.23 .7q-.23 .26 -.62 .26q-.39 .0 -.62 -.26q-.23 -.26 -.23 -.7q.0 -.43 .23 -.7q.23 -.26 .62 -.26z' stroke='none' fill='#FF0D0D'/>|      <path id='mol1atm7' class='atom' d='M13.9 10.95q-.27 .0 -.43 .2q-.16 .2 -.16 .55q.0 .35 .16 .55q.16 .2 .43 .2q.27 .0 .43 -.2q.16 -.2 .16 -.55q.0 -.35 -.16 -.55q-.16 -.2 -.43 -.2zM13.9 10.75q.39 .0 .62 .26q.23 .26 .23 .7q.0 .44 -.23 .7q-.23 .26 -.62 .26q-.39 .0 -.62 -.26q-.23 -.26 -.23 -.7q.0 -.43 .23 -.7q.23 -.26 .62 -.26z' stroke='none' fill='#FF0D0D'/>|      <g id='mol1atm8' class='atom'>|        <path d='M17.6 3.16h.33l.82 1.54v-1.54h.24v1.85h-.34l-.82 -1.54v1.54h-.24v-1.85z' stroke='none'/>|        <path d='M17.6 1.11h.25v.76h.91v-.76h.25v1.85h-.25v-.88h-.91v.88h-.25v-1.85z' stroke='none'/>|      </g>|      <path id='mol1atm12' class='atom' d='M31.5 10.95q-.27 .0 -.43 .2q-.16 .2 -.16 .55q.0 .35 .16 .55q.16 .2 .43 .2q.27 .0 .43 -.2q.16 -.2 .16 -.55q.0 -.35 -.16 -.55q-.16 -.2 -.43 -.2zM31.5 10.75q.39 .0 .62 .26q.23 .26 .23 .7q.0 .44 -.23 .7q-.23 .26 -.62 .26q-.39 .0 -.62 -.26q-.23 -.26 -.23 -.7q.0 -.43 .23 -.7q.23 -.26 .62 -.26z' stroke='none' fill='#FF0D0D'/>|      <g id='mol1atm13' class='atom'>|        <path d='M35.2 3.16h.33l.82 1.54v-1.54h.24v1.85h-.34l-.82 -1.54v1.54h-.24v-1.85z' stroke='none'/>|        <path d='M35.2 1.11h.25v.76h.91v-.76h.25v1.85h-.25v-.88h-.91v.88h-.25v-1.85z' stroke='none'/>|      </g>|      <path id='mol1atm16' class='atom' d='M48.4 5.7h.33l.82 1.54v-1.54h.24v1.85h-.34l-.82 -1.54v1.54h-.24v-1.85z' stroke='none'/>|      <g id='mol1atm17' class='atom'>|        <path d='M52.8 3.16h.33l.82 1.54v-1.54h.24v1.85h-.34l-.82 -1.54v1.54h-.24v-1.85z' stroke='none'/>|        <path d='M54.94 2.69v.41h.41v.13h-.41v.41h-.13v-.41h-.41v-.13h.41v-.41h.13z' stroke='none'/>|      </g>|      <g id='mol1atm18' class='atom'>|        <path d='M57.2 .62h.33l.82 1.54v-1.54h.24v1.85h-.34l-.82 -1.54v1.54h-.24v-1.85z' stroke='none'/>|        <path d='M58.8 .56h.95v.13h-.95v-.13z' stroke='none'/>|      </g>|    </g>|  </g>|</svg>|","inchi":"InChI=1S/C10H19N5O3/c1-10(2,3)18-9(17)13-5-4-8(16)12-6-7-14-15-11/h4-7H2,1-3H3,(H,12,16)(H,13,17)","fingerprint":[2,8,16,19,22,23,27,30,32,40,43,44,57,62,74,84,93,98,104,116,118,124,132,133,143,146,148,152,153,154,168,183,197,216,217,219,222,227,238,255,259,263,281,289,296,303,317,319,320,335,337,349,352,354,359,373,390,392,393,396,401,405,410,422,424,426,443,446,467,469,477,478,481,505,508,515,516,517,519,528,538,543,558,575,578,605,606,608,612,622,641,643,648,649,654,673,680,691,712,722,726,735,742,745,746,780,781,786,789,794,808,810,819,822,825,839,842,846,856,857,861,866,879,880,885,906,907,917,920,943,949,952,955,966,971,977,979,989,990,994,995],"maccs":[22,48,51,52,65,69,73,76,78,79,81,89,91,93,96,99,103,105,109,110,111,116,117,118,122,123,125,127,128,129,130,131,135,137,140,141,145,146,148,150,151,152,153,154,155,156,157,158,159,160,163],"pubChem":[0,1,2,9,10,11,14,15,16,18,19,283,284,285,286,299,300,332,333,337,341,344,345,351,352,365,374,380,390,392,393,405,420,422,439,443,451,452,528,535,540,559,569,580,593,611,612,613,643,645,646,656],"logP":0.6389999999999998,"tpsa":79.78999999999999,"lipinski":true},"abs":false,"casNr":"","tags":[],"projects":[2],"created":1528797970229,"modified":{"timestamp":1528797970229,"id":5}}}}}}"#

--------------------------------------------------------------------------------
--          Profiler
--------------------------------------------------------------------------------

bench : Benchmark Void
bench = Group "lexer" [
   Group "digits" [
       Single "parser_1"   (basic (plex digits) $ digs 1)
     , Single "sparser_1"  (basic (slex digits) $ digs 1)
     , Single "idris2_1"   (basic (ilex digits) $ digs 1)
     , Single "parser_10"   (basic (plex digits) $ digs 10)
     , Single "sparser_10"  (basic (slex digits) $ digs 10)
     , Single "idris2_10"   (basic (ilex digits) $ digs 10)
     , Single "parser_100"   (basic (plex digits) $ digs 100)
     , Single "sparser_100"  (basic (slex digits) $ digs 100)
     , Single "idris2_100"   (basic (ilex digits) $ digs 100)
     ]
 , Group "exact" [
       Single "parser_1"  (basic (plex helloP)  $ hello 1)
     , Single "sparser_1"  (basic (slex helloS)  $ hello 1)
     , Single "idris2_1"  (basic (ilex helloI)  $ hello 1)
     , Single "parser_10"  (basic (plex helloP)  $ hello 10)
     , Single "sparser_10"  (basic (slex helloS)  $ hello 10)
     , Single "idris2_10"  (basic (ilex helloI)  $ hello 10)
     , Single "parser_100"  (basic (plex helloP)  $ hello 100)
     , Single "sparser_100"  (basic (slex helloS)  $ hello 100)
     , Single "idris2_100"  (basic (ilex helloI)  $ hello 100)
     ]
 , Group "newline" [
       Single "parser_1"   (basic (plex $ some newline) $ nls 1)
     , Single "sparser_1"   (basic (slex $ some newline) $ nls 1)
     , Single "idris2_1"   (basic (ilex $ some newline) $ nls 1)
     , Single "parser_10"   (basic (plex $ some newline) $ nls 10)
     , Single "sparser_10"   (basic (slex $ some newline) $ nls 10)
     , Single "idris2_10"   (basic (ilex $ some newline) $ nls 10)
     , Single "parser_100"   (basic (plex $ some newline) $ nls 100)
     , Single "sparser_100"   (basic (slex $ some newline) $ nls 100)
     , Single "idris2_100"   (basic (ilex $ some newline) $ nls 100)
     ]
 , Group "line comment" [
       Single "parser_1"   (basic (plex $ lineComment (exact "--")) $ line 1)
     , Single "sparser_1"   (basic (slex $ lineComment (exact "--")) $ line 1)
     , Single "idris2_1"   (basic (ilex $ lineComment (exact "--")) $ line 1)
     , Single "parser_10"   (basic (plex $ lineComment (exact "--")) $ line 10)
     , Single "sparser_10"   (basic (slex $ lineComment (exact "--")) $ line 10)
     , Single "idris2_10"   (basic (ilex $ lineComment (exact "--")) $ line 10)
     , Single "parser_100"   (basic (plex $ lineComment (exact "--")) $ line 100)
     , Single "sparser_100"   (basic (slex $ lineComment (exact "--")) $ line 100)
     , Single "idris2_100"   (basic (ilex $ lineComment (exact "--")) $ line 100)
     ]
 , Group "stringLit" [
       Single "parser_1"   (basic (plex $ stringLit) $ line 1)
     , Single "sparser_1"   (basic (slex $ stringLit) $ line 1)
     , Single "idris2_1"   (basic (ilex $ stringLit) $ line 1)
     , Single "parser_10"   (basic (plex $ stringLit) $ line 10)
     , Single "sparser_10"   (basic (slex $ stringLit) $ line 10)
     , Single "idris2_10"   (basic (ilex $ stringLit) $ line 10)
     , Single "parser_100"   (basic (plex $ stringLit) $ line 100)
     , Single "sparser_100"   (basic (slex $ stringLit) $ line 100)
     , Single "idris2_100"   (basic (ilex $ stringLit) $ line 100)
     ]
 , Group "json" [
       Single "parser" (basic (Lex.Core.lex json) jsonStr)
     , Single "sparser" (basic (Lex2.Core.lex json) jsonStr)
     , Single "json"   (basic lexJSON jsonStr)
     ]
  ]

fromArgs : List String -> String -> Bool
fromArgs [_,p] = case split ('=' ==) p of
  "--only" ::: [s] => isInfixOf s
  _                => const False
fromArgs _ = const True

main : IO ()
main = do
  select <- fromArgs <$> getArgs
  runDefault select Table show bench
