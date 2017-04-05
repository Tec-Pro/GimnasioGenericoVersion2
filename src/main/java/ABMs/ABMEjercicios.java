/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ABMs;

import static BD.ConexionBD.abrirBase;
import Modelos.Ejercicio;
import Utiles.DatosGenericos;
import org.javalite.activejdbc.Base;

/**
 *
 * @author A
 */
public class ABMEjercicios {
   

    public boolean Alta(Ejercicio a) {
        boolean res = true;
        abrirBase();
        Base.openTransaction();
        res = a.saveIt() && res;
        Base.commitTransaction();
         
        return res;

    }

    public boolean Modificar(Ejercicio a) {
        boolean res = true;
        abrirBase();
        Base.openTransaction();
        res = a.saveIt() && res;
        Base.commitTransaction();
         
        return res;

    }

    public boolean Eliminar(Ejercicio a) {
        boolean res = true;
        abrirBase();
        Base.openTransaction();
        res = a.delete() && res;
        Base.commitTransaction();
         
        return res;
    }
}
