/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ABMs;

import static BD.ConexionBD.abrirBase;
import Modelos.Articulo;
import Utiles.DatosGenericos;
import org.javalite.activejdbc.Base;

/**
 *
 * @author alan
 */
public class ABMArticulos {


    public boolean Alta(Articulo a) {
        boolean res = true;
        abrirBase();
        Base.openTransaction();
        res = a.saveIt() && res;
        Base.commitTransaction();
         
        return res;

    }

    public boolean Modificar(Articulo a) {
        boolean res = true;
        abrirBase();
        Base.openTransaction();
        res = a.saveIt() && res;
        Base.commitTransaction();
         
        return res;

    }

    public boolean Eliminar(Articulo a) {
        boolean res = true;
        abrirBase();
        Base.openTransaction();
        res = a.delete() && res;
        Base.commitTransaction();
         
        return res;
    }

}
