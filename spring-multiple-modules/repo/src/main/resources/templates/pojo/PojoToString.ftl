/*  overridden from Object  */

    /**
    *   Returns a String version of this DAO, including the runtime {@link Class}
    *   name, hashCode, and current property values.
    */
    @Override
    public String toString()
    {
        return "["
            + getClass().getSimpleName()<#foreach property in pojo.getAllPropertiesIterator()>
            + "<#if property_index == 0>: <#else>, </#if>${property.getName()}="
            + ${property.getName()}</#foreach>
            + "]"
        ;
    }
<#--/#if-->