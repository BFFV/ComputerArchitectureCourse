
;Este ejemplo escribe la palabta hola en el display, ocupando 
;las interrupciones de software de display definidas en el emulador
;ver http://www.emu8086.com/interrupts.html

org 100h

mov al, 00h
int 10h

mov al, 'h'
mov ah, 0eh
int 10h

mov al, 'o'
mov ah, 0eh
int 10h

mov al, 'l'
mov ah, 0eh
int 10h

mov al, 'a'
mov ah, 0eh
int 10h


ret




