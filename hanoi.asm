.data
	prompt:    .asciiz "Digite n a seguir: "
	message:   .ascii "\n O número de passos minimos para resolver a torre de Hanói é "
	n:         .word 0
		
	
.text
	.globl main
	main:
		#imprime o prompt
		li $v0, 4
		la $a0, prompt
		syscall
		
		#pega o n do imput
		li $v0, 5
		syscall
		
		#guarda o imput em n
		sw $v0, n
		
		# 1 3 7 15 31 63
		
		lw $a0, n
		addi $a1, $zero, 1 #controle
		addi $a2, $zero, 1 #anterior
		addi $a3, $zero, 1 #respostaAtual
		addi $t1, $zero, 1 #resposta
		
		while:
			ble $a0, $a1, exit #condição ($a0 ser menor que controle)
			
			add $t1, $zero, $a3 #zera a respostaAtual
			add $a3, $zero, 0 #zera a respostaAtual
			
			mul $a2, $a2, 2 #f(n-1) vira 2f(n-1)
			addi $a2, $a2, 1 #2f(n-1) vira 2f(n-1)+1
			add $a3, $a3, $a2 #respostaAtual soma com 2f(n-1)+1
			
			add $t1, $a3, 0 #resposta recebe a respostaAtual
			addi $a1, $a1, 1 #soma 1 em controle
			

			j while
			
			
		exit:
		
		
		#printa a message
		li $v0, 4
		la $a0, message
		syscall	
		
		#imprime a resposta
		li $v0, 1
		la $a0, ($t1)
		syscall	
		
		#Avisa que acabou de rodar
		li $v0, 10
		syscall
		