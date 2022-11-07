                                  
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

inicio:   
call  pcs_encabezado
call  pcs_indicaciones   
call  pcs_mainMenu 
    
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
        mov dx, offset msgSemestre
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
        je call pcs_palindromo
        cmp al,33h
        je call pcs_ahorcado
        cmp al,34h
        je pcs_fibonacci
        cmp al,35h
        je salida
        jne call validarMainMenu
            ret
        validarMainMenu endp

;inicio opcion 1
        
        pcs_menuOperacionesBasicas proc
        call pcs_encabezado
        call pcs_indicaciones
        
        ;configuramos consola                      
        mov dh, 12 ;fila
        mov dl, 15 ;columna  
        mov ah, 2
        int 10h  
        ;mostramos suma
        mov dx, offset opt1Opcion1
        mov ah, 9
        int 21h
        ;configuramos consola                      
        mov dh, 13 ;fila
        mov dl, 15 ;columna  
        mov ah, 2
        int 10h  
        ;mostramos resta
        mov dx, offset opt1Opcion2
        mov ah, 9
        int 21h
        ;configuramos consola                      
        mov dh, 14 ;fila
        mov dl, 15 ;columna  
        mov ah, 2
        int 10h  
        ;mostramos multiplicacion
        mov dx, offset opt1Opcion3
        mov ah, 9
        int 21h
        ;configuramos consola                      
        mov dh, 15 ;fila
        mov dl, 15 ;columna  
        mov ah, 2
        int 10h  
        ;mostramos regresamos
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
        je call pcs_resta
        cmp al,33h
        je pcs_multiplicacion
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
        lea dx, pedirNum1
        int 21h
        
        val1PrimerDigito:
        ;configuramos consola                      
        mov dh, 10 ;fila
        mov dl, 45 ;columna  
        mov ah, 2
        int 10h
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
        ;configuramos consola                      
        mov dh, 10 ;fila
        mov dl, 46 ;columna  
        mov ah, 2
        int 10h 
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
        lea dx, pedirNum2
        int 21h
        
        val1SegundoDigito:
        ;configuramos consola                      
        mov dh, 11 ;fila
        mov dl, 45 ;columna  
        mov ah, 2
        int 10h
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
        ;configuramos consola                      
        mov dh, 11 ;fila
        mov dl, 46 ;columna  
        mov ah, 2
        int 10h
        ;guardamos el segundo digito del segundo numero                                    
        mov ah,01h
        int 21h
        cmp al, 48
        jb  val2SegundoDigito
        cmp al, 57
        ja  val2SegundoDigito
        sub al,30h
        
        fncSuma:
        ;sumamos el digito2 de num1 con digito2 de num2            
        add cl,al
        
        ;configuramos consola                      
        mov dh, 14 ;fila
        mov dl, 25 ;columna  
        mov ah, 2
        int 10h    
        ;mostramos el resultado            
        mov ah,09h
        lea dx,mostrarResultado 
        int 21h
                    
        call pcs_mostrarResultado
            ret
        pcs_suma endp
        
        
        pcs_resta proc
        call pcs_encabezado
        ;configuramos consola                      
        mov dh, 10 ;fila
        mov dl, 25 ;columna  
        mov ah, 2
        int 10h 
        ;mostramos en pantalla
        mov ah,09h
        lea dx, pedirNum1
        int 21h
        
        val1PrimerDigitoResta:
        ;configuramos consola                      
        mov dh, 10 ;fila
        mov dl, 45 ;columna  
        mov ah, 2
        int 10h
        ;guardamos el primer digito del primer numero            
        mov ah,01h
        int 21h
        cmp al, 48
        jb  val1PrimerDigitoResta
        cmp al, 57
        ja  val1PrimerDigitoResta
        sub al,30h
        mov bl,al
        
        val2PrimerDigitoResta:
        ;configuramos consola                      
        mov dh, 10 ;fila
        mov dl, 46 ;columna  
        mov ah, 2
        int 10h 
        ;guardamos el segundo digito del primer numero            
        mov ah,01h
        int 21h
        cmp al, 48
        jb  val2PrimerDigitoResta
        cmp al, 57
        ja  val2PrimerDigitoResta
        sub al,30h
        mov cl,al
                    
        ;configuramos consola                      
        mov dh, 11 ;fila
        mov dl, 25 ;columna  
        mov ah, 2
        int 10h                 
        ;mostramos en pantalla 
        mov ah,09h
        lea dx, pedirNum2
        int 21h
        
        
        val1SegundoDigitoResta:
        ;configuramos consola                      
        mov dh, 11 ;fila
        mov dl, 45 ;columna  
        mov ah, 2
        int 10h
        ;guardamos el primer digito del segundo numero                        
        mov ah,01h
        int 21h
        cmp al, 48
        jb  val1SegundoDigitoResta
        cmp al, 57
        ja  val1SegundoDigitoResta
        sub al,30h
        mov ch, al
        
        val2SegundoDigitoResta:
        ;configuramos consola                      
        mov dh, 11 ;fila
        mov dl, 46 ;columna  
        mov ah, 2
        int 10h
        ;guardamos el segundo digito del segundo numero                                    
        mov ah,01h
        int 21h
        cmp al, 48
        jb  val2SegundoDigitoResta
        cmp al, 57
        ja  val2SegundoDigitoResta
        sub al,30h
        
        mov x,  0
        mov y,  0
        mov agrupar1, 0
        mov agrupar2, 0
         
        Num1D1Agrupar: 
        cmp x, bl
        je  Num1D2Agrupar
        inc x
        add agrupar1, 0Ah
        jmp Num1D1Agrupar
        
        Num1D2Agrupar:
        add agrupar1, cl
        mov x, 0
        
        
        Num2D1Agrupar: 
        cmp x, ch
        je  restar
        inc x
        add agrupar2, 0Ah
        jmp Num2D1Agrupar
        
        restar:
        add agrupar2, al
        
        mov bl, agrupar1
        mov cl, agrupar2 
        sub bl, cl 
        jnc num1Mayor
        not bl
        add bl, 01h     
                
        ;mostramos en pantalla
        mov dh, 14 ;fila
        mov dl, 25 ;columna 
        mov ah, 2
        int 10h  
        ;mostramos titulo 
        mov dx, offset mostrarResultadoNegativo
        mov ah, 9
        int 21h
        jmp imprimirResta
        
        num1Mayor:
        ;mostramos en pantalla
        mov dh, 14 ;fila
        mov dl, 25 ;columna 
        mov ah, 2
        int 10h  
        ;mostramos titulo 
        mov dx, offset mostrarResultado
        mov ah, 9
        int 21h
        
                      
        imprimirResta:
        mov ax,bx           
        aam
        mov bx,ax
        ;se imprime las decenas            
        mov ah,02h
        mov dl,bh
        add dl,30h
        int 21h 
        ;se imprime las unidades  
        mov ah,02h
        mov dl,bl
        add dl,30h
        int 21h         
        mov ah,01h
        int 21h
        
        jmp call pcs_menuOperacionesBasicas
         
            ret
        pcs_resta endp
                            
        
        pcs_multiplicacion proc
        call pcs_encabezado
        ;configuramos consola                      
        mov dh, 10 ;fila
        mov dl, 25 ;columna  
        mov ah, 2
        int 10h 
        ;mostramos en pantalla
        mov ah,09h
        lea dx, pedirNum1
        int 21h
                    
        ;configuramos consola                      
        mov dh, 11 ;fila
        mov dl, 25 ;columna  
        mov ah, 2
        int 10h 
        ;mostramos en pantalla
        mov ah,09h
        lea dx, pedirNum2
        int 21h   
        
        
        val1PrimerDigitoMultiplicacion:
        ;configuramos consola                      
        mov dh, 10 ;fila
        mov dl, 45 ;columna  
        mov ah, 2
        int 10h
        ;guardamos el primer digito del primer numero            
        mov ah,01h
        int 21h
        cmp al, 48
        jb  val1PrimerDigitoMultiplicacion
        cmp al, 57
        ja  val1PrimerDigitoMultiplicacion
        sub al,30h
        mov ch,al
        
        val2PrimerDigitoMultiplicacion:
        ;configuramos consola                      
        mov dh, 10 ;fila
        mov dl, 46 ;columna  
        mov ah, 2
        int 10h 
        ;guardamos el segundo digito del primer numero            
        mov ah,01h
        int 21h
        cmp al, 48
        jb  val2PrimerDigitoMultiplicacion
        cmp al, 57
        ja  val2PrimerDigitoMultiplicacion
        sub al,30h
        mov bl,al  
        
        valSegundoDigitoMultiplicacion:
        ;configuramos consola                      
        mov dh, 11 ;fila
        mov dl, 45 ;columna  
        mov ah, 2
        int 10h
        
        ;guardamos el primer digito del segundo numero                        
        mov ah,01h
        int 21h
        cmp al, 48
        jb  valSegundoDigitoMultiplicacion
        cmp al, 57
        ja  valSegundoDigitoMultiplicacion
        sub al,30h 
        mov cl, al  
        mov al, 0
        mov ah, 0
        
        mov x,  0
        mov y,  0
        
        fncmultiplicar:
        ;sumamos el digito2 de num1 n veces que indique el num2
        
        cmp x, cl
        je  mult2digito
        inc x
        add al, bl
        jmp fncmultiplicar
         
        mult2digito:
        cmp y, cl
        je  imprimirResultado
        inc y
        add ah, ch
        jmp mult2digito
        
        imprimirResultado:
        mov cl, al
        mov bl, ah
        
        mov dh, 14 ;fila
        mov dl, 25 ;columna 
        mov ah, 2
        int 10h  
        ;mostramos titulo 
        mov dx, offset mostrarResultado
        mov ah, 9
        int 21h
        call pcs_mostrarResultado    
            ret
        pcs_multiplicacion endp
        
        pcs_mostrarResultado proc     
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
        pcs_mostrarResultado endp
        
;inicio opcion 2 

        pcs_palindromo proc         
        main: 
        call pcs_encabezado

        ;posicion en pantalla
        mov dh, 9 ;fila
        mov dl, 5 ;columna  
        mov ah, 2
        int 10h 
        ;mensaje de bienvenida 
        mov dx, offset palindromo1
        mov ah, 9
        int 21h
        
        ;posicion en pantalla
        mov dh, 10 ;fila
        mov dl, 5 ;columna  
        mov ah, 2
        int 10h  
        ;mensaje de cantidad de caracteres
        mov dx, offset palindromo2
        mov ah, 9
        int 21h 
        
        ;introducir tamaño de la cadena
        mov ah,01h
        int 21h
        
        ;verificar si el numero se encuentra en el rango 0 a 9
        cmp al,030h  
        js datoincorrecto
        cmp al,03ah  
        jns datoincorrecto
        ;ajustando el valor de al para almacenarlo en n
        sub al,30h
        mov n,al
        mov bh,al
            
        ;mensaje para ingresar la cadena
        mov dx, offset palindromo3
        mov ah, 9
        int 21h 
                 
        ;ciclo para introducir la cadena
        mov cl,n
        mov si,0
                       
        ingresocadena:
        mov ah,01h
        int 21h
        mov p[si],al
        mov p1[si],al
        inc si
        dec bh
        jnz ingresocadena
        jmp comparar 
                  
        comparar:
        ;segundo ciclo para comprobar si la cadena es palindroma
        mov cl,n
        mov si,0
        ;limpiando contenido de ax
        xor ax,ax
        ;moviendo registro n a al
        mov al,n
          
        mov di,ax 
           
        ciclocompara:
        dec di
        mov al,p[si]
        mov dl,p1[di]
        inc si
        cmp al,dl
        jnz nocumple  
        loopne ciclocompara
        
        ;posicion en pantalla
        mov dh, 12 ;fila
        mov dl, 5 ;columna  
        mov ah, 2
        int 10h  
        ;comprobacion exitosa
        mov dx, offset espalindromo
        mov ah, 9
        int 21h
        jmp salir
                 
        nocumple:    
        ;posicion en pantalla
        mov dh, 12 ;fila
        mov dl, 5 ;columna  
        mov ah, 2
        int 10h  
        ;comprobacion sin exito
        mov dx, offset noespalindromo
        mov ah, 9
        int 21h
        jmp salir
           
        datoincorrecto:
        ;posicion en pantalla
        mov dh, 11 ;fila
        mov dl, 5 ;columna  
        mov ah, 2
        int 10h  
        ;mensaje para pedir otro dato
        mov dx, offset repingreso
        mov ah, 9
        int 21h
            
        salir: 
        ;posicion en pantalla        
        mov dh, 15 ;fila
        mov dl, 5 ;columna  
        mov ah, 2
        int 10h  
        ;mensaje para realizar otra operacion
        mov dx, offset otrapalabra
        mov ah, 9
        int 21h
        
        mov ah,01h
        int 21h
        cmp al,'s'
        jz main
        
        jmp inicio
        ret
        pcs_palindromo endp

;inicio opcion 3
 
        pcs_ahorcado proc 
        call pcs_encabezado 
        
        
        IM:
          mov dh, 8 ;fila
          mov dl, 0 ;columna  
          mov ah, 2
          int 10h 
          mov dx, offset MSG_OCULTA
          call mostrarmsg
          mov dx, offset MSG_ADIVINE
          call mostrarmsg
          call ingresar
          call crearoculta
          mov dx, offset ADIVINO
    
        CM: 
          cmp vidas, 0
          je FMP
          call compara
          cmp cx, 0
          je FMG
          add FILA, 2
          call setcursor
          call mostrarmsg
          call ingresarletra
          call buscar
          cmp cx, 0
          je PM            
          call reemplazar
          cmp cx, 1
          je PM
          jmp CM
               
        PM:
          mov columna, 11
          call setcursor
          call mostrarchar
          mov columna, 0
          call setcursor
          call quitarvida
          jmp CM          
    
        FMG:
          add FILA, 2
          call setcursor
          call mostrarmsg  
          add FILA, 2
          call setcursor  
          mov dx, offset MSG_GANO
          call mostrarmsg
          jmp Repetir          
    
        FMP:
          add FILA, 2
          call setcursor
          mov dx, offset MSG_PERDIO
          call mostrarmsg
          mov dx, offset SECRETA
          call mostrarmsg
    
        Repetir:
        ;mensaje para jugar de nuevo
          mov dx, offset jugarotravez
          mov ah, 9
          int 21h
        
          mov ah,01h
          int 21h
          cmp al,'s'
          jz call pcs_ahorcado proc
        
          jmp inicio 
        
        pcs_ahorcado endp
         
        ingresar proc 
        II: 
          push cx
          push di
          mov cl, MAX_LARGO
          mov di, offset SECRETA
          mov ch, 0 ; el contador esta en cero
        IC: 
          mov ah, 07h
          int 21h
          cmp cl, ch ; si esta al limite
          je FI
          cmp al, 13
          je FI
          mov [di], al
          inc di
          inc ch  ; conto una letra
          jmp IC
        FI: 
          inc di
          mov [di], '$'
          mov aux, ch
          pop di
          pop cx
          ret
        ingresar endp                  
        
        crearoculta proc
          ;limpiamos la pantalla
          mov ah, 0Fh
          int 10h
          mov ah, 0
          int 10h            
        ICR:
          push di
          push cx    
          mov ch, 0
          mov cl, AUX
          mov di, offset ADIVINO
        CC: 
          cmp cx, 0
          je FC
          mov [di],'*'
          dec cx
          inc di
          jmp CC              
        FC:
          inc di
          mov [di], '$'
          pop cx
          pop di
          ret
        crearoculta endp
        
        ingresarletra proc 
        INI:push ax
            mov ah, 07h
            int 21h  
        INF:mov CHAR, al
            pop ax
        ingresarletra endp
                             
        compara proc 
        ICMP:push ax
             push di
             push si              
             mov cx, 0 ; <-- en principio ambas cadenas son iguales x_x
             mov di, offset SECRETA
             mov si, offset ADIVINO
        CCMP:mov ah, [di]
             mov al, [si]        
             cmp ah, '$'
             je FCMP                                  
             cmp ah, al
             je CSIG
             jmp CPRO
        CSIG:inc di
             inc si
             jmp CCMP
        CPRO:mov cx, 1
        FCMP:pop si
             pop di
             pop ax
             ret
        compara endp                              
                                                   
        reemplazar proc 
        IR: push si
            push di
            push ax
            mov cx, 0
            mov si, offset ADIVINO
            mov di, offset SECRETA
            mov al, CHAR      
        CR: cmp [di], '$'
            je FR
            cmp [di], al
            je CPR
            inc di
            inc si
            jmp CR
        CPR:cmp [si], '*'
            je RMP
            mov cx, 1
            jmp FR            
        RMP:mov [si], al
            inc si
            inc di
            jmp CR            
        FR: pop ax
            pop di
            pop si
            ret
        reemplazar endp
        
        buscar proc 
        IB:push di
            push ax    
            mov cx, 0 ; en principio no esta el caracter ingresado
            mov di, offset SECRETA; una direccion de memoria a recorrer
            mov al, CHAR
        CB: cmp [di], '$'
            je FB
            cmp [di], al
            je PB
            inc di
            jmp CB            
        PB: mov cx, 1      
        FB: pop ax
            pop di
            ret
        buscar endp
        
        quitarvida proc 
        IQV:sub VIDAS, 1
            ret
        quitarvida endp
        
        mostrarmsg proc 
        IMS:push ax
            mov ah, 09h
            int 21h
        FMS:pop ax
            ret
        mostrarmsg endp
                           
        mostrarchar proc 
            push ax
            push dx
            mov dl, CHAR    
            mov ah, 02h
            int 21h
            pop dx
            pop ax
            ret
        mostrarchar endp                  
                           
        setcursor proc 
            push dx
            push bx
            push ax
            mov dh, 3    ; fila
            mov dl, 2    ; columna
            mov bh, 0    ; nro pagina
            mov ah, 02h
            int 10h
            pop ax
            pop bx
            pop dx
            ret
        setcursor endp
        
;inicio opcion 4
               
        pcs_fibonacci proc
        call pcs_encabezado
        ;configuramos consola                      
        mov dh, 07 ;fila
        mov dl, 10 ;columna  
        mov ah, 2
        int 10h 
        ;mostramos en pantalla
        mov ah,09h
        lea dx, avisoFibonacci
        int 21h
        ;configuramos consola                      
        mov dh, 09 ;fila
        mov dl, 10 ;columna  
        mov ah, 2
        int 10h 
        ;mostramos en pantalla
        mov ah,09h
        lea dx, pedirNumFibonacci
        int 21h
        ;configuramos consola                      
        mov dh, 10 ;fila
        mov dl, 10 ;columna  
        mov ah, 2
        int 10h 
        ;mostramos en pantalla
        mov ah,09h
        lea dx, pedirNum2Fibonacci
        int 21h
        
        val1PrimerDigitoFib:
        ;configuramos consola                      
        mov dh, 10 ;fila
        mov dl, 50 ;columna  
        mov ah, 2
        int 10h
        ;guardamos el primer digito del primer numero            
        mov ah,01h
        int 21h
        cmp al, 48
        jb  val1PrimerDigitoFib
        cmp al, 57
        ja  val1PrimerDigitoFib
        sub al,30h
        mov ch,al
        
        val2PrimerDigitoFib:
        ;configuramos consola                      
        mov dh, 10 ;fila
        mov dl, 51 ;columna  
        mov ah, 2
        int 10h 
        ;guardamos el segundo digito del primer numero            
        mov ah,01h
        int 21h
        cmp al, 48
        jb  val2PrimerDigitoFib
        cmp al, 57
        ja  val2PrimerDigitoFib
        sub al,30h
        mov cl,al 
        
        mov x,  0
        mov agrupar1, 0
         
        Agrupar1Fib: 
        cmp x, ch
        je  Agrupar2Fib
        inc x
        add agrupar1, 0Ah
        jmp Agrupar1Fib
                     
        Agrupar2Fib:
        add agrupar1, cl
        
        cmp agrupar1, 25
        jb aceptarPosi
        
        call pcs_fibonacci
        
        aceptarPosi:
        mov x, 0
        mov ax, 1
        mov dx, 0
        mov cx, 0
        mov es, cx
        mov cl, agrupar1
                      
        bucleFibonacci:
        cmp x, cl
        je  resultadoFibonacci
        mov es, ax
        add ax, dx
        mov [002h + bx], ax
        inc bx
        inc x
        mov dx, es
        jmp bucleFibonacci  
        
         
        resultadoFibonacci:
        mov dh, 14 ;fila
        mov dl, 25 ;columna 
        mov ah, 2
        int 10h  
        ;mostramos titulo 
        mov dx, offset mostrarResultado
        mov ah, 9
        int 21h
        
        mov ax, es
        call pcs_mostrarR2
        jmp inicio
            ret
        pcs_fibonacci endp   
        
        
        pcs_mostrarR2 proc
            
        mov cx,0
        mov dx,0
        label1:
            ; if ax is zero
            cmp ax,0
            je print1             
            ;initialize bx to 10
            mov bx,10               
            ; extract the last digit
            div bx                          
            ;push it in the stack
            push dx                     
            ;increment the count
            inc cx             
            ;set dx to 0
            xor dx,dx
            jmp label1
        print1:
            ;check if count
            ;is greater than zero
            cmp cx,0
            je finFib    
            ;pop the top of stack
            pop dx
            ;add 48 so that it
            ;represents the ASCII
            ;value of digits
            add dx,48
            ;interrupt to print a
            ;character
            mov ah,02h
            int 21h
            ;decrease the count
            dec cx
            jmp print1
                   
        finFib:
        mov ah,01h
        int 21h
            
            ret
            
        pcs_mostrarR2 endp
        
                               
;bloque menu encabezado
msgTitulo db  "Arquitectura de Computadoras II", "$" 
msgSemestre db "Octavo Semestre 2022", "$"
msgIdicacion db "Elija una de las siguientes opciones:", "$"
;bloque menu principal
msgOpcion1 db "Operaciones Basicas         [1]", "$"
msgOpcion2 db "Operaciones con Cadenas     [2]", "$"
msgOpcion3 db "Juego                       [3]", "$"
msgOpcion4 db "Sucesion de  Fibonacci      [4]", "$"
msgOpcion5 db "Salida                      [5]", "$"
;bloque menu funciones aritmeticas
opt1Opcion1 db "Suma                        [1]", "$"
opt1Opcion2 db "Resta                       [2]", "$"
opt1Opcion3 db "Multiplicacion              [3]", "$"
opt1Opcion4 db "Regresar                    [4]", "$"
;bloque suma
pedirNum1 db "Ingrese numero 1: " , "$"
pedirNum2 db "Ingrese numero 2: " , "$"
mostrarResultado db   "El resultado es:   ", "$" 
mostrarResultadoNegativo db   "El resultado es:   -", "$"
;variables para operar cadenas
p db 10 dup(?)
p1 db 10 dup(?)
n db 0 
;bloque verificar cadenas palindromas
palindromo1 db "Programa para verificar si una cadena es palindroma", "$"
palindromo2 db "Introduce la cantidad de caracteres de la cadena: ", "$"
palindromo3 db 10,13, "     Introduce la cadena: ", "$"
espalindromo db "La cadena es palindroma", "$"
noespalindromo db "La cadena no es palindroma", "$"
otrapalabra db "Para realizar otra operacion marque", " 's',", " para salir cualquier tecla: ", "$"
repingreso db "La tecla presionada no es un numero", "$" 
;bloque juego ahorcado
MAX_LARGO equ 14
SECRETA db MAX_LARGO+1 dup ('$')
ADIVINO db MAX_LARGO+1 dup ('$')
jugarotravez DB 13,10,"Para jugar de nuevo oprima ", "'s', ", "para salir cualquier tecla: ","$" 
MSG_PERDIO db "Lo siento, la palabra era $"
MSG_GANO db "Felicitaciones!$"
MSG_OCULTA db "Ingrese una palabra y presione Enter.", 13, 10, "$"
MSG_ADIVINE db "Adivine la palabra oculta!", 13, 10, "$"
CRLF db 13, 10, "$"
VIDAS equ aux
AUX db ? ; el largo de la palabra ingresada
CHAR db ?
FILA db 0
COLUMNA db 0
;variable para disenio
x db 0
y db 0
agrupar1 db 0
agrupar2 db 0
;bloque sucesion de fibonacci
pedirNumFibonacci db "Ingrese que posicion de la" , "$"  
pedirNum2Fibonacci db "sucesion de fibonacci desea conocer: " , "$"
avisoFibonacci db "NOTA: Ingrese una posicion entre 0 a 24", "$" 


