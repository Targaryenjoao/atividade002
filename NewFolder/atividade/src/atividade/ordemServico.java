/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package atividade;

import static com.sun.org.apache.xalan.internal.lib.ExsltDatetime.date;
import static com.sun.org.apache.xalan.internal.lib.ExsltDatetime.date;

/**
 *
 * @author aluno
 */
public class ordemServico {

    /**
     * @return the data
     */
    public date getData() {
        return data;
    }

    /**
     * @param data the data to set
     */
    public void setData(date data) {
        this.data = data;
    }

    /**
     * @return the valorTotal
     */
    public double getValorTotal() {
        return valorTotal;
    }

    /**
     * @param valorTotal the valorTotal to set
     */
    public void setValorTotal(double valorTotal) {
        this.valorTotal = valorTotal;
    }
   private date data;
   private double valorTotal;
}
