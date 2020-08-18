# Oats For My Goats

This is a simple little game about walking around a garden and growing
flowers. 

At the moment, all this game can do is have you walk around a
fenced-off area, and bump into little fences placed inside the area.

I plan to expand the game now that I seem to understand how to make
arrays and manipulate them c:

I have been promising to make this game for many months, and I have finally had the inspiration to start making it!

You can boot up this little demo very easily by typing in the following commands:

(bash shell)$  sbcl --load chase.lisp

(lisp repl)* (init-playfield)
(lisp repl)* (init-internal-fences)
(lisp repl)* (init-player-position)
(lisp repl)* (main-loop)

The controls are based on a numpad: 8 is up, 2 is down, 4 is left, and 6 is right!
