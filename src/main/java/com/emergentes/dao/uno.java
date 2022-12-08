
package com.emergentes.dao;

import com.emergentes.modelo.Clientes;
import java.util.List;


public interface uno {
     public void insert(Clientes clientes) throws Exception;
    public void update(Clientes clientes) throws Exception;
    public void delete(int id) throws Exception;
    public List<Clientes> getAll() throws Exception;
    public Clientes getById(int id) throws Exception;
}
