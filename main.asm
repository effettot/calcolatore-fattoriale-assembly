section .data
    prompt db "Inserisci un numero intero positivo: ", 0
    format db "%d", 0
    result db "Il fattoriale di %d è %d.", 0

section .bss
    num resd 1
    fact resd 1

section .text
    global _start

_start:
    ; Stampa il prompt e legge l'input dall'utente
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 30
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, num
    mov edx, 4
    int 0x80

    ; Calcola il fattoriale
    mov ebx, [num]
    mov ecx, [num]
    dec ecx

    loop:
        cmp ecx, 1
        jl print

        imul ebx, ecx
        dec ecx
        jmp loop

    print:
        ; Stampa il risultato
        mov eax, 4
        mov ebx, 1
        mov ecx, result
        mov edx, 30
        push ebx
        push [num]
        push ebx
        push [ebx-4]
        push ebx
        push [fact]
        push ebx
        push eax
        int 0x80

        ; Termina il programma
        mov eax, 1
        xor ebx, ebx
        int 0x80
