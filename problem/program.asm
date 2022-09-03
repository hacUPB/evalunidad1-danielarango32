// Daniel Alejandro Arango Echeverri
// 000438887
// daniel.arangoe@upb.edu.co
(INICIO) 
 @KBD
 D=M
 @84		//T
 D=D-A 
 @CRUZ
 D;JEQ
 
 @KBD
 D=M
 @67		//C
 D=D-A 
 @SETCL
 D;JEQ
 
 @INICIO
 0;JMP
 
  (CRUZ)
 @16400 
 D=A
 @coord 
 M=D 
 @256 
 D=A
 @cont 
 M=D
 @32
 D=A 
 @salto
 M=D
 @Color
 M=1
 @bool
 M=0
 @RECT
 0;JMP

(CRUZ2)
 @20480 
 D=A
 @coord 
 M=D 
 @32 
 D=A
 @cont 
 M=D
 @1
 D=A 
 @salto
 M=D
 @Color
 M=-1
 @bool
 M=1
 @RECT
 0;JMP

 
(SETCL)
 @16384 //16384 + (128*32)
 D=A
 @coord //variable donde inicia el dibujo
 M=D 
 @8192 //candidad de registros a pintar
 D=A
 @cont //contador filas pantalla
 M=D
 @1
 D=A 
 @salto
 M=D
 @Color
 M=0
 @RECT
 0;JMP
 
(RECT)
 @coord //16384 + (128*32)
 D=M
 @pscreen
 M=D //memoria donde inicia la pantalla
 
(PAINT)
 @cont //D=cont
 D=M 
 
 @END
 D;JEQ //if cont = 0 goto END
 
 //@256 Pixeles que se van a pintar bits
 //D=A
 @Color
 D=M 
 @pscreen
 A=M 
 M=D //Pinto de negro el registro inicial
 
 @cont //cont = cont-1
 M=M-1
 
 @salto
 D=M
 
 @pscreen
 M=M+D //M+D
 
 @PAINT
 0;JMP

(END)
@bool
D=M 
@CRUZ2
D;JEQ

 @INICIO
 0;JMP
