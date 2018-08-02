<#foreach property in pojo.getAllPropertiesIterator()>
    <#assign type_name=pojo.getJavaTypeName(property, jdk5)>
    <#if pojo.getMetaAttribAsBool(property, "gen-property", true)>
    /*  property: ${property.name}  */
        <#if type_name?starts_with("Set")><#--
    ! ie: it's a Collection type
    --><#assign underlying_type=pojo.getPropertyName(property)?replace('s$', '', 'r')>
    /**
     * Adds the given {@link ${underlying_type}} to the current {@link Set},
     * returning true if the ${underlying_type} was successfully added.
     */
    public boolean add${underlying_type}( ${underlying_type} x) {
        return ${property.name}.add( x );
    }

    /**
     * Removes the given {@link ${underlying_type}} from the {@link Set} of
     * {@link {underlying_type}}s associated to this {@link ${pojo.getDeclarationName()}},
     * returning true if the ${underlying_type} was successfully removed.
     */
    public boolean remove${underlying_type}(${underlying_type} x) {
        return ${property.name}.add( x );
    }

            <#if pojo.hasFieldJavaDoc(property)>
    /**
     * ${pojo.getFieldJavaDoc(property, 4)}
     */
            <#else>
    /**
     * Returns an unmodifiable {@link Set} of the ${underlying_type}s that are
     * currently associated to this {@link ${pojo.getDeclarationName()}}.
     */
            </#if>
    <#include "GetPropertyAnnotation.ftl"/>
    public ${type_name} ${pojo.getGetterSignature(property)}() {
        return java.util.Collections.unmodifiableSet( ${property.name} );
    }

    /**
     * Sets the value of property '${property.name}'.
     */
    protected void set${pojo.getPropertyName(property)}(${pojo.getJavaTypeName(property, jdk5)} set) {
            ${property.name} = set;
    }

        <#else><#-- it's not a Collection type -->
            <#if pojo.hasFieldJavaDoc(property)>
    /**
     * ${pojo.getFieldJavaDoc(property, 4)}
     */
            <#else>
    /**
     * Returns the value of property '${property.name}'.
     */
            </#if>
    <#include "GetPropertyAnnotation.ftl"/>
    ${pojo.getPropertyGetModifiers(property)} ${type_name} ${pojo.getGetterSignature(property)}() {
        return ${property.name};
    }

    /**
     * Sets the value of property '${property.name}'.
     */
    ${pojo.getPropertySetModifiers(property)} void set${pojo.getPropertyName(property)}(${pojo.getJavaTypeName(property, jdk5)} x) {
            ${property.name} = x;
    }
        </#if>

    </#if>

</#foreach>