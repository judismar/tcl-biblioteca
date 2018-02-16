#lista para rollback com item inicial (desfazer/refazer)
namespace eval ::lista {

	namespace export cria insere desfazer refazer get imprime
	variable l
	variable pont 0

	namespace ensemble create
}

proc ::lista::cria {item} {
	variable l

	lappend l $item
}

proc ::lista::insere {item} {
	variable l
	variable pont

	set tam [llength $l]
	if {$tam == [expr {$pont+1}]} {
		lappend l $item
	} else {
		set l [lreplace $l [expr {$pont+1}] [expr {$tam-1}] $item]
	}
	incr pont
}

proc ::lista::desfazer {} {
	variable l
	variable pont

	if {$pont > 0} {incr pont -1}
	return [lindex $l $pont]
}

proc ::lista::refazer {} {
	variable l
	variable pont

	if {$pont < [expr {[llength $l]-1}]} {incr pont}
	return [lindex $l $pont]
}

proc ::lista::get {} {
	variable l
	variable pont

	return [lindex $l $pont]
}

proc ::lista::imprime {} {
	variable l

	foreach item $l {
		puts $item
	}
}
