/**
    *   Returns whether the given {@link Object} is equal to this
    *   Object by <em>value</em>; that is, it compares the value of
    *   every property of each of the objects.
    *
    *   @see #hashCode()
    */
    @Override
    public boolean equals( Object x )
    {
        if ( this == x )
            return true;

        if ( x == null )
            return false;

		if ( !(x instanceof ${pojo.getDeclarationName()}) )
		    return false;

${pojo.getDeclarationName()} other = (${pojo.getDeclarationName()}) x;

		return <#foreach property in pojo.getAllPropertiesIterator()><#if property_index != 0>
		    && </#if>this.${property.name} == other.${property.name}</#foreach>;
    }


    /**
    *   Overridden to generate a hashCode based on the current value of each of
    *   this object's properties values.
    */
    @Override
    public int hashCode()
    {
        int result = 17<#foreach property in pojo.getAllPropertiesIterator()>
            + ${property.name}.hashCode()</#foreach>;

        return result;
    }