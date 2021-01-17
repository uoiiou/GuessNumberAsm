        org     100h

        mov     ah,$09
        mov     dx,tinfo
        int     21h

        mov     cx,10
        mov     bx,[inumb]
        ;push    bx
loop:
        call    tyournmb

        mov     ah,$02
        mov     dl,numbp
        int     21h

        mov     al,[numbp]
        cbw
        cmp     bx,ax
        jb      cbelow
        ja      cabove
        je      cequal
cbelow:
        call    below
        jmp     next

cabove:
        call    above
        jmp     next

cequal:
        call    equal
        jmp     nextequal

        next:
                loop    loop
        nextequal:
                mov     cx,1
                loop    loop

        mov     ah,$08
        int     21h
        ret
tyournmb:
        mov     ah,$09
        mov     dx,tynmb
        int     21h
        ret

below:
        mov     ah,$09
        mov     dx,tbelow
        int     21h
        ret

above:
        mov     ah,$09
        mov     dx,tabove
        int     21h
        ret

equal:
        mov     ah,$09
        mov     dx,tequal
        int     21h
        ret

inumb   dw      6
tinfo   db      'The computer made a number. You need to guess for 10 tries.$'
tynmb   db      'Your number: $'
numbp   db      ?
tbelow  db      'Less$'
tabove  db      'More$'
tequal  db      'You guess!$'