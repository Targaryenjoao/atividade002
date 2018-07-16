/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package atividade;

/**
 *
 * @author aluno
 */
public class Funcao {

    /**
     * @return the acessorestrito
     */
    public boolean isAcessorestrito() {
        return acessorestrito;
    }

    /**
     * @param acessorestrito the acessorestrito to set
     */
    public void setAcessorestrito(boolean acessorestrito) {
        this.acessorestrito = acessorestrito;
    }

    /**
     * @return the descricao
     */
    public String getDescricao() {
        return descricao;
    }

    /**
     * @param descricao the descricao to set
     */
    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
    private boolean acessorestrito;
    private String descricao;
}
