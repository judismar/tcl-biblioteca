namespace eval ::matriz {
	namespace export cria destroi modifica valor numerolinhas numerocolunas
	variable lista
	variable nlinhas
	variable ncolunas

	variable id 0
	namespace ensemble create
}

proc ::matriz::cria {nl nc} {
	variable lista
	variable nlinhas
	variable ncolunas
	variable id

	if {$nl <= 0} {error "O número de linhas deve ser maior que zero"}
	if {$nc <= 0} {error "O número de colunas deve ser maior que zero"}

	set token lista[incr id]
	set lista($token) [list]
	for {set i 0} {$i < $nl*$nc} {incr i} {lappend lista($token) 0}
	set nlinhas($token) $nl
	set ncolunas($token) $nc

	return $token
}

proc ::matriz::destroi {token} {
	variable lista
	variable nlinhas
	variable ncolunas
	if {![info exists lista($token)]} {error "Matriz inexistente"}

	unset lista($token)
	unset nlinhas($token)
	unset ncolunas($token)
}

proc ::matriz::modifica {token i j val} {
	variable lista
	variable nlinhas
	variable ncolunas
	if {![info exists lista($token)]} {error "Matriz inexistente"}
	if {$i < 0 || $i >= $nlinhas($token)} {error "Índice 'i' inválido"}
	if {$j < 0 || $j >= $ncolunas($token)} {error "Índice 'j' inválido"}

	lset lista($token) [expr {$ncolunas($token)*$i + $j}] $val
}

proc ::matriz::valor {token i j} {
	variable lista
	variable nlinhas
	variable ncolunas
	if {![info exists lista($token)]} {error "Matriz inexistente"}
	if {$i < 0 || $i >= $nlinhas($token)} {error "Índice 'i' inválido"}
	if {$j < 0 || $j >= $ncolunas($token)} {error "Índice 'j' inválido"}

	return [lindex $lista($token) [expr {$ncolunas($token)*$i + $j}]]
}

proc ::matriz::numerolinhas {token} {
	variable nlinhas
	if {![info exists nlinhas($token)]} {error "Matriz inexistente"}
	return $nlinhas($token)
}

proc ::matriz::numerocolunas {token} {
	variable ncolunas
	if {![info exists ncolunas($token)]} {error "Matriz inexistente"}
	return $ncolunas($token)
}
