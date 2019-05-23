/*
 * WARNING: DO NOT EDIT THIS FILE. This is a generated file that is synchronized
 * by MyEclipse Hibernate tool integration.
 *
 * Created Wed Nov 16 14:20:06 CST 2005 by MyEclipse Hibernate Tool.
 */
package com.gzunicorn.hibernate.sysmanager;

import java.io.Serializable;

/**
 * A class that represents a row in the Role table. 
 * You can customize the behavior of this class by editing the class, {@link Role()}.
 * WARNING: DO NOT EDIT THIS FILE. This is a generated file that is synchronized * by MyEclipse Hibernate tool integration.
 */
public abstract class AbstractRole 
    implements Serializable
{
    /** The cached hash code value for this instance.  Settting to 0 triggers re-calculation. */
    private int hashValue = 0;

    /** The composite primary key value. */
    private java.lang.String roleid;

    /** The value of the module association. */
    private java.lang.String moduleid;

    /** The value of the loginuserSet one-to-many association. */
    private java.util.Set loginuserSet;

    /** The value of the rolenodeSet one-to-many association. */
    private java.util.Set rolenodeSet;

    /** The value of the simple rolename property. */
    private java.lang.String rolename;

    /** The value of the simple allowflag property. */
    private java.lang.String allowflag;

    /** The value of the simple enabledflag property. */
    private java.lang.String enabledflag;

    /** The value of the simple rem1 property. */
    private java.lang.String rem1;

    /**
     * Simple constructor of AbstractRole instances.
     */
    public AbstractRole()
    {
    }

    /**
     * Constructor of AbstractRole instances given a simple primary key.
     * @param roleid
     */
    public AbstractRole(java.lang.String roleid)
    {
        this.setRoleid(roleid);
    }

    /**
     * Return the simple primary key value that identifies this object.
     * @return java.lang.String
     */
    public java.lang.String getRoleid()
    {
        return roleid;
    }

    /**
     * Set the simple primary key value that identifies this object.
     * @param roleid
     */
    public void setRoleid(java.lang.String roleid)
    {
        this.hashValue = 0;
        this.roleid = roleid;
    }

    /**
     * Return the value of the RoleNAME column.
     * @return java.lang.String
     */
    public java.lang.String getRolename()
    {
        return this.rolename;
    }

    /**
     * Set the value of the RoleNAME column.
     * @param rolename
     */
    public void setRolename(java.lang.String rolename)
    {
        this.rolename = rolename;
    }

    /**
     * Return the value of the ModuleID column.
     * @return Module
     */
    public java.lang.String getModuleid()
    {
        return this.moduleid;
    }

    /**
     * Set the value of the ModuleID column.
     * @param module
     */
    public void setModuleid(java.lang.String moduleid)
    {
        this.moduleid = moduleid;
    }

    /**
     * Return the value of the AllowFlag column.
     * @return java.lang.String
     */
    public java.lang.String getAllowflag()
    {
        return this.allowflag;
    }

    /**
     * Set the value of the AllowFlag column.
     * @param allowflag
     */
    public void setAllowflag(java.lang.String allowflag)
    {
        this.allowflag = allowflag;
    }

    /**
     * Return the value of the EnabledFlag column.
     * @return java.lang.String
     */
    public java.lang.String getEnabledflag()
    {
        return this.enabledflag;
    }

    /**
     * Set the value of the EnabledFlag column.
     * @param enabledflag
     */
    public void setEnabledflag(java.lang.String enabledflag)
    {
        this.enabledflag = enabledflag;
    }

    /**
     * Return the value of the Rem1 column.
     * @return java.lang.String
     */
    public java.lang.String getRem1()
    {
        return this.rem1;
    }

    /**
     * Set the value of the Rem1 column.
     * @param rem1
     */
    public void setRem1(java.lang.String rem1)
    {
        this.rem1 = rem1;
    }

    /**
     * Return the value of the RoleID collection.
     * @return Loginuser
     */
    public java.util.Set getLoginuserSet()
    {
        return this.loginuserSet;
    }

    /**
     * Set the value of the RoleID collection.
     * @param loginuserSet
     */
    public void setLoginuserSet(java.util.Set loginuserSet)
    {
        this.loginuserSet = loginuserSet;
    }

    /**
     * Return the value of the RoleID collection.
     * @return Rolenode
     */
    public java.util.Set getRolenodeSet()
    {
        return this.rolenodeSet;
    }

    /**
     * Set the value of the RoleID collection.
     * @param rolenodeSet
     */
    public void setRolenodeSet(java.util.Set rolenodeSet)
    {
        this.rolenodeSet = rolenodeSet;
    }

}