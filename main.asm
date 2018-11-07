; program to convert Celsius temperature to Fahrenheit
; author: Zachary Torricelli
; date: February 22, 2018
; Professor Shelly CSC 203

.586
.MODEL FLAT

INCLUDE io.h														; header file for input/output

.STACK 4096

.DATA
cTemp	DWORD ?														; Celsius temperature
prompt	BYTE	"Enter the temperature in degrees Celsius", 0		; prompt to get the temperature in degrees Celsius. Initial value of 0
string	BYTE	40 DUP (?)											; reserves 40 bytes of storage, uninitialized
resultLbl BYTE	"The temperature in degrees Fahrenheit is", 0		; creates a label for the result. Initial value of 0
fTemp	BYTE	11 DUP (?), 0										; reserves 11 bytes of storage, uninitialized. Initial value of 0

.CODE
_MainProc	PROC
		
		input	prompt, string, 40									; read ASCII characters
		atod	string												; convert to integer
		mov		eax, cTemp											; start with Celsius temperature
		imul	eax, 9												; C*9
		add		eax, 2												; rounding factor for division
		mov		ebx, 5												; divisor
		cdq															; prepare for division
		idiv	ebx													; C*9/5
		add		eax, 32												; C*9/5 + 32
		dtoa	fTemp, eax											; covert to ASCII characters
		output	resultLbl, fTemp									; output label and Fahrenheit temperature
		
		mov		eax, 0												; exit with return code 0
		ret
_MainProc	ENDP
END

