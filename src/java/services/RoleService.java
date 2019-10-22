
package services;

import dataaccess.ConnectionPool;
import models.Role;
import dataaccess.RoleDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author 738634
 */
public class RoleService 
{
    public List<Role> getAll() throws Exception
    {
        RoleDB db = new RoleDB();
        ArrayList<Role> roles = (ArrayList<Role>) db.getAll();
        return roles;
    }
    
    public int insert(int roleID, String roleName) throws SQLException
    {
        RoleDB db = new RoleDB();
        Role role = new Role(roleID, roleName);
        return db.insert(role);
    }
    
    public int delete(int roleID) throws SQLException
    {
        RoleDB db = new RoleDB();
        Role role = db.getRole(roleID);
        return db.delete(role);
    }
    
    public int update(int roleID, String roleName) throws SQLException
    {
        RoleDB db = new RoleDB();
        Role role = new Role(roleID, roleName);
        return db.update(role);
    }
}
