${pojo.getPackageDeclaration()}

<#assign classbody>
    <#include "PojoTypeDeclaration.ftl"/>
{
    <#if !pojo.isInterface()>

    // FIELDS
    /////////

        <#include "PojoFields.ftl"/>

    // CONSTRUCTORS
    ///////////////

        <#include "PojoConstructors.ftl"/>

    // METHODS
    //////////

        <#include "PojoPropertyAccessors.ftl"/>

        <#include "PojoToString.ftl"/>

        <#include "PojoEqualsHashcode.ftl"/>

    <#else>

    // METHODS
    //////////

        <#include "PojoInterfacePropertyAccessors.ftl"/>

    </#if>
    <#include "PojoExtraClassCode.ftl"/>

}
</#assign>

${pojo.generateImports()}
${classbody}