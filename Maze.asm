 org 100h

.data

lf equ 0Ah   ;line feed
cr equ 0Dh   ;car return

;*****************GAME LOOP*********************

X db 13h
Y db 14h 
count db 00h
ob1 db "#$"
none db " ","$"
cur equ 02Ah
win1 db "PROXIMA FASE!",13,10,"$"
teste db "!$" 
prem1 db "@","$"
roda db "PERDEU!",13,10,"$"
press db "Pressione ENTER para continuar!",13,10,"$"
point db 00h
sum db "+$"
   

menu db "|---------- THE MAZERODO --------| ",13,10, ;35
     db "|  COMMANDS                      | ",13,10,
     db "|                                | ",13,10,
     db "|  W - UP                        | ",13,10,
     db "|  S - DOWN                      | ",13,10,
     db "|  D - RIGHT                     | ",13,10,
     db "|  A - LEFT                      | ",13,10,
     db "|                                | ",13,10,
     db "|                                | ",13,10,
     db "|       Press Enter to play      | ",13,10,
     db "|                                | ",13,10,
     db "|       DO NOT TOUCH THE #       | ",13,10,
     db "|--------------------------------| ",13,10,"$"
     
fim  db "|--------- CONGRATULATIONS ------| ",13,10, ;35
     db "|                                | ",13,10,
     db "|                                | ",13,10,
     db "|                                | ",13,10,
     db "|                                | ",13,10,
     db "|     THANK YOU FOR PLAYING!     | ",13,10,
     db "|                                | ",13,10,
     db "|                                | ",13,10,
     db "|            Credits             | ",13,10,
     db "|         Gabriel Santi          | ",13,10,
     db "|         Thiago Beppler         | ",13,10,
     db "|                                | ",13,10,
     db "|--------------------------------| ",13,10,"$"
     

msg db "   |-- MAZERODO ACT 1 --|",13,10,
	db "                         ",13,10,	
    db "   |#################!##|",13,10,
    db "   |################# ##|",13,10,
	db "   |################  ##|",13,10, 
	db "   |###########      ###|",13,10,  
	db "   |########### ########|",13,10,   
	db "   |#           ########|",13,10,
	db "   |# ##################|",13,10,
	db "   |# ##################|",13,10,
	db "   |# ##################|",13,10,
	db "   |#            #######|",13,10,
	db "   |############ #######|",13,10,
	db "   |############      ##|",13,10,
	db "   |############ #######|",13,10,
	db "   |############ #######|",13,10,
	db "   |#######      #######|",13,10,
	db "   |####### ############|",13,10,
	db "   |##      ############|",13,10,
	db "   |####### ############|",13,10,
	db "   |#######         ####|",13,10,
	db "   |####################|",13,10,
	db "   --------------------- ",13,10,"$" 
	
	
msg1 db "   |-- MAZERODO ACT 2 --|",13,10,
	db "                         ",13,10,	
    db "   |######## ####### ###|",13,10,
    db "   |################ ###|",13,10,
	db "   |################ ###|",13,10, 
	db "   |################ ###|",13,10,  
	db "   |################ ###|",13,10,   
	db "   |################ ###|",13,10,
	db "   |################ ###|",13,10,
	db "   |############     ###|",13,10,
	db "   |############ #######|",13,10,
	db "   |############ #######|",13,10,
	db "   |############     ###|",13,10,
	db "   |############ #######|",13,10,
	db "   |############ #######|",13,10,
	db "   |############ #######|",13,10,
	db "   |############ #######|",13,10,
	db "   |###    ##### #######|",13,10,
	db "   |######          ####|",13,10,
	db "   |###### ######## ####|",13,10,
	db "   |##     ######## ####|",13,10,
	db "   |####################|",13,10,
	db "   --------------------- ",13,10,"$"
	
msg2 db "   |-- MAZERODO ACT 3 --|",13,10,
	db "                         ",13,10,	
    db "   |####################|",13,10,
    db "   |######       #    ##|",13,10,
	db "   |###### #####   #####|",13,10, 
	db "   |###### #   #########|",13,10,  
	db "   |######   #      ####|",13,10,   
	db "   |###############   ##|",13,10,
	db "   |#########    #### ##|",13,10,
	db "   |####      ## #### ##|",13,10,
	db "   |#### ####### #### ##|",13,10,
	db "   |####      ## ##   ##|",13,10,
	db "   |######### ## ## ####|",13,10,
	db "   |#######   ##    ####|",13,10,
	db "   |####### ############|",13,10,
	db "   |##      ############|",13,10,
	db "   |## #################|",13,10,
	db "   |## #################|",13,10,
	db "   |## ###          ####|",13,10,
	db "   |## ### ######## ####|",13,10,
	db "   |##     ######## ####|",13,10,
	db "   |####################|",13,10,
	db "   --------------------- ",13,10,"$"
	
	
	
msg3 db "   |-- MAZERODO ACT 4 --|",13,10,
	db "                         ",13,10,	
    db "   |####################|",13,10,
    db "   |####              ##|",13,10,
	db "   |#### ###############|",13,10, 
	db "   |#### ########     ##|",13,10,  
	db "   |#### ####     ### ##|",13,10,   
	db "   |#### #### ####### ##|",13,10,
	db "   |#### #### ####### ##|",13,10,
	db "   |####      ####### ##|",13,10,
	db "   |################# ##|",13,10,
	db "   |################# ##|",13,10,
	db "   |######   #        ##|",13,10,
	db "   |###### #   #########|",13,10,
	db "   |#      #############|",13,10,
	db "   |# ######           #|",13,10,
	db "   |# #    # ######### #|",13,10,
	db "   |# # ## # #         #|",13,10,
	db "   |# # ## # ## ########|",13,10,
	db "   |# # ## # ## #   ####|",13,10,
	db "   |#   ##   ##   # ####|",13,10,
	db "   |####################|",13,10,
	db "   --------------------- ",13,10,"$"
		

msg5 db "   |-- MAZERODO ACT 5 --|",13,10,
	db "                         ",13,10,	
    db "   |####################|",13,10,
    db "   |###############   ##|",13,10,
	db "   |#####    #      ####|",13,10, 
	db "   |##### ##   #########|",13,10,  
	db "   |##### ##############|",13,10,   
	db "   |#####              #|",13,10,
	db "   |################## #|",13,10,
	db "   |###                #|",13,10,
	db "   |### ################|",13,10,
	db "   |### ###          ###|",13,10,
	db "   |### ### ######## ###|",13,10,
	db "   |### ### ######## ###|",13,10,
	db "   |### ### ##   ### ###|",13,10,
	db "   |### ### ## # ### ###|",13,10,
	db "   |### ### ## #     ###|",13,10,
	db "   |### ### ## #########|",13,10,
	db "   |### ### ## #########|",13,10,
	db "   |###     ## #    ####|",13,10,
	db "   |##########   ## ####|",13,10,
	db "   |####################|",13,10,
	db "   --------------------- ",13,10,"$"
     

.code

start:
   
    mov count,00h ;zera count de fase
    
    MOV AX,03h ;ajusta o modo de vídeo: AL = 03h, modo texto
    INT 10h     

    mov ah,0006h    ;inicio da linha
    mov dl,cr
    
    MOV AX, SEG menu
    MOV ES,AX
    MOV BP, OFFSET menu

    MOV AH, 13h
    MOV AL, 0 
    MOV DH, 0
    MOV DL, 0
    MOV BL, 0Ah
    MOV CX, 478d ;tamanho da string
    INT 10h
    
    mov ah,08h
    int 21h
    cmp al,0Dh
    jnz start
    jmp fase1
    
  fase1:  
  call limpa
    mov X,13h
    mov Y,14h
    
    ;mostra maze
    MOV AX, SEG msg
    MOV ES,AX
    MOV BP, OFFSET msg

    MOV AH, 13h
    MOV AL, 0 
    MOV DH, 0
    MOV DL, 0
    MOV BL, 0Bh
    MOV CX, 619d ;tamanho da string
    INT 10h 
    
    MOV AX, SEG teste
    MOV ES,AX
    MOV BP, OFFSET teste

    MOV AH, 13h
    MOV AL, 0 
    MOV DH, 02h
    MOV DL, 15h
    MOV BL, 0Ch
    MOV CX, 1d ;tamanho da string
    INT 10h 
    
           
    
    MOV AX, SEG prem1
    MOV ES,AX
    MOV BP, OFFSET prem1

    MOV AH, 13h
    MOV AL, 0 
    MOV DH, 12h
    MOV DL, 06h
    MOV BL, 0Eh
    MOV CX, 1d ;tamanho da string
    INT 10h
    
    
    MOV AX, SEG prem1
    MOV ES,AX
    MOV BP, OFFSET prem1

    MOV AH, 13h
    MOV AL, 0 
    MOV DH, 0Dh
    MOV DL, 15h
    MOV BL, 0Ch
    MOV CX, 1d ;tamanho da string
    INT 10h              
        
    
    ;cursor inicial
    MOV AH, 13h
    mov dl,X
    mov dh,Y
    mov ah,02h  
    MOV BL,0Fh 
    MOV CX,1d
    int 10h 
    
    mov ah,0eh
    mov bx,0071h
    mov al,cur
    int 10h 
    jmp main
    
fase2:
    call limpa
    mov X,13h
    mov Y,14h 
     
 
    
    
    ;mostra maze
    MOV AX, SEG msg1
    MOV ES,AX
    MOV BP, OFFSET msg1

    MOV AH, 13h
    MOV AL, 0 
    MOV DH, 0
    MOV DL, 0
    MOV BL, 0Ch
    MOV CX, 619d ;tamanho da string
    INT 10h
    
    MOV AX, SEG teste
    MOV ES,AX
    MOV BP, OFFSET teste

    MOV AH, 13h
    MOV AL, 0 
    MOV DH, 02h
    MOV DL, 0Ch
    MOV BL, 0Fh
    MOV CX, 1d ;tamanho da string
    INT 10h 
     
     ;cursor inicial 
    MOV AH, 13h
    mov dl,X
    mov dh,Y
    mov ah,02h  
    MOV BL,0Fh 
    MOV CX,1d
    int 10h 
    
    mov ah,0eh
    mov bx,0071h
    mov al,cur
    int 10h
    jmp main
    
fase3:

  call limpa
    mov X,13h
    mov Y,14h
    
    ;mostra maze
    MOV AX, SEG msg2
    MOV ES,AX
    MOV BP, OFFSET msg2

    MOV AH, 13h
    MOV AL, 0 
    MOV DH, 0
    MOV DL, 0
    MOV BL, 0Ah
    MOV CX, 619d ;tamanho da string
    INT 10h 
    
    MOV AX, SEG teste
    MOV ES,AX
    MOV BP, OFFSET teste

    MOV AH, 13h
    MOV AL, 0 
    MOV DH, 02h
    MOV DL, 15h
    MOV BL, 0Ch
    MOV CX, 1d ;tamanho da string
    INT 10h 
    
      ;cursor inicial 
    MOV AH, 13h
    mov dl,X
    mov dh,Y
    mov ah,02h  
    MOV BL,0Fh 
    MOV CX,1d
    int 10h 
    
    mov ah,0eh
    mov bx,0071h
    mov al,cur
    int 10h
    jmp main
    


fase4:

  call limpa
    mov X,13h
    mov Y,14h
    
    ;mostra maze
    MOV AX, SEG msg3
    MOV ES,AX
    MOV BP, OFFSET msg3

    MOV AH, 13h
    MOV AL, 0 
    MOV DH, 0
    MOV DL, 0
    MOV BL, 0Eh
    MOV CX, 619d ;tamanho da string
    INT 10h 
    
    MOV AX, SEG teste
    MOV ES,AX
    MOV BP, OFFSET teste

    MOV AH, 13h
    MOV AL, 0 
    MOV DH, 02h
    MOV DL, 15h
    MOV BL, 0Dh
    MOV CX, 1d ;tamanho da string
    INT 10h 
    
      ;cursor inicial 
    MOV AH, 13h
    mov dl,X
    mov dh,Y
    mov ah,02h  
    MOV BL,0Fh 
    MOV CX,1d
    int 10h 
    
    mov ah,0eh
    mov bx,0071h
    mov al,cur
    int 10h
    jmp main
    jmp main 
    
fase5:

  call limpa
    mov X,13h
    mov Y,14h
    
    ;mostra maze
    MOV AX, SEG msg5
    MOV ES,AX
    MOV BP, OFFSET msg5

    MOV AH, 13h
    MOV AL, 0 
    MOV DH, 0
    MOV DL, 0
    MOV BL, 0Bh
    MOV CX, 619d ;tamanho da string
    INT 10h 
    
    MOV AX, SEG teste
    MOV ES,AX
    MOV BP, OFFSET teste

    MOV AH, 13h
    MOV AL, 0 
    MOV DH, 02h
    MOV DL, 15h
    MOV BL, 0Dh
    MOV CX, 1d ;tamanho da string
    INT 10h 
     
      ;cursor inicial 
    MOV AH, 13h
    mov dl,X
    mov dh,Y
    mov ah,02h  
    MOV BL,0Fh 
    MOV CX,1d
    int 10h 
    
    mov ah,0eh
    mov bx,0071h
    mov al,cur
    int 10h
    jmp main 
    jmp main    
    
main: 

    ;le teclado
    mov ah,01h
    int 16h
    jz  compara
    
    mov ah,08
    int 10h
    cmp al,40h
    jz fase1
         
    
    mov ah, 0   ; get
    int 16h
    jmp compara
    
    cmp count,3h
    jz congrat
    

               
    
compara:    ;verifica qual lado deve ir 
    
    cmp al,64h
    jz right
    cmp al,61h
    jz left
    cmp al,77h
    jz up
    cmp al,73h
    jz down
   jmp main


        
        
right:  ;move cursor direita
  inc X
    mov ah,02h
    mov dl,X
    mov dh,Y  
    int 10h 
    
    mov ah,08
    int 10h
    cmp al,21h
    jz win
    cmp al,23h
    jz lose
    cmp al,47h
    jz fase1
    dec X
    



    ;limpa
    mov ah,02h
    mov dl,X
    mov dh,Y  
    int 10h 
    
    mov ah,0eh
    mov bx,0071h
    mov al,' '
    int 10h
    inc X 
       
    mov ah,02h
    mov dl,X
    mov dh,Y  
    int 10h 
    
    mov ah,0eh
    mov bx,0071h
    mov al,cur
    int 10h
    
    jmp main  
    
left:  ;move cursor esquerda

dec X
    mov ah,02h
    mov dl,X
    mov dh,Y  
    int 10h 
    
    mov ah,08
    int 10h
    cmp al,21h
    jz win
    cmp al,23h
    jz lose
    cmp al,47h
    jz fase1
    inc X
 

  ;limpa
    mov ah,02h
    mov dl,X
    mov dh,Y  
    int 10h 
    
    mov ah,0eh
    mov bx,0071h
    mov al,' '
    int 10h
    
    dec X 
       
    mov ah,02h
    mov dl,X
    mov dh,Y  
    int 10h 
    
    mov ah,0eh
    mov bx,0071h
    mov al,cur
    int 10h 
    
   jmp main 
   
up: ;move cursor cima

    dec Y
    mov ah,02h
    mov dl,X
    mov dh,Y  
    int 10h 
    
    mov ah,08
    int 10h
    cmp al,21h
    jz win
    cmp al,23h
    jz lose
    cmp al,47h
    jz fase1
    inc Y

;limpa


    mov ah,02h
    mov dl,X
    mov dh,Y  
    int 10h 
    
    mov ah,0eh
    mov bx,0071h
    mov al,' '
    int 10h
    dec Y 
       
    mov ah,02h
    mov dl,X
    mov dh,Y  
    int 10h 
    
    mov ah,0eh
    mov bx,0071h
    mov al,cur
    int 10h 
    
   jmp main 


down: ;move cursor baixo

    inc Y
    mov ah,02h
    mov dl,X
    mov dh,Y  
    int 10h 
    
    mov ah,08
    int 10h
    cmp al,21h
    jz win
    cmp al,23h
    jz lose
    cmp al,47h
    jz fase1
    dec Y
     
 ;limpa
    mov ah,02h
    mov dl,X
    mov dh,Y  
    int 10h 
    
    mov ah,0eh
    mov bx,0071h
    mov al,' '
    int 10h
    inc Y 
       
    mov ah,02h
    mov dl,X
    mov dh,Y  
    int 10h 
    
    mov ah,0eh
    mov bx,0071h
    mov al,cur
    int 10h 
    
   jmp main 
   
win:
    cmp count,1h
    jae win2
    inc count     
   
    call limpa
    MOV AX, SEG win1
    MOV ES,AX
    MOV BP, OFFSET win1

    MOV AH, 13h
    MOV AL, 0 
    MOV DH, 30
    MOV DL, 20
    MOV BL, 0Ch
    MOV CX, 13d ;tamanho da string
    INT 10h
    
    MOV AX, SEG press
    MOV ES,AX
    MOV BP, OFFSET press

    MOV AH, 13h
    MOV AL, 0 
    MOV DH, 1h
    MOV DL, 0h
    MOV BL, 09h
    MOV CX, 31d ;tamanho da string
    INT 10h
    
    mov ah,08
    int 21h
    cmp al,0Dh
    jz fase2
    
  
  win2:
    cmp count,2h
    jae win3
    inc count
       
   
    call limpa
    MOV AX, SEG win1
    MOV ES,AX
    MOV BP, OFFSET win1

    MOV AH, 13h
    MOV AL, 0 
    MOV DH, 30
    MOV DL, 20
    MOV BL, 0Ch
    MOV CX, 13d ;tamanho da string
    INT 10h
    
    MOV AX, SEG press
    MOV ES,AX
    MOV BP, OFFSET press

    MOV AH, 13h
    MOV AL, 0 
    MOV DH, 1h
    MOV DL, 0h
    MOV BL, 09h
    MOV CX, 31d ;tamanho da string
    INT 10h
    
    mov ah,08
    int 21h
    cmp al,0Dh
    jz fase3
    
 

 win3:
   
    
    cmp count,3h
    jae win4
    inc count
    call limpa
    
    MOV AX, SEG win1
    MOV ES,AX
    MOV BP, OFFSET win1

    MOV AH, 13h
    MOV AL, 0 
    MOV DH, 30
    MOV DL, 20
    MOV BL, 0Ch
    MOV CX, 13d ;tamanho da string
    INT 10h
    
    MOV AX, SEG press
    MOV ES,AX
    MOV BP, OFFSET press 

    MOV AH, 13h
    MOV AL, 0 
    MOV DH, 1h
    MOV DL, 0h
    MOV BL, 09h
    MOV CX, 31d ;tamanho da string
    INT 10h
    
    mov ah,08
    int 21h
    cmp al,0Dh
    jz fase4
    
win4:
   
    call limpa
    cmp count,4h
    jae win5
    inc count
    
    
    MOV AX, SEG win1
    MOV ES,AX
    MOV BP, OFFSET win1

    MOV AH, 13h
    MOV AL, 0 
    MOV DH, 30
    MOV DL, 20
    MOV BL, 0Ch
    MOV CX, 13d ;tamanho da string
    INT 10h
    
    MOV AX, SEG press
    MOV ES,AX
    MOV BP, OFFSET press

    MOV AH, 13h
    MOV AL, 0 
    MOV DH, 1h
    MOV DL, 0h
    MOV BL, 09h
    MOV CX, 31d ;tamanho da string
    INT 10h
    
    mov ah,08
    int 21h
    cmp al,0Dh
    jz fase5
   
    
win5:
   
    call limpa
    cmp count,5h
    jae congrat
    inc count
    
    
    MOV AX, SEG win1
    MOV ES,AX
    MOV BP, OFFSET win1

    MOV AH, 13h
    MOV AL, 0 
    MOV DH, 30
    MOV DL, 20
    MOV BL, 0Ch
    MOV CX, 13d ;tamanho da string
    INT 10h
    
    MOV AX, SEG press
    MOV ES,AX
    MOV BP, OFFSET press

    MOV AH, 13h
    MOV AL, 0 
    MOV DH, 1h
    MOV DL, 0h
    MOV BL, 09h
    MOV CX, 31d ;tamanho da string
    INT 10h
    
    mov ah,08
    int 21h
    cmp al,0Dh
    jz congrat
    jmp congrat    

 
congrat:
  call limpa  
  
    MOV AX, SEG fim
    MOV ES,AX
    MOV BP, OFFSET fim

    MOV AH, 13h
    MOV AL, 0 
    MOV DH, 0
    MOV DL, 0
    MOV BL, 0Ah
    MOV CX, 478d ;tamanho da string
    INT 10h
 
    mov ah,08h
    int 21h
    cmp al,0Dh
    jnz congrat
    
    
    jmp start
    
lose:     
   
    call limpa
    MOV AX, SEG roda
    MOV ES,AX
    MOV BP, OFFSET roda

    MOV AH, 13h
    MOV AL, 0 
    MOV DH, 0h
    MOV DL, 0h
    MOV BL, 0Ch
    MOV CX, 6d ;tamanho da string
    INT 10h 
    
    MOV AX, SEG press
    MOV ES,AX
    MOV BP, OFFSET press

    MOV AH, 13h
    MOV AL, 0 
    MOV DH, 1h
    MOV DL, 0h
    MOV BL, 09h
    MOV CX, 31d ;tamanho da string
    INT 10h 
    
    mov X,13h
    mov Y,15h
    
    mov ah,08h
    int 21h
    cmp al,0Dh
    jnz lose
    
    
    jmp start

ret      
   
; limpa a tela e preenche com espaços
limpa:
	MOV AH, 6
	MOV AL, 0
	MOV BH, 7
	MOV CX, 0
	MOV DL, 79
	MOV DH, 25
	INT 10h
	MOV AH, 2
	MOV BH, 0
	MOV DH, 0
	MOV DL, 0
	INT 10h
ret

 