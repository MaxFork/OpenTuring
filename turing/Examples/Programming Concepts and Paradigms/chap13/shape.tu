% File "shape.tu". A unit containing the Shape module.
unit
module Shape
    export circle, ball, square, block, tiltSquare, moon, star, mapleleaf, hold

    procedure circle (xc, yc, radius, clr : int)
        Draw.Oval (xc, yc, radius, radius, clr)
    end circle

    procedure ball (xc, yc, radius, clr : int)
        Draw.FillOval (xc, yc, radius, radius, clr)
    end ball

    procedure square (x, y, size, clr : int)
        Draw.Box (x, y, x + size, y + size, clr)
    end square

    procedure block (x, y, size, clr : int)
        Draw.FillBox (x, y, x + size, y + size, clr)
    end block

    procedure tiltSquare (x1, y1, size, angle, clr : int)
        % Compute 4 constants to help compute corners.
        const a := round (size * cosd (angle))
        const b := round (size * sind (angle))
        const c := round (size * sqrt (2) * cosd (45 + angle))
        const d := round (size * sqrt (2) * sind (45 + angle))
        % Compute corners.
        const x2 := x1 + a
        const y2 := y1 + b
        const x3 := x1 + c
        const y3 := y1 + d
        const x4 := x1 - b
        const y4 := y1 + a
        % Draw square.
        Draw.Line (x1, y1, x2, y2, clr)
        Draw.Line (x2, y2, x3, y3, clr)
        Draw.Line (x3, y3, x4, y4, clr)
        Draw.Line (x4, y4, x1, y1, clr)
    end tiltSquare

    procedure moon (xc, yc, size, clr : int)
        % Draw a series of tilted squares at intervals of 10 degrees
        % going from a tilt of 0 degrees to a tilt of 350 degrees.
        for angle : 0 .. 350 by 10
            tiltSquare (xc, yc, size, angle, clr)
        end for
    end moon

    procedure star (x, y, r, clr : int)
        Draw.FillStar (round (x - r * cosd (18)), round (y - r * cosd (36)),
            round (x + r * cosd (18)), y + r, clr)
    end star

    procedure mapleleaf (x, y, r, clr : int)
        Draw.FillMapleLeaf (x - r + r div 50, y - r,
            x + r - r div 50, y + r, clr)
    end mapleleaf

    procedure hold
        var ch : string (1)
        getch (ch)
    end hold
end Shape