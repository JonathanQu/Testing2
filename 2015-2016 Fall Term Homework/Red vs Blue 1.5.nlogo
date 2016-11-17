; Team Squirrels: Jonathan Quang, Yuanchu Liu, Bayan Berri
; IntroCS1 pd7
; HW50 -- Coding for a battle between red and blue turtles as a group
; 2015-12-16

breed [red_fighters red_fighter] ; makes a breed “red_fighters”
breed [blue_fighters blue_fighter] ; makes a breed “blue_fighters”
breed [aid_workers aid_worker] ; makes a breed “aid_workers”
breed [bomb_squads bomb_squad]; makes a breed “bomb_squads”
red_fighters-own [life] ;creates the property life for red fighters
blue_fighters-own [life] ;creates the property life for blue fighters
bomb_squads-own [life] ; creates the property life for bomb squads
to setup
  ca ;clears the world
  create-red_fighters num_reds [ setup-red] ;creates num_reds amount of turtles and has them do their setup
  create-blue_fighters num_blues [ setup-blue] ;does the same as above line, but for the blue turtles
  create-aid_workers 10 [setxy random 33 random 33 set color orange] ; creates ten aid workers and sets their x and y coordinates to any random point on the grid. and sets their color to orange
  create-bomb_squads 10 [setxy random 33 random 33 set color lime set life 100] ; same as above but sets the color to lime
  ask patches [patches-setup]
end

to patches-setup
if abs pxcor = 0 [set pcolor brown]  ; creates a 50 yard line with food.
end

to setup-red
   set color red ;set the red team turtles to the color red
    set xcor -15 ;set their xcords to -15 to line them up for battle
    set ycor (who * 33 / num_reds)
    - 16 + (33 / num_reds) / 2 ;use the algorithm for even spacing along a line and face east
    set heading 90
    set life 100
end


to setup-blue
   set color blue ;set the blue team turtles to the color blue
    set xcor 15 ;line them up for battle
    set ycor (who * 33 / num_blues) ;use the algorithm for even spacing and face west
    - 16 + (33 / num_blues) / 2
    set heading 270 ; sets the heading to face the other side of the world. the left side
    set life 100 ; starts them off with 100 life points
end



to death ; when someone runs out of health points they die.
  if life <= 0
  [die]
end

to checkBombs [whatColor] ;function checks if a turtle is on a patch with the given color, if it is,
  if pcolor = whatColor
  [if (color = red or color = blue) ;the patch is colored black and the turtle dies
   [set life (life - 10)
     set pcolor black]]
end



to LayBombBlue ;according to the bombing rate, set the patch color under the turtle blue
if bomb_rate_blue > random 100
[set pcolor blue]
end

to LayBombRed ;according to the bombing rate, set the patch color under the turtle red
if bomb_rate_red > random 100
[set pcolor red]
end

to wiggle ; turn random degrees both ways and then move forward 0 1 or 2 steps.
lt 20
rt random 40
fd random 3
wait 0.1
end

to aidWorkerFunctions ; move around  and if the pcolor is black then check if random 100 is less than 3. if that is true too then set pcolor to brown.
  wiggle
  if pcolor = black
  [if random 100 < 11
    [set pcolor brown]]
end

to bomb_SquadFunctions ; it wiggles and if it lands on a bomb it sets the color to black 75 % of the time and loses 10 points of life otherwise. it eats food and dies when life turns to 0
  wiggle
  if pcolor = red or pcolor = blue
  [ifelse random 4 < 3
    [set pcolor black]
    [set life (life - 10)]]
    set label life
  eatFood
  death
end

to eatFood ; this function adds one health point whenever a red or blue or bombsquad turtle land on a food patch. and then sets its pcolor to black.
  if color = red or color = blue
  [if pcolor = brown
    [set life (life + 5)
      set pcolor black]]
end

to red_team_functions ;has turtles wiggle, check for the opposite teams bomb color, and lay red bombs
wiggle
eatFood
checkBombs  blue
LayBombRed
set label life
death
end

to blue_team_functions ;has turtles wiggle, check for the opposite teams bomb color, and lay blue bombs
wiggle
eatFood
checkBombs red
LayBombBlue
set label life
death
end

to-report TurtlesAlive [whatColor] ;this function reports how many turtles of a color are alive
 report count turtles with [color = whatColor]
end

to-report num_blue_patches ; reporter function for the monitor that counts the number of blue patches or blue bombs.
 report count patches with [pcolor = blue]
end

to-report num_red_patches ; reporter function for the monitor that counts the number of red patches/bombs
 report count patches with [pcolor = red]
end

to-report num_blue ; counts the number of turtles that are blue
 report count turtles with [color = blue]
end

to-report num_red ; counts the number of turtles that are red
 report count turtles with [color = red]
end

to VictoryDance ;if all turtles of any of the two colors are dead, label the remaining as winners and make them draw
  if (TurtlesAlive blue = 0)
  [ask turtles with [color = red] [pd set life (life + 10)
    set label "RED WINS"]
    set pcolor black
    fd 1]
  if (TurtlesAlive red = 0)
  [ask turtles with [color = blue] [pd set life (life + 10)]
    set label "BLUE WINS"
    set pcolor black
    fd 1
  ]

end



to Go ;runs a loop that goes through deciding the winner and performing each team’s functions
VictoryDance
if color = blue [blue_team_functions]
if color = red [red_team_functions]
if color = orange [aidWorkerFunctions]
if color = lime [ bomb_SquadFunctions]
end
@#$#@#$#@
GRAPHICS-WINDOW
210
10
649
470
16
16
13.0
1
10
1
1
1
0
1
1
1
-16
16
-16
16
0
0
1
ticks
30.0

SLIDER
26
29
198
62
num_reds
num_reds
0
100
3
1
1
NIL
HORIZONTAL

SLIDER
26
62
198
95
num_blues
num_blues
0
100
3
1
1
NIL
HORIZONTAL

SLIDER
26
94
198
127
bomb_rate_blue
bomb_rate_blue
0
100
100
1
1
NIL
HORIZONTAL

SLIDER
26
126
198
159
bomb_rate_red
bomb_rate_red
0
100
41
1
1
NIL
HORIZONTAL

BUTTON
37
207
100
240
NIL
GO
T
1
T
TURTLE
NIL
NIL
NIL
NIL
1

BUTTON
36
238
99
271
NIL
setup\n
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

MONITOR
28
306
85
351
#reds
count turtles with [color = red]
17
1
11

MONITOR
85
307
142
352
#blues
count turtles with [color = blue]
17
1
11

MONITOR
27
351
106
396
#red_mines
num_red_patches
17
1
11

MONITOR
24
397
107
442
#blue_mines
num_blue_patches
17
1
11

@#$#@#$#@
##What is it
The model demonstrates a battle between two turtles with an adjustable number of turtles for the red and blue teams as well as how often they lay mines.
Updated:
This updated model does the same thing as the last model but it also incorporates a bombsquad and aid workers. These breeds are made to assist both teams.

## How It Works
Turtles line up on opposite sides of the world. They move radomly with a bias for moving foward. They occasionally lay mines of their own color by coloring the patch that the turtle is on. When a turtle encounters mines of the opposite team's color, they turn off that mine by turning the patch color to black, and they kill themselves

Updated:
 in addition to that their is a 50 yard line made up of food patches. and ten bombsquads set on any random patch. and ten aidworkers that are also set on any patch.
Bombsquads defuse bombs and are injured about 25 percent of the time. they lose life points.
The aid workers change the black patches they are on into food patches which give the breeds extra life.
life is a new property that the turtles have
the blue and red fighters : do the same thing that the re dand blue turtles did in the original.

## HOW TO USE IT
For fairness, all sliders should be adjusted to the desired setting before hitting the setup button. After hitting the setup button, you may hit the go button to turn on the simulation. the monitors count how many blue and red turtles or patches there are.

## CREDITS AND REFERENCES

Credit to Ms.Genkina for teaching computer science and the netlogo turtle models library for providing the default turtle shape. And the Netlogo Programming guide and Dictionary. Thanks to Jonathan for working on the aid workers’ functions, breeds and properties.  and leo and bayan for working on the Bomb_squad functions, breeds and properties.


## Improvements in 1.5
This updated model does the same thing as the last model but it also incorporates a bomb squad and aid workers. These breeds are made to assist both teams.
Bombsquads defuse bombs and are injured about 25 percent of the time. they lose life points.
The aid workers change the black patches they are on into food patches which give the breeds extra life.
life is a new property that the turtles have
the blue and red fighters : do the same thing that the red and blue turtles did in the original.
##BALANCING
##Buff the effects of aid workers.
Increase food drop rate
Increase heal per food to 5


##POSSIBLE UPCOMING EXPANSIONS
##Nerf overhealed juggernauts
Heal based on missing health and/or introduce a cap
##Diffuser buff
Allow diffusers to heal
##FUNCTIONALITY
##Monitors
Introduce monitors to track total team health
##Varibility
Sliders to adjust number of aid workers and diffusers
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270

@#$#@#$#@
NetLogo 5.2.1
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180

@#$#@#$#@
0
@#$#@#$#@
