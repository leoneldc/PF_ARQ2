                                  
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

inicio:   
call  pcs_encabezado
call  pcs_indicaciones   
call  pcs_mainMenu 

opcion1:
ret
    
salida:
ret                  


        
        pcs_encabezado proc
        ;limpiamos la pantalla
        mov ah, 0Fh
        int 10h
        mov ah, 0
        int 10h 
        ;configuramos consola
        mov dh, 4 ;fila
        mov dl, 20 ;columna 
        mov ah, 2
        int 10h  
        ;mostramos titulo 
        mov dx, offset msgTitulo
        mov ah, 9
        int 21h
        ;configuramos consola                      
        mov dh, 5 ;fila
        mov dl, 25 ;columna  
        mov ah, 2
        int 10h  
        ;mostramos semestre
        mov dx, offset msgSemetre
        mov ah, 9
        int 21h
            ret     
        pcs_encabezado endp
        
        pcs_indicaciones proc
        ;configuramos consola                      
        mov dh, 10 ;fila
        mov dl, 5 ;columna  
        mov ah, 2
        int 10h  
        ;mostramos semestre
        mov dx, offset msgIdicacion
        mov ah, 9
        int 21h
        ;configuramos consola                      
        mov dh, 12 ;fila
        mov dl, 15 ;columna  
        mov ah, 2
        int 10h
            ret
        pcs_indicaciones endp
        
        pcs_mainMenu proc
        ;configuramos consola                      
        mov dh, 12 ;fila
        mov dl, 15 ;columna  
        mov ah, 2
        int 10h  
        ;mostramos semestre
        mov dx, offset msgOpcion1
        mov ah, 9
        int 21h
        ;configuramos consola                      
        mov dh, 13 ;fila
        mov dl, 15 ;columna  
        mov ah, 2
        int 10h  
        ;mostramos semestre
        mov dx, offset msgOpcion2
        mov ah, 9
        int 21h
        ;configuramos consola                      
        mov dh, 14 ;fila
        mov dl, 15 ;columna  
        mov ah, 2
        int 10h  
        ;mostramos semestre
        mov dx, offset msgOpcion3
        mov ah, 9
        int 21h
        ;configuramos consola                      
        mov dh, 15 ;fila
        mov dl, 15 ;columna  
        mov ah, 2
        int 10h  
        ;mostramos semestre
        mov dx, offset msgOpcion4
        mov ah, 9
        int 21h 
        ;configuramos consola                      
        mov dh, 16 ;fila
        mov dl, 15 ;columna  
        mov ah, 2
        int 10h  
        ;mostramos semestre
        mov dx, offset msgOpcion5
        mov ah, 9
        int 21h
        call validarMainMenu
            ret
        pcs_mainMenu endp
        
        
        validarMainMenu proc
            validar:
            ;configuramos consola                      
            mov dh, 10 ;fila
            mov dl, 44 ;columna  
            mov ah, 2
            int 10h 
            ; recibir informacion del teclado
            mov ah, 1
            int 21h 
            ;validamos la opcion
            cmp al,31h
            je call pcs_menuOperacionesBasicas
            cmp al,32h
            je opcion1
            cmp al,33h
            je opcion1
            cmp al,34h
            je opcion1
            cmp al,35h
            je salida
            jne call validarMainMenu
                ret
            validarMainMenu endp
        
        pcs_menuOperacionesBasicas proc
        call pcs_encabezado
        call pcs_indicaciones
        ;configuramos consola
        mov dh, 4 ;fila
        mov dl, 20 ;columna 
        mov ah, 2
        int 10h  
        ;mostramos titulo 
        mov dx, offset msgTitulo
        mov ah, 9
        int 21h
        ;configuramos consola                      
        mov dh, 5 ;fila
        mov dl, 25 ;columna  
        mov ah, 2
        int 10h  
        ;mostramos semestre
        mov dx, offset msgSemetre
        mov ah, 9
        int 21h
        ;configuramos consola                      
        mov dh, 10 ;fila
        mov dl, 5 ;columna  
        mov ah, 2
        int 10h  
        ;mostramos semestre
        mov dx, offset msgIdicacion
        mov ah, 9
        int 21h 
        ;configuramos consola                      
        mov dh, 12 ;fila
        mov dl, 15 ;columna  
        mov ah, 2
        int 10h  
        ;mostramos semestre
        mov dx, offset opt1Opcion1
        mov ah, 9
        int 21h
        ;configuramos consola                      
        mov dh, 13 ;fila
        mov dl, 15 ;columna  
        mov ah, 2
        int 10h  
        ;mostramos semestre
        mov dx, offset opt1Opcion2
        mov ah, 9
        int 21h
        ;configuramos consola                      
        mov dh, 14 ;fila
        mov dl, 15 ;columna  
        mov ah, 2
        int 10h  
        ;mostramos semestre
        mov dx, offset opt1Opcion3
        mov ah, 9
        int 21h
        ;configuramos consola                      
        mov dh, 15 ;fila
        mov dl, 15 ;columna  
        mov ah, 2
        int 10h  
        ;mostramos semestre
        mov dx, offset opt1Opcion4
        mov ah, 9
        int 21h  
        jmp call pcs_validarMenuOperacionesBasicas
            ret
        pcs_menuOperacionesBasicas endp
        
        
        pcs_validarMenuOperacionesBasicas proc
        ;configuramos consola                      
        mov dh, 10 ;fila
        mov dl, 44 ;columna  
        mov ah, 2
        int 10h 
        ; recibir informacion del teclado
        mov ah, 1
        int 21h 
        ;validamos la opcion
        cmp al,31h
        je call pcs_suma
        cmp al,32h
        je opcion1
        cmp al,33h
        je opcion1
        cmp al,34h
        je inicio
        jne pcs_validarMenuOperacionesBasicas           
            ret           
        pcs_validarMenuOperacionesBasicas endp
        
        pcs_suma proc
        call pcs_encabezado
        ;configuramos consola                      
        mov dh, 10 ;fila
        mov dl, 25 ;columna  
        mov ah, 2
        int 10h 
        ;mostramos en pantalla
        mov ah,09h
        lea dx, sumaIndicacion1
        int 21h
        
        val1PrimerDigito:
        ;guardamos el primer digito del primer numero            
        mov ah,01h
        int 21h
        cmp al, 48
        jb  val1PrimerDigito
        cmp al, 57
        ja  val1PrimerDigito
        sub al,30h
        mov bl,al
        
        val2PrimerDigito: 
        ;guardamos el segundo digito del primer numero            
        mov ah,01h
        int 21h
        cmp al, 48
        jb  val2PrimerDigito
        cmp al, 57
        ja  val2PrimerDigito
        sub al,30h
        mov cl,al
                    
        ;configuramos consola                      
        mov dh, 11 ;fila
        mov dl, 25 ;columna  
        mov ah, 2
        int 10h                 
        ;mostramos en pantalla 
        mov ah,09h
        lea dx, sumaIndicacion2
        int 21h
        
        val1SegundoDigito:
        ;guardamos el primer digito del segundo numero                        
        mov ah,01h
        int 21h
        cmp al, 48
        jb  val1SegundoDigito
        cmp al, 57
        ja  val1SegundoDigito
        sub al,30h 
        ;sumamos el digito1 de num1 con digito1 de num2            
        add bl,al 
        
        val2SegundoDigito:
        ;guardamos el segundo digito del segundo numero                                    
        mov ah,01h
        int 21h
        cmp al, 48
        jb  val2SegundoDigito
        cmp al, 57
        ja  val2SegundoDigito
        sub al,30h
        ;sumamos el digito2 de num1 con digito2 de num2            
        add cl,al
        
        ;configuramos consola                      
        mov dh, 14 ;fila
        mov dl, 25 ;columna  
        mov ah, 2
        int 10h    
        
        ;mostramos el resultado            
        mov ah,09h
        lea dx,sumaResultado 
        int 21h
                    
        mov ax,cx
        ;ajuste para convertir hexadecimal a decimal
        aam
        mov cx,ax
        ;suma de acarreo             
        add bl,ch
        mov ax,bx           
        aam
        mov bx,ax
        ;se imprime las centenas            
        mov ah,02h
        mov dl,bh
        add dl,30h
        int 21h 
        ;se imprime las decenas  
        mov ah,02h
        mov dl,bl
        add dl,30h
        int 21h
        ;se imprime las unidades           
        mov ah,02h
        mov dl,cl
        add dl,30h
        int 21h         
        mov ah,01h
        int 21h
        jmp call pcs_menuOperacionesBasicas
            ret
        pcs_suma endp
        
  
;bloque menu encabezado
msgTitulo db  "Arquitectura de Computadoras II", "$" 
msgSemetre db "Octavo Semestre 2022", "$"
msgIdicacion db "Elija una de las siguientes opciones:", "$"
;bloque menu principal
msgOpcion1 db "Operaciones Basicas         [1]", "$"
msgOpcion2 db "Operaciones con Cadenas     [2]", "$"
msgOpcion3 db "Juego                       [3]", "$"
msgOpcion4 db "Operaciones de Recurrencia  [4]", "$"
msgOpcion5 db "Salida                      [5]", "$"
;blqoue menu funciones aritmeticas
opt1Opcion1 db "Suma                        [1]", "$"
opt1Opcion2 db "Resta                       [2]", "$"
opt1Opcion3 db "Multiplicacion              [3]", "$"
opt1Opcion4 db "Regresar                    [4]", "$"
;bloque suma
sumaIndicacion1 db "Ingrese numero 1: " , "$"
sumaIndicacion2 db "Ingrese numero 2: " , "$"
sumaResultado db   "El resultado es: ", "$" 
