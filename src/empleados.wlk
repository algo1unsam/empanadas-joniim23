object gimenez 
{
	// la linea que sigue es equivalente a todo lo que está debajo.
	// le agrega al objeto: un atributo, el método para acceder, y el método para modificar.
	//	var property sueldo = 15000
	var ganancias = 0
	var sueldo = 15000
	method sueldo() 
	{ 
		return sueldo
	}
	
	method cobrarSueldo() { ganancias +=  sueldo }
	method sueldo(nuevoValor) { sueldo = nuevoValor }
	method totalCobrado() { return ganancias }
}

object baigorria {
	var cantidadEmpanadasVendidas = 1000
	var montoPorEmpanada = 15
	var saldo = 0
	var deuda = 0
	var diferencia = 0
	
	method venderEmpanada() 
	{
		cantidadEmpanadasVendidas += 1
	}
	
	method gastar(cuanto)
	{
		if ( saldo < cuanto )
		{
			//Como es menor el saldo a la cantidad a gastar:
			//utilizo a diferencia para saber en cuanto se endeuda
			//Su saldo es 0 y la diferencia aumenta a la deuda
			diferencia = cuanto - saldo
			saldo = 0
			deuda += diferencia
			diferencia = 0
		}
		else { saldo -= cuanto }
	}
	
	method totalDeuda()	{ return deuda }
	
	method totalDinero() { return saldo }
	method cobrarSueldo() 
	{ 
		saldo += self.sueldo()
		if ( self.totalDeuda() <= saldo)
		{
			saldo -= deuda
			deuda = 0
		}
		else
		{
			deuda -= saldo
			saldo = 0
		}
	}
 	
	method sueldo() = cantidadEmpanadasVendidas * montoPorEmpanada
}

object galvan 
{
	var dinero = 300000
	method dinero() { return dinero }

	method pagarA(empleado) 
	{
    	dinero -= empleado.sueldo()
    	empleado.cobrarSueldo()
	}
}

/* Tener en cuenta este escenario
    Baigorria arranca con 15000 de sueldo, deuda en 0, dinero en 0.
    Baigorria gasta 4000, totalDeuda() debe ser 4000, totalDinero() debe ser 0.
    Baigorria gasta otros 8000, totalDeuda() pasa a 12000, totalDinero() sigue en 0.
    Baigorria cobra, con los 15000 que recibe paga toda su deuda y le sobran 3000 pesos. 
    * Por lo tanto, totalDeuda() debe ser 0, y totalDinero() debe ser 3000.
    Baigorria gasta 25000, cubre 3000 con el dinero que tiene, el resto es deuda. 
    * totalDeuda() queda en 22000, totalDinero() en 0.
    Baigorria cobra, tiene que dedicar los 15000 a pagar deudas, y no le alcanza. 
    * Ahora, totalDeuda() pasa a 7000, y totalDinero() a 0.
 */